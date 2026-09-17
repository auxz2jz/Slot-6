#!/usr/bin/env bash
set -euo pipefail

ABI="${1:-arm64-v8a}"
API="${API:-26}"
NDK="${ANDROID_NDK_HOME:-${ANDROID_NDK_ROOT:-}}"
if [[ -z "$NDK" ]]; then
  echo "ANDROID_NDK_HOME/ANDROID_NDK_ROOT is not set" >&2
  exit 2
fi
TOOLCHAIN="$NDK/toolchains/llvm/prebuilt/linux-x86_64"
if [[ ! -d "$TOOLCHAIN" ]]; then
  echo "NDK LLVM toolchain not found: $TOOLCHAIN" >&2
  exit 2
fi

case "$ABI" in
  arm64-v8a)
    ARCH=aarch64; CPU=armv8-a; TRIPLE=aarch64-linux-android ;;
  x86_64)
    ARCH=x86_64; CPU=x86-64; TRIPLE=x86_64-linux-android ;;
  armeabi-v7a)
    ARCH=arm; CPU=armv7-a; TRIPLE=armv7a-linux-androideabi ;;
  *) echo "Unsupported ABI: $ABI" >&2; exit 2 ;;
esac

ROOT="$(pwd)"
BUILD="$ROOT/android-native/.build/$ABI"
OUT="$ROOT/android-native/output/$ABI"
rm -rf "$BUILD" "$OUT"
mkdir -p "$BUILD" "$OUT"

git archive HEAD | tar -x -C "$BUILD"
cd "$BUILD"

python3 - <<'PY'
from pathlib import Path
p = Path('fftools/ffmpeg.c')
s = p.read_text()
needle = 'int main(int argc, char **argv)\n{'
if needle not in s:
    raise SystemExit('Could not find ffmpeg main()')
replacement = r'''void ffmpeg_android_cancel(void)
{
    received_sigterm = SIGINT;
    received_nb_signals = 1;
}

int ffmpeg_main(int argc, char **argv)
{
    /* The CLI normally runs once per process. Android calls it repeatedly, so
       reset the top-level state that ffmpeg_cleanup() frees but does not zero. */
    received_sigterm = 0;
    received_nb_signals = 0;
    atomic_store(&transcode_init_done, 0);
    ffmpeg_exited = 0;
    copy_ts_first_pts = AV_NOPTS_VALUE;
    input_files = NULL;
    nb_input_files = 0;
    output_files = NULL;
    nb_output_files = 0;
    filtergraphs = NULL;
    nb_filtergraphs = 0;
    decoders = NULL;
    nb_decoders = 0;'''
s = s.replace(needle, replacement, 1)
p.write_text(s)
PY

CC="$TOOLCHAIN/bin/${TRIPLE}${API}-clang"
CXX="$TOOLCHAIN/bin/${TRIPLE}${API}-clang++"

./configure \
  --target-os=android \
  --arch="$ARCH" \
  --cpu="$CPU" \
  --enable-cross-compile \
  --cc="$CC" \
  --cxx="$CXX" \
  --ar="$TOOLCHAIN/bin/llvm-ar" \
  --nm="$TOOLCHAIN/bin/llvm-nm" \
  --ranlib="$TOOLCHAIN/bin/llvm-ranlib" \
  --strip="$TOOLCHAIN/bin/llvm-strip" \
  --sysroot="$TOOLCHAIN/sysroot" \
  --enable-pic \
  --enable-jni \
  --enable-mediacodec \
  --enable-static \
  --disable-shared \
  --disable-doc \
  --disable-debug \
  --disable-ffplay \
  --disable-ffprobe \
  --enable-ffmpeg \
  --disable-autodetect \
  --disable-network \
  --extra-cflags="-O2 -fPIC" \
  --extra-ldflags="-Wl,-z,max-page-size=16384 -Wl,-z,common-page-size=16384"

make -j"$(nproc)" ffmpeg_g \
  LDEXEFLAGS="-shared -Wl,-soname,libffmpeg_cli.so -Wl,-z,max-page-size=16384 -Wl,-z,common-page-size=16384"

cp ffmpeg_g "$OUT/libffmpeg_cli.so"
cp config.h config_components.h "$OUT/"
mkdir -p "$OUT/include"
for d in libavcodec libavdevice libavfilter libavformat libavutil libswresample libswscale; do
  mkdir -p "$OUT/include/$d"
  find "$d" -maxdepth 1 -name '*.h' -type f -exec cp {} "$OUT/include/$d/" \;
done

"$TOOLCHAIN/bin/llvm-strip" --strip-unneeded "$OUT/libffmpeg_cli.so" || true
file "$OUT/libffmpeg_cli.so"
"$TOOLCHAIN/bin/llvm-readelf" -h "$OUT/libffmpeg_cli.so" | grep -E 'Type:|Machine:'
"$TOOLCHAIN/bin/llvm-readelf" -Ws "$OUT/libffmpeg_cli.so" | grep -E 'ffmpeg_main|ffmpeg_android_cancel' || true

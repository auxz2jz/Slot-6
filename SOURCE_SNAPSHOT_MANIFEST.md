# FFmpeg Studio Android — Source Snapshot Manifest

Checkpoint date: 2026-09-22

## Current verified source package

Artifact filename:
`FFmpegStudioAndroid-native-v0.8.9-fast-trim.zip`

App version:
- versionName: `0.8.9`
- versionCode: `18`

SHA-256 of source ZIP:
`58eec16e582e9e41a19aae48aab07c68958efb815ad69cbc505d70a91d7e14be`

The package is about 44 MB because it contains the FFmpeg source tree and packaged ARM64 binaries.

## Packaged native binaries

These binaries were intentionally kept unchanged across the recent Kotlin/UI releases.

`libffmpeg_exec.so`
SHA-256:
`792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`

`libffprobe_exec.so`
SHA-256:
`cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

## Android-specific files present in the v0.8.9 package

Build/configuration:
- `build.gradle.kts`
- `settings.gradle.kts`
- `gradle.properties`
- `app/build.gradle.kts`
- `app/src/main/AndroidManifest.xml`
- `gradle/wrapper/gradle-wrapper.properties`
- `.github/workflows/android-build.yml`
- `scripts/build_ffmpeg_android.sh`
- `scripts/build_ffmpeg_android.ps1`

Primary Kotlin source:
- `App.kt`
- `Models.kt`
- `ConversionCommands.kt`
- `ConversionManager.kt`
- `ConversionService.kt`
- `MediaProbe.kt`
- `Diagnostics.kt`
- `SystemTelemetry.kt`
- `SavedPresets.kt`
- `BuildTestGuide.kt`
- `EncodingAdvisor.kt`
- `FormatCompatibility.kt`
- `TargetSizeCalculator.kt`
- `MediaCodecResolver.kt`
- `Timecode.kt`
- `CommandTokenizer.kt`
- `EngineLocator.kt`
- `ContentFiles.kt`
- `MainActivity.kt`

Resources:
- `app/src/main/res/values/themes.xml`
- `app/src/main/res/values/strings.xml`
- `app/src/main/res/drawable/ic_conversion.xml`

Documentation in the package:
- `README.md`
- `CHANGELOG.md`
- `THIRD_PARTY_NOTICES.md`
- `BUILD_ON_GITHUB.md`
- versioned test plans including `V089_TEST_PLAN.md`

## Important source-state warning

The repository branch historically contained FFmpeg upstream source plus Android roadmap/build material rather than the full evolving Android application source tree.

Therefore:

**Do not assume the Android app code visible on the GitHub branch is automatically equivalent to the verified v0.8.9 ZIP.**

Before editing in a new chat:
1. read the handoff/status files;
2. confirm whether the current v0.8.9 Android source tree has been materialized/committed;
3. if source is older, do not overwrite the verified v0.8.9 behavior from older code;
4. preserve the exact artifact identity/hashes above when comparing copies.

## Features that must survive any source reconciliation

- H.264 hardware -> MKV automatic seek-index finalization/remux.
- serialized Run ID/report IDs/fingerprints.
- deep diagnostics and container seek probes.
- capability-aware MediaCodec validation.
- personal Saved Presets.
- diagnostic preset Settings toggle.
- spotlight tutorial / compact inline info UX.
- Test This Build system.
- Audio Extraction including Opus.
- WebM + Opus.
- MPEG-TS.
- VP8/VP9/AV1 Android paths.
- Smart Target guard for VP8/VP9/AV1.
- fast stream-copy Trim.
- corrected audio-only output-size estimate.
- scrollable development test instructions.

## Next source change

Next planned release should begin from the v0.8.9 behavior and implement **Split**, plus:
- suppress video/keyframe warnings for audio-only outputs;
- improve short-clip seek-probe eligibility.


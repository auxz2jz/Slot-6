# FFmpeg Studio Android v0.9.9.1 compile-fix manifest

- versionName: `0.9.9.1`
- versionCode: `30`
- artifact: `FFmpegStudioAndroid-native-v0.9.9.1-action-trace-compile-fix.zip`
- ZIP SHA-256: `a47ac2e869e6aaf764392be0be0d186e6bc9c16592f6a7eb39082625dca8d68a`
- direct base: v0.9.9 Action Trace candidate
- fix: remove invalid explicit pointer-input import; member call remains inside `pointerInput`.
- Action Trace/media behavior otherwise unchanged.
- v0.9.8.1 remains the last physically verified fallback until this candidate builds/runs.

Native binaries unchanged:
- FFmpeg: `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- ffprobe: `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

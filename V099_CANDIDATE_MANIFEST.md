# FFmpeg Studio Android v0.9.9 candidate manifest

- versionName: `0.9.9`
- versionCode: `29`
- artifact: `FFmpegStudioAndroid-native-v0.9.9-action-trace-candidate.zip`
- ZIP SHA-256: `ca6c2ff7897613f7f0bf55097a8a9872175f3cb5ccba05d7c5f87e3b0add0cc6`
- direct base: successful v0.9.8.1

Native binaries unchanged:
- FFmpeg: `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- ffprobe: `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

New source: `ActionTrace.kt`.

Implements rolling local action tracing, Settings export/clear controls, ffprobe launch-state instrumentation, privacy sanitization, and conversion/orientation/UI event capture.

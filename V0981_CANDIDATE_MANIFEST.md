# FFmpeg Studio Android v0.9.8.1 compile-fix manifest

- versionName: `0.9.8.1`
- versionCode: `28`
- artifact: `FFmpegStudioAndroid-native-v0.9.8.1-compact-ui-ruler-compile-fix.zip`
- ZIP SHA-256: `445366602c6f44ed04c1237248dcee69b75ef25ddda971f863178d07cc59f7b5`

Compile fix:
- App.kt project ruler changed `coerceAtLeast(1.0)` -> `coerceAtLeast(1f)`.

Native binaries unchanged:
- FFmpeg: `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- ffprobe: `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

No intended UI or media-processing behavior changes.

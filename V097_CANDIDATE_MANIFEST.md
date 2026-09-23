# FFmpeg Studio Android v0.9.7 candidate manifest

Status: **candidate / awaiting Android Studio and phone verification**

- versionName: `0.9.7`
- versionCode: `26`
- artifact: `FFmpegStudioAndroid-native-v0.9.7-compact-editor-candidate.zip`
- ZIP SHA-256: `ef306a2ec27e164dcb49b508123c224fd70f26bb1bd48f4ca7be5c6cf69b27aa`
- direct base: v0.9.6 Single Unified Timeline Editor

Native binaries unchanged:
- FFmpeg: `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- ffprobe: `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

Changes:
- flatter divider-based Editor sections;
- reduced Editor padding/spacing;
- V1 height 108 dp -> 72 dp;
- smaller clip minimum width and thumbnail generation;
- compact A1 / Join source labels;
- orientation configuration handling to preserve active Editor/project state;
- processing engine and decoder guard unchanged.

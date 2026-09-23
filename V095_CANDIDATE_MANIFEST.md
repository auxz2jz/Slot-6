# FFmpeg Studio Android v0.9.5 candidate manifest

Status: **candidate / awaiting Android Studio and phone verification**

- versionName: `0.9.5`
- versionCode: `24`
- artifact: `FFmpegStudioAndroid-native-v0.9.5-unified-editor-candidate.zip`
- ZIP SHA-256: `bd01d729d06563691be76421828a79836a5356cfefe5f61544034d11c4b415b9`
- direct base: v0.9.4 Multi-clip Timeline + Normalize & Join

Native binaries unchanged:
- FFmpeg: `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- ffprobe: `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

v0.9.4 phone findings:
- multi-clip timeline scrub passed;
- three-clip Fast Join passed;
- Normalize & Join failed on VP9/AV1-containing test sets with decoder errors/code 69.

v0.9.5 changes:
- unified Project V1 inside Main editor;
- standalone quick tools preserved;
- VP9/AV1 normalization guard;
- supported normalization retained;
- native engine and seek-index repair unchanged.

# FFmpeg Studio Android v0.9.1 candidate manifest

Status: **candidate / awaiting Android Studio and phone verification**

- versionName: `0.9.1`
- versionCode: `20`
- artifact: `FFmpegStudioAndroid-native-v0.9.1-visual-timeline-candidate.zip`
- SHA-256: `66a89fba3995feffdecb46fb6e6b8108c53cf5c1367704955fc8315a466a253c`
- direct base v0.9.0 SHA-256: `3bc36bcc7619f1fd9962e700e41d1fe84945f5daca564d57369eb1a1a4bc6304`
- v0.8.9 verified lineage SHA-256: `58eec16e582e9e41a19aae48aab07c68958efb815ad69cbc505d70a91d7e14be`

Native binaries remain unchanged:
- FFmpeg: `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- ffprobe: `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

Changes:
- embedded video preview;
- eight local timeline thumbnails;
- V1 source-video track with playhead/trim boundaries;
- draggable trim range and Set In/Set Out;
- timeline -> existing Fast Trim;
- timeline -> existing Split;
- A1 source-audio row for future multi-track expansion.

A full Android build is not available in the source-creation container; device verification is required.

# FFmpeg Studio Android v0.9.3 candidate manifest

Status: **candidate / awaiting Android Studio and phone verification**

- versionName: `0.9.3`
- versionCode: `22`
- artifact: `FFmpegStudioAndroid-native-v0.9.3-visual-join-candidate.zip`
- ZIP SHA-256: `d5f3fa2e6ae1ffa696c72072fec310691cf26ef882585c89247f662619486ed8`
- direct base: v0.9.2 Live Timeline Scrubbing
- diagnostic schema: `5`

Native binaries unchanged:
- FFmpeg: `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- ffprobe: `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

Candidate changes:
- new Join / merge operation;
- second source URI/name/probe state;
- two-clip V1 visual Join strip;
- fixed Clip 1 -> Clip 2 order;
- MKV concat-demuxer stream-copy Join;
- compatibility validation for current fast Join path;
- secondary source details in diagnostics;
- combined expected duration and approximate size.

Verification performed before packaging:
- exact v0.9.2 source package used as the direct base;
- native binary hashes rechecked and unchanged;
- external FFmpeg test joined two matching MKV clips using the same concat/stream-copy strategy;
- joined duration matched the expected sum;
- joined output size stayed close to the two inputs combined;
- random seek probes landed on valid indexed/keyframe packets across the joined file;
- source-level Kotlin comparison showed no new syntax/exhaustive-when errors relative to v0.9.2.

Environment limitation:
A full Android Studio build was not available in the source-creation environment, so Android Studio compile/install and physical phone verification are still required.

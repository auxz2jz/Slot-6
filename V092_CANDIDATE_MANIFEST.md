# FFmpeg Studio Android v0.9.2 candidate manifest

Status: **candidate / awaiting phone verification**

- versionName: `0.9.2`
- versionCode: `21`
- artifact: `FFmpegStudioAndroid-native-v0.9.2-live-scrub-candidate.zip`
- ZIP SHA-256: `573ed5499f6fa86253e24ea4d334b1974e2b9508d570fcdc4e36b902200bbb92`
- direct base: v0.9.1 Visual Timeline Foundation
- change scope: Android UI/timeline scrubbing only

Native binaries unchanged:
- FFmpeg: `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- ffprobe: `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

Changes:
- actual-frame paused scrub preview using MediaMetadataRetriever;
- final VideoView seek after slider release;
- V1 filmstrip height 72 dp -> 96 dp;
- existing Trim/Split pipelines and navigation preserved.

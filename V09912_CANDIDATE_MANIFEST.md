# FFmpeg Studio Android v0.9.12 candidate manifest

Status: candidate / awaiting Android Studio and phone verification.

- versionName: `0.9.12`
- versionCode: `34`
- artifact: `FFmpegStudioAndroid-native-v0.9.12-timestamp-reorder-candidate.zip`
- ZIP SHA-256: `f10d146c2def12191d8c048312759cf1422dbee51fba69acd57dffaf43bf93f2`
- direct base: physically accepted v0.9.11

Changes:
- selected project clip Move left / Move right;
- split parts reorder with their source ranges intact;
- edited Fast Join prepares clean ranged stream-copy MKV segments before final concat;
- no direct concat inpoint/outpoint for edited Fast Join;
- non-monotonic DTS automatic diagnostic observation;
- Action Trace reorder and segment-preparation events;
- native binaries preserved.

Native hashes:
- FFmpeg: `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- ffprobe: `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

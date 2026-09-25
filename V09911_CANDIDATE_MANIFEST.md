# FFmpeg Studio Android v0.9.11 candidate manifest

Status: candidate / awaiting Android Studio and phone verification.

- versionName: `0.9.11`
- versionCode: `33`
- artifact: `FFmpegStudioAndroid-native-v0.9.11-selected-clip-edit-candidate.zip`
- ZIP SHA-256: `7c5f8b528f95ec67cdcfd600c977132c5dba765af6762495c60c3cae6d8e476b`
- direct base: accepted v0.9.10

Changes:
- selected project clip from V1/list;
- selected-clip preview;
- non-destructive per-clip Trim ranges;
- virtual Split into adjacent project segments;
- range-aware Fast Join via inpoint/outpoint;
- range-aware Normalize & Join via trim/atrim;
- edited duration/ruler/size estimates;
- v0.9.10 Clip Manager, v0.9.9.2 ffprobe fix and Action Trace preserved.

Native hashes unchanged:
- FFmpeg: `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- ffprobe: `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

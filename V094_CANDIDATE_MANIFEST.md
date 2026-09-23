# FFmpeg Studio Android v0.9.4 candidate manifest

Status: candidate / awaiting Android Studio and phone verification

- versionName: 0.9.4
- versionCode: 23
- artifact: FFmpegStudioAndroid-native-v0.9.4-multi-join-candidate.zip
- ZIP SHA-256: 2370a43a09f28ba4c5546b76b55022e2421ea4646082f52a054b614a634b3448
- diagnostic schema: 6
- native FFmpeg SHA-256: 792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7
- native ffprobe SHA-256: cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c

Implemented:
- multiple Join inputs;
- timeline-integrated Add clip(s) / Join;
- global cross-clip scrub preview;
- fast multi-clip stream-copy Join;
- automatic Normalize & Join for mixed formats/codecs/resolutions;
- H.264/AAC MKV normalized output;
- Clip 3+ diagnostics.

Pre-package checks:
- no new Kotlin structural syntax/exhaustive-when/missing-argument errors;
- 3-clip fast Join command test passed;
- mixed MP4/AVI, H.264/MPEG-4, AAC/MP3, differing resolution/fps/sample-rate normalization test passed.

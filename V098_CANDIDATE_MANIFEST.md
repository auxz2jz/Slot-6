# FFmpeg Studio Android v0.9.8 candidate manifest

Status: candidate / awaiting Android Studio and phone verification

- versionName: 0.9.8
- versionCode: 27
- artifact: FFmpegStudioAndroid-native-v0.9.8-compact-ui-ruler-candidate.zip
- ZIP SHA-256: cfb2cba9c3181ca800c988313ed668a73cb35f0790c7b234345e12284265a27d
- direct base: verified v0.9.7

Native binaries unchanged:
- FFmpeg: 792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7
- ffprobe: cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c

Changes:
- app-wide compact UI/shapes;
- Home-only FFmpeg Studio branding;
- one thumbnail per V1 clip plus duration bar;
- no name/time overlays on V1;
- project runtime header;
- zoom-aware synchronized time ruler;
- V1 height 58 dp;
- rotation state and processing engine preserved.

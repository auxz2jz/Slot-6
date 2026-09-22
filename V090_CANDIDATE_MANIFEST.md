# FFmpeg Studio Android v0.9.0 candidate manifest

Status: **candidate / not yet physically verified on the Android test device**

## Base source
- Base artifact: `FFmpegStudioAndroid-native-v0.8.9-fast-trim.zip`
- Base SHA-256: `58eec16e582e9e41a19aae48aab07c68958efb815ad69cbc505d70a91d7e14be`
- Base versionName/versionCode: `0.8.9` / `18`

## Candidate version
- versionName: `0.9.0`
- versionCode: `19`

## Native binaries preserved unchanged
- `libffmpeg_exec.so`: `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- `libffprobe_exec.so`: `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

## Candidate changes
- First Split workflow: one cut point -> two MKV files.
- Split uses FFmpeg segment muxing with `-c copy` and no re-encode.
- Split asks for one output folder and creates Part 1 / Part 2 documents there.
- Multi-output state/service/reporting supports both split files.
- Audio-only outputs skip video keyframe inspection and video-only seek warnings.
- Random-seek probe eligibility lowered from outputs over 30 seconds to outputs at least 3 seconds long when recurring keyframes are present.
- v0.8.3 H.264 hardware -> MKV automatic seek-index rebuild remains unchanged.

## Files intentionally changed from v0.8.9
- `app/build.gradle.kts`
- `app/src/main/java/com/edgar/ffmpegstudio/App.kt`
- `app/src/main/java/com/edgar/ffmpegstudio/BuildTestGuide.kt`
- `app/src/main/java/com/edgar/ffmpegstudio/ConversionCommands.kt`
- `app/src/main/java/com/edgar/ffmpegstudio/ConversionManager.kt`
- `app/src/main/java/com/edgar/ffmpegstudio/ConversionService.kt`
- `app/src/main/java/com/edgar/ffmpegstudio/Diagnostics.kt`
- `app/src/main/java/com/edgar/ffmpegstudio/MediaProbe.kt`
- `app/src/main/java/com/edgar/ffmpegstudio/Models.kt`
- `app/src/main/java/com/edgar/ffmpegstudio/SavedPresets.kt`
- `CHANGELOG.md`
- `V090_TEST_PLAN.md`

## Verification performed before packaging
- Exact v0.8.9 input ZIP SHA-256 matched the saved GitHub handoff manifest.
- Native FFmpeg/ffprobe hashes matched the v0.8.9 manifest after the source changes.
- Kotlin source was run through a structural compiler pass; no new non-environment structural errors remained in the modified files. Full Android compilation was not possible in this container because the Android SDK/Gradle wrapper runtime is not installed here.
- The exact Split FFmpeg strategy was exercised with system FFmpeg on a synthetic MKV. A single requested cut produced two Matroska outputs; the split aligned to a usable keyframe as expected for stream copy.

## Phone verification required
Follow `V090_TEST_PLAN.md` and the in-app **Test This Build** guide. Do not mark Split DONE until the Android-device tests pass.

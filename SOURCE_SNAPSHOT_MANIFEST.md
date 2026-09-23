# FFmpeg Studio Android — Source Snapshot Manifest

Checkpoint date: 2026-09-22

## Current verified source package

Artifact filename:
`FFmpegStudioAndroid-native-v0.8.9-fast-trim.zip`

App version:
- versionName: `0.8.9`
- versionCode: `18`

SHA-256 of source ZIP:
`58eec16e582e9e41a19aae48aab07c68958efb815ad69cbc505d70a91d7e14be`

The package is about 44 MB because it contains the FFmpeg source tree and packaged ARM64 binaries.

## Current unverified candidate package

Artifact filename:
`FFmpegStudioAndroid-native-v0.9.0-split-candidate.zip`

App version:
- versionName: `0.9.0`
- versionCode: `19`

SHA-256 of candidate source ZIP:
`3bc36bcc7619f1fd9962e700e41d1fe84945f5daca564d57369eb1a1a4bc6304`

Base verified v0.8.9 ZIP SHA-256:
`58eec16e582e9e41a19aae48aab07c68958efb815ad69cbc505d70a91d7e14be`

Status:
- source candidate created directly from the verified v0.8.9 package;
- native FFmpeg and ffprobe binaries remain byte-identical to v0.8.9;
- implements one-point Split -> two MKV files, audio-only video-diagnostic suppression, and short-clip seek-probe eligibility;
- includes v0.9.0 Build Tests for Split, audio diagnostics, and H.264/MKV seek regression;
- **not yet verified on-device**;
- full Android compile was not available in the candidate-creation environment, so Android Studio compile/install and physical verification are still required.


## Current v0.9.1 visual timeline candidate

Artifact filename:
`FFmpegStudioAndroid-native-v0.9.1-visual-timeline-candidate.zip`

App version:
- versionName: `0.9.1`
- versionCode: `20`

SHA-256:
`66a89fba3995feffdecb46fb6e6b8108c53cf5c1367704955fc8315a466a253c`

Direct base:
- v0.9.0 Split candidate SHA-256 `3bc36bcc7619f1fd9962e700e41d1fe84945f5daca564d57369eb1a1a4bc6304`.
- v0.8.9 verified lineage SHA-256 `58eec16e582e9e41a19aae48aab07c68958efb815ad69cbc505d70a91d7e14be`.

Status:
- adds only Android UI/editor-layer timeline features;
- preserves native binary hashes and processing commands;
- compact Trim/Split remain available;
- awaiting Android Studio/phone verification.

## Packaged native binaries

These binaries were intentionally kept unchanged across the recent Kotlin/UI releases.

`libffmpeg_exec.so`
SHA-256:
`792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`

`libffprobe_exec.so`
SHA-256:
`cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

## Android-specific files present in the v0.8.9 package

Build/configuration:
- `build.gradle.kts`
- `settings.gradle.kts`
- `gradle.properties`
- `app/build.gradle.kts`
- `app/src/main/AndroidManifest.xml`
- `gradle/wrapper/gradle-wrapper.properties`
- `.github/workflows/android-build.yml`
- `scripts/build_ffmpeg_android.sh`
- `scripts/build_ffmpeg_android.ps1`

Primary Kotlin source:
- `App.kt`
- `Models.kt`
- `ConversionCommands.kt`
- `ConversionManager.kt`
- `ConversionService.kt`
- `MediaProbe.kt`
- `Diagnostics.kt`
- `SystemTelemetry.kt`
- `SavedPresets.kt`
- `BuildTestGuide.kt`
- `EncodingAdvisor.kt`
- `FormatCompatibility.kt`
- `TargetSizeCalculator.kt`
- `MediaCodecResolver.kt`
- `Timecode.kt`
- `CommandTokenizer.kt`
- `EngineLocator.kt`
- `ContentFiles.kt`
- `MainActivity.kt`

Resources:
- `app/src/main/res/values/themes.xml`
- `app/src/main/res/values/strings.xml`
- `app/src/main/res/drawable/ic_conversion.xml`

Documentation in the package:
- `README.md`
- `CHANGELOG.md`
- `THIRD_PARTY_NOTICES.md`
- `BUILD_ON_GITHUB.md`
- versioned test plans including `V089_TEST_PLAN.md`

## Important source-state warning

The repository branch historically contained FFmpeg upstream source plus Android roadmap/build material rather than the full evolving Android application source tree.

Therefore:

**Do not assume the Android app code visible on the GitHub branch is automatically equivalent to the verified v0.8.9 ZIP.**

Before editing in a new chat:
1. read the handoff/status files;
2. confirm whether the current v0.8.9 Android source tree has been materialized/committed;
3. if source is older, do not overwrite the verified v0.8.9 behavior from older code;
4. preserve the exact artifact identity/hashes above when comparing copies.

## Features that must survive any source reconciliation

- H.264 hardware -> MKV automatic seek-index finalization/remux.
- serialized Run ID/report IDs/fingerprints.
- deep diagnostics and container seek probes.
- capability-aware MediaCodec validation.
- personal Saved Presets.
- diagnostic preset Settings toggle.
- spotlight tutorial / compact inline info UX.
- Test This Build system.
- Audio Extraction including Opus.
- WebM + Opus.
- MPEG-TS.
- VP8/VP9/AV1 Android paths.
- Smart Target guard for VP8/VP9/AV1.
- fast stream-copy Trim.
- corrected audio-only output-size estimate.
- scrollable development test instructions.

## Next source change

Verify **v0.9.1 Visual Timeline Foundation** on the phone using `V091_TEST_PLAN.md`.

After that passes, build Join/Merge as multiple movable/sequential clips on the V1 timeline rather than as another isolated text-only tool. Then extend the same timeline with A2/A3 audio tracks, waveforms, music/voiceover, and later additional video tracks/overlays.

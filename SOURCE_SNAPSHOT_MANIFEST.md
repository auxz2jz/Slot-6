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

## Current v0.9.2 live scrub candidate

Artifact filename:
`FFmpegStudioAndroid-native-v0.9.2-live-scrub-candidate.zip`

App version:
- versionName: `0.9.2`
- versionCode: `21`

SHA-256:
`573ed5499f6fa86253e24ea4d334b1974e2b9508d570fcdc4e36b902200bbb92`

Direct base:
- v0.9.1 Visual Timeline Foundation candidate SHA-256 `66a89fba3995feffdecb46fb6e6b8108c53cf5c1367704955fc8315a466a253c`.

Status:
- Android UI/timeline-only change;
- paused scrub preview uses direct source-frame retrieval;
- V1 filmstrip enlarged;
- native binary hashes and processing commands preserved;
- awaiting phone verification.

## Current v0.9.3 visual join candidate

Artifact filename:
`FFmpegStudioAndroid-native-v0.9.3-visual-join-candidate.zip`

App version:
- versionName: `0.9.3`
- versionCode: `22`

SHA-256:
`d5f3fa2e6ae1ffa696c72072fec310691cf26ef882585c89247f662619486ed8`

Direct base:
- v0.9.2 Live Timeline Scrubbing SHA-256 `573ed5499f6fa86253e24ea4d334b1974e2b9508d570fcdc4e36b902200bbb92`.

Status:
- first two-input Join/Merge candidate;
- fixed order Clip 1 -> Clip 2 on V1;
- MKV fast Join uses concat-demuxer stream copy;
- compatibility validation blocks mismatched streams;
- diagnostic schema 5 records both source files;
- external FFmpeg join strategy validated for duration, size, and seeking;
- native binary hashes preserved;
- awaiting Android Studio/phone verification.

## Current v0.9.4 multi-join candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.4-multi-join-candidate.zip`

App version:
- versionName: `0.9.4`
- versionCode: `23`

SHA-256:
`2370a43a09f28ba4c5546b76b55022e2421ea4646082f52a054b614a634b3448`

Direct base:
- v0.9.3 Visual Join candidate.

Status:
- multiple Join inputs;
- timeline-integrated Add clip(s) / Join;
- global cross-clip scrub preview;
- fast multi-clip stream-copy Join;
- automatic mixed-format Normalize & Join;
- diagnostics schema 6;
- native binary hashes preserved;
- awaiting Android Studio/phone verification.

## Current v0.9.5 unified editor candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.5-unified-editor-candidate.zip`

App version:
- versionName: `0.9.5`
- versionCode: `24`

SHA-256:
`bd01d729d06563691be76421828a79836a5356cfefe5f61544034d11c4b415b9`

Direct base:
- v0.9.4 Multi-clip Timeline + Normalize & Join.

Status:
- unified Main editor contains multi-clip Project V1;
- standalone quick tools preserved;
- VP9/AV1 Normalize & Join preflight guard added from phone-log evidence;
- supported normalization remains available;
- native binary hashes preserved;
- awaiting Android Studio/phone verification.

## Current v0.9.6 single timeline candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.6-single-timeline-candidate.zip`

App version:
- versionName: `0.9.6`
- versionCode: `25`

SHA-256:
`2051f229ac8bf6d54c737828c15a2a47c1b8fa57fcd8f9d1af222d809a8e7ab9`

Direct base:
- verified v0.9.5 Unified Editor Timeline + Normalize Guard.

Status:
- one large project-aware preview;
- one horizontal V1 project track;
- global cross-clip scrub;
- 50%-400% horizontal zoom;
- added clips no longer create vertical editor sections;
- Join/Merge shares the same editor surface;
- standalone quick tools preserved;
- media-processing commands/native engine unchanged;
- awaiting Android Studio/phone verification.

## Current v0.9.7 compact editor candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.7-compact-editor-candidate.zip`

App version:
- versionName: `0.9.7`
- versionCode: `26`

SHA-256:
`ef306a2ec27e164dcb49b508123c224fd70f26bb1bd48f4ca7be5c6cf69b27aa`

Direct base:
- v0.9.6 Single Unified Timeline Editor.

Status:
- compact divider-based Editor;
- V1 72 dp;
- smaller clip thumbnails/minimum width;
- compact A1/source labels;
- orientation state preservation;
- native binary hashes and processing logic preserved;
- awaiting Android Studio/phone verification.

## Current v0.9.8 compact UI ruler candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.8-compact-ui-ruler-candidate.zip`

App version:
- versionName: `0.9.8`
- versionCode: `27`

SHA-256:
`cfb2cba9c3181ca800c988313ed668a73cb35f0790c7b234345e12284265a27d`

Direct base:
- verified v0.9.7 Compact Editor Layout + Rotation State.

Status:
- app-wide compact UI;
- Home-only FFmpeg Studio branding;
- one representative thumbnail per V1 clip;
- simple duration bars;
- zoom-aware synchronized project time ruler;
- V1 58 dp;
- native binary hashes and processing logic preserved;
- awaiting Android Studio/phone verification.

## Current v0.9.8.1 compile-fix candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.8.1-compact-ui-ruler-compile-fix.zip`

App version:
- versionName: `0.9.8.1`
- versionCode: `28`

SHA-256:
`445366602c6f44ed04c1237248dcee69b75ef25ddda971f863178d07cc59f7b5`

Direct base:
- v0.9.8 Unified Compact UI + Timeline Ruler candidate.

Fix:
- `App.kt` timeline-ruler Float/Double compile mismatch corrected;
- no intended functional/UI/media changes.

Native binaries remain:
- FFmpeg `792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`
- ffprobe `cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

## Current v0.9.9 Action Trace candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.9-action-trace-candidate.zip`

App version:
- versionName: `0.9.9`
- versionCode: `29`

SHA-256:
`ca6c2ff7897613f7f0bf55097a8a9872175f3cb5ccba05d7c5f87e3b0add0cc6`

Direct base:
- successful v0.9.8.1 recovery artifact.

New source:
- `ActionTrace.kt`

Status:
- persistent rolling UI/runtime trace;
- ffprobe launch-state instrumentation;
- Settings trace export/clear/toggle;
- conversion/action/orientation/error tracing;
- native binaries preserved;
- awaiting Android Studio/phone verification.

## Current v0.9.9.1 Action Trace compile-fix candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.9.1-action-trace-compile-fix.zip`

App version:
- versionName: `0.9.9.1`
- versionCode: `30`

SHA-256:
`a47ac2e869e6aaf764392be0be0d186e6bc9c16592f6a7eb39082625dca8d68a`

Direct base:
- v0.9.9 Action Trace candidate.

Fix:
- remove invalid explicit `awaitPointerEventScope` import;
- Action Trace implementation otherwise unchanged;
- native binary hashes preserved.

## Current v0.9.9.2 ffprobe race-fix candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.9.2-ffprobe-race-fix.zip`

App version:
- versionName: `0.9.9.2`
- versionCode: `31`

SHA-256:
`0f49c10c93796609e0920dd6762548c6b127ad0e0da894a3dec81b66fddb4ed4`

Direct base:
- v0.9.9.1 Action Trace compile-fix source.

Fix:
- unique timestamp + UUID ffprobe workspaces;
- stable app-cache ProcessBuilder working directory for source analysis;
- extra Action Trace workspace/launch-context logging;
- native binary hashes preserved.

## Current v0.9.10 clip-manager candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.10-clip-manager-candidate.zip`

App version:
- versionName: `0.9.10`
- versionCode: `32`

SHA-256:
`b670037c8710eca9efc8cc4950ae2aec9b1d95a253ac85820ed0b740b6fd6e4a`

Direct base:
- physically verified v0.9.9.2.

Changes:
- text-only Project clips list;
- individual Remove;
- automatic gap closing/renumbering;
- true Clear all clips including primary;
- empty-project repopulation through Add clips;
- v0.9.9.2 ffprobe fix/Action Trace preserved;
- native hashes preserved.

## Current v0.9.11 selected-clip edit candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.11-selected-clip-edit-candidate.zip`

App version:
- versionName: `0.9.11`
- versionCode: `33`

SHA-256:
`7c5f8b528f95ec67cdcfd600c977132c5dba765af6762495c60c3cae6d8e476b`

Direct base:
- accepted v0.9.10 Project Clip Manager.

Changes:
- selected project clip state;
- per-clip source start/end ranges;
- non-destructive project Trim;
- virtual project Split;
- selected-clip preview/scrub/playback offsets;
- range-aware Fast Join via inpoint/outpoint;
- range-aware Normalize & Join via trim/atrim;
- project duration/ruler/size estimation follows edits;
- native binary hashes preserved.

## Current v0.9.12 timestamp/reorder candidate

Artifact:
`FFmpegStudioAndroid-native-v0.9.12-timestamp-reorder-candidate.zip`

App version:
- versionName: `0.9.12`
- versionCode: `34`

SHA-256:
`f10d146c2def12191d8c048312759cf1422dbee51fba69acd57dffaf43bf93f2`

Direct base:
- physically accepted v0.9.11 Selected Clip Trim/Split.

Changes:
- selected project clip Move left / Move right;
- split parts reorder like normal clips with source ranges preserved;
- ranged Fast Join clips prepared as clean temporary MKV stream-copy segments before concat;
- automatic non-monotonic DTS observation;
- edited Fast Join diagnostic settings identify prepared-segment path;
- native binary hashes preserved.

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

Build and verify **v0.9.11 Selected Clip Trim/Split** using `V09911_TEST_PLAN.md`.

Do not modify native ffprobe handling unless the intermittent v0.9.8.1-style failure is reproduced with a v0.9.9 Action Trace showing what changed at the failure point.

After trace verification, resume project-aware per-clip Trim/Split/remove/reorder work.

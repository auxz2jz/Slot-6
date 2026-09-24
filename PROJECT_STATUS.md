# FFmpeg Studio Android — Current Project Status

**Last checkpoint:** 2026-09-22  
**Repository:** auxz2jz/Slot-6  
**Android branch:** native-android-v0.2  
**Current verified editor/media baseline:** v0.9.8.1 (versionCode 28), successful on-device recovery baseline
**Current unverified candidate:** v0.9.9.1 (versionCode 30), Action Trace compile fix
**Candidate artifact:** `FFmpegStudioAndroid-native-v0.9.9.1-action-trace-compile-fix.zip`
**Candidate SHA-256:** `a47ac2e869e6aaf764392be0be0d186e6bc9c16592f6a7eb39082625dca8d68a`

This file records the current state that should be carried into a new chat.

## v0.9.0 Split status

A v0.9.0 source candidate has been created directly from the exact verified v0.8.9 source ZIP.

Implemented in v0.9.0:
- **DONE** one cut point -> two MKV files using lossless stream copy (physically verified);
- output-folder selection for the two generated files;
- service/state/diagnostic support for both split outputs;
- suppress video/keyframe warnings for audio-only outputs (implementation present; dedicated audio-only report still pending);
- **DONE** allow short outputs (>=3 s with recurring keyframes) to receive the container random-seek probe (verified on both split outputs);
- preserve the verified H.264 hardware -> MKV seek-index finalization/remux path;
- three v0.9.0 Build Tests: Split, Audio Diagnostics, and H.264 Seek Regression.

The packaged native FFmpeg/ffprobe binaries are unchanged from v0.8.9. A full Android compile was not available in the candidate-creation environment, so Android Studio compile/install plus physical phone verification are the current task.

## v0.9.1 timeline phone feedback

The next bounded editor release has been created from the v0.9.0 Split source candidate.

Implemented in v0.9.1:
- expandable Visual timeline inside Source media;
- embedded video preview with Play/Pause and seeking;
- eight local thumbnail positions;
- V1 source-video track with playhead and visual trim boundaries;
- draggable In/Out range plus Set In / Set Out;
- visual range writes into the existing Fast Trim start/end settings;
- playhead writes into the existing Split time setting;
- A1 source-audio row establishes the multi-track editor structure;
- compact typed Trim/Split controls remain available.

The release deliberately does **not** change FFmpeg commands, native binaries, Split service/diagnostics, or the verified H.264/MKV seek-index finalization path.

Phone feedback: the timeline is visible and generally works, but paused preview frames can lag/stick while the playhead moves by one or two seconds. This becomes the v0.9.2 usability fix.

## v0.9.2 live-scrub verification

Physically verified from user feedback: **the v0.9.2 live-scrub fix worked great on the phone**.

Verified/preserved behavior:
- paused scrub preview uses MediaMetadataRetriever to fetch the actual nearby source frame;
- preview refresh is decoupled from rapid VideoView seek requests;
- the underlying player seeks to the final playhead position after release;
- V1 filmstrip height increased from 72 dp to 96 dp;
- compact Trim/Split controls and existing processing paths remain unchanged.

Status: **DONE for the live-scrub improvement.** Preserve this behavior.

## v0.9.3 candidate status

Implemented, awaiting device verification:
- new Join / merge operation;
- exactly two source clips for the first release;
- second clip has its own persisted Android URI, ffprobe analysis, representative frame, and diagnostics identity;
- V1 shows Clip 1 followed by Clip 2 with proportional duration blocks;
- fixed order in this first release; drag/reorder comes later;
- fast lossless Join uses FFmpeg concat demuxer + stream copy to MKV;
- compatibility validation checks matching video codec/resolution/pixel format and matching audio presence/codec/sample rate/channel count;
- incompatible clips are blocked with an explanation;
- expected output duration is the sum of both sources;
- expected output size is approximately the sum of both sources when known;
- diagnostics schema is now 5 and includes Secondary Source Media;
- compact Trim/Split and the verified live-scrub single-clip timeline are preserved;
- native FFmpeg/ffprobe binaries and H.264/MKV seek-index repair are unchanged.

External FFmpeg testing of the join strategy produced the expected combined duration, near-sum output size, and valid random-seek results. Full Android Studio/device verification is still required.

## v0.9.3 phone verification

User feedback: the v0.9.3 two-clip Join/Merge build **works good**. Treat the first standalone two-clip Join path as verified and preserve it.

## v0.9.4 candidate status

Implemented, awaiting phone verification:
- Join/Merge remains a standalone tool and is also accessible directly from the visual timeline via **Add clip(s) / Join**;
- multiple Join inputs (Clip 1, Clip 2, Clip 3+);
- horizontally scrollable multi-clip V1 blocks with clear clip boundaries;
- one global playhead that scrubs across clips and retrieves the frame from the source under the playhead;
- Fast Join for matching clips using concat-demuxer stream copy;
- automatic Normalize & Join when formats/codecs/resolutions differ;
- Normalize output: H.264 hardware + AAC 192 kbps stereo/48 kHz in MKV, using Clip 1 dimensions and normalized frame rate;
- first normalization release requires audio in every clip;
- diagnostics schema 6 records all Join sources;
- native binaries unchanged and H.264/MKV seek-index repair preserved.

Command-level verification:
- 3 matching clips -> expected combined duration with stream copy;
- H.264/AAC MP4 + MPEG-4/MP3 AVI at different resolution/frame rate/sample rate -> one H.264/AAC MKV with the expected summed duration.

## v0.9.4 phone verification / Normalize failure

Verified by user:
- multi-clip global timeline scrubbing works;
- three-clip Fast Join works.

Not verified:
- mixed-format Normalize & Join.

Two uploaded v0.9.4 failure reports showed immediate decoder-path failures:
- H.264/AC3 1920x1080 + AV1/AAC 854x480 + H.264/AC3 1920x1080;
- VP9/AAC + H.264/AAC MPEG-TS + AV1/Opus, all 854x480.

The extended logs showed VP9 native frame-header errors and AV1 messages indicating hardware accelerated AV1 decoding is unsupported plus pixel-format/decoder submission failures. FFmpeg exited with code 69 before useful progress.

Engineering decision:
- do not label all mixed-format Join as broken;
- preserve normalization for reliable decoder paths;
- preflight-block VP9/AV1 Normalize & Join in the current packaged engine;
- keep Fast Join for compatible VP9/AV1 files because stream copy does not decode them;
- plan a later decoder fallback/native/media-stack phase.

## v0.9.5 candidate status

Implemented, awaiting phone verification:
- multi-clip Project V1 is embedded inside the existing **Main editor timeline**;
- no second independent Join timeline card;
- standalone Trim, Split, and Join/Merge quick tools remain;
- global cross-clip project scrubbing remains inside the Main editor;
- Clip 1 detailed Trim/Split controls remain in the same editor;
- VP9/AV1 Normalize & Join is blocked before FFmpeg starts with a clear explanation;
- supported H.264 mismatch normalization remains available;
- native binaries and H.264/MKV seek repair unchanged.

## v0.9.5 phone verification

User reported:
- Test 1 unified editor: passed;
- Test 2 VP9/AV1 Normalize guard: passed, warning was clear;
- Test 3 supported Normalize & Join: passed.

Status:
**v0.9.5 is the verified baseline.**

## v0.9.6 candidate status

Implemented, awaiting phone verification:
- bottom navigation `Convert` renamed to `Editor`;
- one project-aware large preview;
- one horizontal V1 track for one or many clips;
- additional clips extend V1 left-to-right instead of adding vertical editor sections;
- one global project playhead and cross-clip scrubbing;
- per-clip filmstrip imagery/name/duration/boundary;
- 50%-400% timeline zoom;
- project playback handoff between clips where Android preview supports it;
- compact A1 clip audio row;
- Trim/Split remain in this same editor and still target Clip 1 in this release;
- Join/Merge uses the same V1 project;
- Join source-detail area compacted;
- Tools quick operations preserved;
- v0.9.5 decoder guard and all media-processing logic preserved.



FFmpeg Studio is a native Android Kotlin/Jetpack Compose media conversion/editing application using packaged FFmpeg/ffprobe executables.

The app is currently in active incremental development. The development strategy is to preserve a verified working baseline and add one bounded feature or reliability improvement at a time.

## Verified feature set

### Core conversion / media handling
- Local/on-device conversion.
- Storage Access Framework input/output.
- Foreground conversion service.
- Progress, elapsed/remaining time, live output size, projected final size.
- Cancel behavior with cleanup/diagnostic preservation.
- H.264 hardware MediaCodec.
- HEVC hardware MediaCodec.
- MPEG-4 software encoding.
- VP8 Android MediaCodec.
- VP9 Android MediaCodec.
- AV1 Android MediaCodec.
- Stream copy/remux.
- MKV workflows.
- MP4/MOV-style workflows already used in earlier builds.
- MPEG-TS output.
- WebM output.
- AAC audio.
- FLAC.
- PCM/WAV.
- Opus.
- Audio stream copy.
- Remove/no-audio workflows.
- Audio extraction.

### Output / seek reliability
- H.264 hardware -> MKV receives an automatic lossless final remux/index rebuild.
- This fix was physically verified to make random seeking work.
- Finalization phases are shown rather than making the app look frozen at 100%.

### Presets
Personal Saved Presets are verified:
- Save
- Load
- Update
- Rename
- Duplicate
- Delete
- Persistence after restart

Personal presets are separate from diagnostics/build-test presets.

### Development diagnostics
- Normal diagnostic report.
- Extended diagnostic report.
- Stable per-job Run ID.
- Normal + Extended from the same run share the Run ID.
- Report IDs and fingerprints allow duplicate uploads to be recognized.
- Technical Details screenshots are not required for technical analysis unless the UI display itself is wrong.
- Reports include commands/logs/device state/media properties/telemetry/seek analysis.
- Diagnostic presets A-E are hidden by default and can be enabled in Settings.

### Development test UI
Temporary development-only "Test This Build" system:
- opens once for a new development build;
- can be reopened from Home;
- explains what changed and exactly what to test;
- can apply test settings automatically;
- can mark a test NO ENCODE REQUIRED;
- keeps a BUILD TEST ACTIVE card on the Convert screen;
- tags reports with the build-test name.

The long Test This Build dialog was changed to be vertically scrollable in v0.8.9. Continue preserving scrollability on smaller screens.

### Tutorial / inline help direction
- Spotlight/coach-mark style tutorial exists from the v0.8.3 work.
- UI should dim while the actual control is highlighted.
- Inline help uses small same-line `ⓘ` icons rather than separate full-width help rows.
- Info dialogs should explain each option inside a setting, e.g. CBR/VBR/CQ or each Performance Tuning mode.

## Important verified test history

### v0.7.1 — H.264/HEVC behavior
HEVC hardware:
- Explicit Qualcomm C2 encoder + CBR solved the earlier low-bitrate/file-size-control problem.
- Hardware HEVC still ignored requested recurring keyframes in the long test.

Android software HEVC:
- `c2.android.hevc.encoder` on the tested device has a very small max frame dimension (~512x512).
- 3840x1600 failed.
- widescreen 480p (~1152x480) effectively stalled because width exceeded the capability.

### v0.8.1 long preset tests
- HEVC hardware baseline: completed; only one keyframe in finished long output.
- HEVC hardware + 0.75x speed test: same file size as baseline; limiter behavior not reliable enough to treat as exact.
- H.264 hardware: recurring FFprobe keyframe packets existed but user seeking still failed.
- MPEG-4 software: recurring keyframes and seeking worked.

### v0.8.2 C -> E seek isolation
Controlled result:
1. Diagnostic C H.264 hardware output failed user seeking.
2. Diagnostic E remuxed the exact H.264 stream without re-encoding.
3. Remuxed output sought correctly.

Conclusion:
**H.264 practical seek failure was caused by MKV finalization/indexing, not by needing a completely different video encode.**

### v0.8.3 seek fix verification
Automatic H.264 hardware/MKV post-encode remux was added.
User verified the resulting video sought normally.
This fix is considered closed/verified.

### v0.8.4
Saved Presets tested, persisted across restart, and worked.

### v0.8.5
Audio Extraction tested and working.

### v0.8.6 / v0.8.7 codec expansion
VP8 / VP9 / AV1 Android encode successfully on tested device.
H.264 -> MPEG-TS passed.
VP8/VP9/AV1 controlled tests all showed similar bitrate/size overshoot (~26%) versus requested/simple estimate.

Conclusion:
For VP8/VP9/AV1 Android MediaCodec, do not promise exact target size. Smart Target is guarded/disabled for these paths until better calibration/control exists.

### v0.8.8
Verified:
- VP9 + Opus -> WebM
- AV1 + Opus -> WebM
- Extract Opus
- Smart Target safety guard

One UI issue was reported: initial Test This Build dialog had long text and could not scroll. v0.8.9 changed it to be scrollable.

### v0.8.9
Fast Trim verified:
- input: 30.304 s H.264/AC3 Jellyfish test clip;
- trim 5 s -> 15 s;
- output 10.243 s;
- stream copy, no re-encode;
- H.264 + AC3 retained;
- about 3 s wall-clock;
- 12 real IDR NAL units in trimmed output;
- no anomaly rules triggered.

Audio-only estimate verified:
- Opus 96 kbps stereo;
- estimate ~0.4 MB;
- actual ~359.2 KB;
- previous video-style 16.9 MB estimate bug fixed.

## Current known defects / cleanup items

### 1. Audio-only false seek warning — candidate fix awaiting verification
The v0.8.9 audio-only report still emitted:
"no useful recurring keyframes"

This is meaningless for an audio-only file.

**v0.9.0 candidate implementation:** if finished output has no video stream:
- skip video keyframe observation rules;
- skip H.264/HEVC NAL expectations;
- do not phrase missing keyframes as a seeking failure;
- keep audio-relevant diagnostics only.

### 2. Short-clip seek probe threshold — candidate fix awaiting verification
The 10-second Fast Trim output had valid recurring IDRs, but the container seek probe was skipped.

Consider lowering/changing the rule so short trim/split clips can still get useful seek probes when duration/keyframe count is sufficient.

### 3. VP8/VP9/AV1 approximate rate control
Direct encoding works, but exact target-size math is not yet reliable. Preserve the current safety guard until a controlled calibration approach is implemented.

### 4. HEVC hardware forced keyframes
Do not assume `-force_key_frames` is honored by the hardware HEVC path. Diagnostics must continue measuring actual output rather than claiming success based on the requested command.

## Current feature to verify next

**v0.9.9.1 Action Trace compile fix**

Build/install first. Then run the three no-encode tests in `V099_TEST_PLAN.md`: basic action capture/export, repeated ffprobe analysis, and navigation/rotation trace.

## Near-future roadmap order

1. Split.
2. Join/Merge.
3. Improve trim/split visual controls and eventually a timeline/waveform.
4. Replace/select/mix audio tracks.
5. Subtitles.
6. Broader editing tools and overlays.
7. Batch/queue.
8. More automatic recommendations/Smart Target work.
9. Controlled native-codec expansion if needed.

## UI principles for all future versions

- Improve a little each release.
- Avoid large vertical help blocks.
- Put `ⓘ` beside the control.
- Explanation dialogs should describe every choice inside that control.
- Long dialogs must scroll.
- Preserve a simple Convert path even as editing features grow.
- Do not force one enormous first-run tutorial.
- Tutorials can be feature/workflow based and re-openable later.

## Native engine / licensing note

Recent codec expansion used capabilities already present in the packaged FFmpeg/Android MediaCodec environment.

A future true software-codec expansion may involve:
- libx264
- libx265
- libvpx
- software AV1 libraries
- additional audio libraries

Before bundling external native libraries, review license/distribution requirements. Do not randomly import codec packs or Windows playback packs.

## Tested device context

Primary physical test device during this development sequence:
- Samsung SM-S908U1
- Android 16 / API 36
- Qualcomm SM8450
- ARM64

Capabilities vary by phone. Keep capability-aware UI/preflight rather than assuming this device represents all Android hardware.

## Current artifact identity

Last source package produced in the previous development chat:
`FFmpegStudioAndroid-native-v0.8.9-fast-trim.zip`

When moving to another chat, this repository documentation should be read first. If actual app source in the repository is older than the current package, the new chat must not silently overwrite newer behavior with an older branch copy; reconcile the source version before editing.

## v0.9.6 phone feedback

User result:
- single-preview / single-V1 editor architecture works;
- multi-clip editing/scrubbing is functioning;
- no media-engine regression reported.

Usability issues identified:
- large rounded cards/bubbles consume excessive vertical space;
- V1 filmstrip/thumbnails should be smaller;
- portrait/landscape rotation resets the UI back to the main page/project defaults.

## v0.9.7 candidate status

Implemented, awaiting phone verification:
- flatter divider-based Editor sections;
- smaller section labels and reduced padding;
- V1 height reduced 108 dp -> 72 dp;
- smaller minimum clip width;
- fewer/smaller generated timeline thumbnails;
- A1 and Join source labels changed from bubbles to compact text;
- orientation/screen-size configuration changes are handled without Activity recreation, preserving current Editor/project state;
- media-processing engine and v0.9.5 decoder guard unchanged.

## v0.9.7 phone verification

User result:
- compact Editor layout is liked;
- orientation/state behavior and other existing features are working;
- no media-engine regression reported.

Status:
**v0.9.7 is the verified baseline.**

## v0.9.8 candidate status

Implemented, awaiting phone verification:
- compact visual language extended to Home, Tools, Settings, About, cards, and buttons;
- FFmpeg Studio top branding retained on Home only;
- short page titles elsewhere;
- one thumbnail per V1 clip;
- clean colored duration bar after each thumbnail;
- no filename/time overlay on V1 blocks;
- project runtime shown in V1 header;
- zoom-aware total-project time ruler directly under V1;
- ruler and V1 share horizontal scroll;
- V1 reduced to 58 dp;
- v0.9.7 rotation state and all media-processing behavior preserved.

## v0.9.8 compile failure / v0.9.8.1 fix

Android Studio build of v0.9.8 reached `:app:compileDebugKotlin` and failed with:
`App.kt:1000:100 Argument type mismatch: actual type is Double, but Float was expected.`

Root cause:
- the ruler expression is Float-based;
- `.coerceAtLeast(1.0)` used a Double literal.

v0.9.8.1 fix:
- change `.coerceAtLeast(1.0)` to `.coerceAtLeast(1f)`;
- bump to versionName 0.9.8.1 / versionCode 28;
- no intended UI/media behavior changes.

## STOP / recovery checkpoint — v0.9.8.1

User explicitly stopped development and asked to save/recover state.

Last successful version:
- v0.9.8.1 / versionCode 28;
- compiled after the v0.9.8 Float/Double ruler fix;
- installed and used successfully on the phone;
- compact UI, simplified V1, ruler, rotation preservation, and existing media features were working.

Intermittent screenshot-only issue:
- Source analysis once displayed: cannot run packaged `libffprobe_exec.so`; Java/Android returned `error=2, No such file or directory`.
- User attempted to recreate it with different clips/windows and could not reproduce it.
- Treat as watch-list issue only. Do not claim root cause is proven.

Requested future diagnostic:
- exportable Action Trace / UI Event Recorder for page transitions, button presses, file selection metadata, settings changes, dialogs/messages, orientation, exceptions/errors, and conversion lifecycle.
- Status: **NOT IMPLEMENTED**.

## v0.9.9 candidate status

Implemented from v0.9.8.1:
- rolling persistent Action Trace, recording ON by default;
- page transitions and non-consuming raw touch-down coordinates;
- tool/file/setting/dialog/error event logging;
- app lifecycle and orientation/configuration events;
- conversion lifecycle events;
- ffprobe engine snapshots before every source analysis and on ProcessBuilder launch failure;
- Settings panel with Export trace / Clear / Recording toggle;
- privacy sanitization for content URIs and app-private paths;
- rolling disk cap/rotation.

Purpose:
Capture the exact sequence surrounding rare failures, especially the one-off v0.9.8.1 ffprobe `error=2` screenshot, without guessing at a native-engine fix.

No intended media-engine changes.

## v0.9.9 compile failure / v0.9.9.1 fix

Android Studio build of v0.9.9 reached Kotlin compilation and failed before APK generation:
`App.kt:107:42 Unresolved reference 'awaitPointerEventScope'`.

Fix in v0.9.9.1:
- remove the invalid explicit `awaitPointerEventScope` import;
- retain the member call inside `pointerInput`;
- versionName 0.9.9.1 / versionCode 30;
- no intended Action Trace or media-engine behavior changes.

## Current working product
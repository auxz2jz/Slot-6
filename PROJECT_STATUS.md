# FFmpeg Studio Android — Current Project Status

**Last checkpoint:** 2026-09-22  
**Repository:** auxz2jz/Slot-6  
**Android branch:** native-android-v0.2  
**Current verified media baseline:** v0.8.9, plus v0.9.0 one-point Split/short seek probing physically verified on-device
**Current unverified candidate:** v0.9.1 (versionCode 20), Visual Timeline Foundation
**Candidate artifact:** `FFmpegStudioAndroid-native-v0.9.1-visual-timeline-candidate.zip`
**Candidate SHA-256:** `66a89fba3995feffdecb46fb6e6b8108c53cf5c1367704955fc8315a466a253c`

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

## v0.9.1 candidate status

The next bounded editor release has been created from the v0.9.0 Split source candidate.

Implemented, awaiting device verification:
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

After v0.9.1 is verified, build Join/Merge as multiple clips on the timeline, then add waveforms and additional audio tracks for music/voiceover.

## Current working product

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

**v0.9.1 Visual Timeline Foundation**

Verify preview/thumbnails/playhead/range behavior plus timeline-to-Trim and timeline-to-Split synchronization. The next implementation phase after that is Join/Merge on the same V1 timeline.

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


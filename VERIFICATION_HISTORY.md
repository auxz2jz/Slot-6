# FFmpeg Studio Android — Verification History

This file records the tests that materially changed engineering decisions. It is not every run; it is the evidence that future work should not accidentally discard.

## Test media commonly used

Long source:
- ~48:32
- ~5.19 GB
- HEVC 3840x1600 ~23.976 fps
- EAC3 5.1 640 kbps
- Used for long hardware/software encoder behavior and seek testing.

Short source:
- Jellyfish H.264 MKV
- ~30.304 s
- 1920x1080 ~29.97 fps
- AC3 5.1 640 kbps
- ~199.8 MB / ~55 Mbps
- Used for fast codec/container/audio/trim development tests.

## v0.6 / v0.7 baseline findings

### MPEG-4 software at low bitrate
- Software MPEG-4 honored requested low bitrate/file-size targets much more closely than early hardware HEVC tests.
- It produced recurring keyframes and sought normally.
- Quality at very low bitrate was visibly poor, which is expected for MPEG-4 Part 2 at those settings.

### HEVC hardware early behavior
- Early generic MediaCodec hardware HEVC ignored requested low bitrate and produced a much larger file.
- Explicitly selecting `c2.qti.hevc.encoder` plus CBR later fixed low-bitrate size control on the test device.
- Forced recurring keyframes were still not honored in the long test; full-file scan could show only the initial keyframe.

### Android software HEVC
- `c2.android.hevc.encoder` reported roughly 512x512 maximum dimensions on the tested device.
- 3840x1600 failed configuration.
- 1152x480 "480p" widescreen exceeded the reported width limit and effectively stalled.
- Lesson: validate actual aspect-ratio-derived output dimensions against the selected encoder before start.

## v0.8.1 controlled long tests

### Diagnostic A — HEVC hardware baseline
- H.265/HEVC hardware
- 480p
- 350 kbps video
- AAC 96 kbps
- CBR
- Requested 2 s keyframes
- Output ~152.4 MB
- Full output keyframe scan: one keyframe at 0.000 s
- Random seeking poor.

### Diagnostic B — HEVC hardware + 0.75x speed limit
- Output size effectively identical to baseline (~152.4 MB).
- Only one keyframe.
- Long wall-clock time.
- Verification logic showed the read-rate limiter was not an exact hard ceiling in measured windows.

### Diagnostic C — H.264 hardware baseline
- Output ~154.4 MB.
- FFprobe reported ~1,518 recurring keyframe packets at about 1.919 s intervals.
- Despite those packet flags, user seeking still failed.

### Diagnostic D — MPEG-4 software baseline
- Output near expected size.
- ~2,293 keyframes, max gap ~2.002 s.
- User seeking worked.

Engineering consequence:
H.264 needed deeper stream/container isolation because packet-level keyframe flags alone did not explain failed seeking.

## v0.8.2 Diagnostic E seek-isolation experiment

1. Encode with H.264 hardware (Diagnostic C).
2. Verify original encoded MKV does not seek properly.
3. Remux same H.264 stream with stream copy (Diagnostic E), no re-encode.
4. Verify remuxed MKV seeks normally.

Result:
- Same encoded video stream became practically seekable after remux.
- Container/index/finalization path was the practical problem.

Engineering decision:
Add an automatic post-encode lossless remux/index rebuild for H.264 hardware -> MKV.

## v0.8.3 seek fix verification

The automatic H.264/MKV finalization ran after encoding.
Phase timing became visible:
- prepare
- encode
- rebuild seek index
- analyze
- save

User physically tested the final output and confirmed random seeking worked.

Status:
**H.264/MKV seek issue verified fixed. Preserve this behavior.**

## v0.8.4 personal Saved Presets

User created two personal presets.
Verified:
- load works;
- settings restore;
- app restart preserves them.

UI feedback:
- preset dropdown initial wording needed to fit better;
- per-setting info icon was good;
- info dialogs should explain each individual option, not just the category.

## v0.8.5 Audio Extraction

Verified basic extraction workflow works.
Supported development direction:
- AAC/M4A
- FLAC
- WAV/PCM
- later Opus

Diagnostic presets hidden behind Settings toggle by default.

## v0.8.6 / v0.8.7 codec/container expansion

Short Jellyfish tests:

### VP9 Android -> MKV
- completed
- recurring keyframes
- healthy container seek probes

### AV1 Android -> MKV
- completed
- recurring keyframes
- healthy seek probes

### VP8 Android -> MKV
- completed
- healthy seek probes

### H.264 hardware -> MPEG-TS
- completed
- valid H.264/AAC TS
- regular IDR structure
- no automatic anomalies

Rate-control observation:
VP8, VP9, and AV1 Android runs requested ~800 kbps video but all produced outputs around ~26% above the simple estimate.
Engineering consequence:
Smart Target should not advertise exact size control for these Android paths until calibrated.

## v0.8.8 WebM + Opus

### VP9 + Opus -> WebM
- completed
- expected VP9 video + Opus stereo audio.

### AV1 + Opus -> WebM
- completed
- expected AV1 video + Opus stereo audio.

### Extract Opus
- completed quickly
- ~30 s stereo Opus
- ~97 kbps overall at requested 96 kbps
- actual file ~359 KB.

### Smart Target guard
- guard behavior preserved for Android VP8/VP9/AV1.

UI issue discovered:
Initial Test This Build dialog had too much text for the viewport and was not scrollable.

## v0.8.9

### Scrollable Test This Build
Implementation changed to allow long development instructions to scroll.

### Fast Trim test
Source:
- 30.304 s Jellyfish H.264/AC3 MKV.

Requested:
- Start 5.000 s
- End 15.000 s
- stream copy
- MKV

Command form:
`ffmpeg -ss 5.000 -i input -t 10.000 -c copy ... output.mkv`

Result:
- status completed
- wall time ~3 s
- output duration 10.243 s
- output size 73.8 MB
- H.264 1920x1080 retained
- AC3 5.1 retained
- 12 keyframe packets / 12 H.264 IDR NAL units
- no automatic anomaly rules triggered

Status:
**Basic fast trim verified.**

### Audio-only estimator test
Opus 96 kbps stereo from the same 30 s source.

Before fix:
- estimate incorrectly used video-style math (~16.9 MB).

After fix:
- estimate ~0.4 MB
- actual ~359.2 KB
- ~97 kbps output

Status:
**Audio-only estimator verified fixed.**

## Known diagnostics issue after v0.8.9

Audio-only output still triggered a generic video/keyframe observation:
"no useful recurring keyframes"

This rule must be suppressed when there is no video stream.

A short trim output with valid recurring keyframes also skipped the container seek probe because of the current eligibility threshold. Consider improving this for Split/Trim testing.


## v0.9.0 Split phone verification

Source:
- 30.304 s Jellyfish H.264/AC3 MKV.
- Build Test 0.9.0 - Split.
- Requested cut point: 10.000 s.

Result:
- conversion completed;
- Part 1: 10.677 s / 76.0 MB;
- Part 2: 19.680 s / 123.8 MB;
- original H.264 1920x1080 + AC3 5.1 retained in both outputs;
- stream-copy segment muxer used;
- Part 1: 11 H.264 keyframes / 11 IDR units;
- Part 2: 21 H.264 keyframes / 21 IDR units;
- the new short-clip container seek probe ran on both parts and found usable indexed/keyframe packets near all 10%, 50%, and 90% targets;
- no automatic anomaly rules triggered.

User feedback:
- trim/seek behavior works well and should be preserved.

Status:
**One-point Split and short-output seek probing are physically verified. Preserve the compact Split workflow while adding the visual timeline.**

The separate audio-only false-keyframe-warning cleanup in v0.9.0 still needs its dedicated audio-only report before that maintenance item is marked verified.


## v0.9.1 Visual Timeline phone feedback

User confirmed:
- the Visual timeline appears on-device;
- the general timeline UI works;
- its placement in the Convert workflow and Tools workflow is acceptable;
- compact Trim/Split behavior should remain available.

Observed issue:
- while scrubbing/editing, the playhead can move by roughly one or two seconds without the large preview changing to the corresponding frame;
- this is treated as a preview-scrubbing/UI responsiveness issue, not an FFmpeg Trim/Split processing failure.

Engineering decision:
- preserve v0.9.1 timeline structure;
- in v0.9.2, decouple live paused-frame preview from repeated VideoView seeks and retrieve the source frame directly while scrubbing;
- enlarge the V1 filmstrip slightly for easier editing.


## v0.9.2 Live Timeline Scrubbing phone verification

Change under test:
- paused timeline scrubbing retrieves the source frame directly rather than relying on repeated VideoView seeks;
- VideoView moves to the final playhead position after scrub release;
- V1 filmstrip was enlarged.

User result:
- **"That worked great."**

Status:
**v0.9.2 live timeline scrubbing is physically verified. Preserve this behavior while adding multi-clip editing.**


## v0.9.3 Visual Join phone verification

User feedback:
- the two-clip Join/Merge build works good;
- the user wants Join preserved as an individual tool and also fully integrated into the timeline;
- next requirements: multiple clips, cross-clip scrubbing, and mixed-format support.

Status:
**v0.9.3 two-clip Join foundation is accepted. Preserve it while expanding to v0.9.4.**


## v0.9.4 multi-clip / Normalize device verification

User result:
- Test 1 multi-clip timeline scrub: **passed**.
- Test 2 three-clip Fast Join: **passed**.
- Test 3 mixed-format Normalize & Join: **failed**.

Failure run 1:
- H.264/AC3 1920x1080 + AV1/AAC 854x480 + H.264/AC3 1920x1080.
- FFmpeg exited code 69 after about one second.

Failure run 2:
- VP9/AAC + H.264/AAC MPEG-TS + AV1/Opus, all 854x480.
- FFmpeg exited code 69 before meaningful media progress.

Extended-log evidence:
- VP9 decoder repeatedly failed to parse/read frame headers.
- AV1 decoder repeatedly reported that hardware accelerated AV1 decoding was unsupported, failed to get a pixel format, and failed packet submission.

Engineering conclusion:
The multi-clip/timeline and Fast Join architecture is valid. The failed mixed-format cases exposed a decoder limitation in the current packaged FFmpeg path, not a general concat/timeline failure.

Decision for v0.9.5:
- preflight-block VP9/AV1 Normalize & Join before FFmpeg starts;
- keep Fast Join for compatible VP9/AV1 streams;
- keep supported Normalize & Join for reliable decoder paths;
- plan a later decoder fallback/native/media-stack solution.


## v0.9.5 Unified Editor phone verification

User result:
- Test 1 unified editor timeline: **passed**.
- Test 2 VP9 / AV1 normalization guard: **passed**; the warning was clear enough.
- Test 3 supported Normalize & Join: **passed**.

Status:
**v0.9.5 is physically verified. Preserve the decoder guard and successful supported-normalization behavior while redesigning the editor layout.**

User design clarification after verification:
- the main Editor must have one large preview only;
- Trim, Split, Join/Merge, conversion, and future audio tools should share one visual workspace;
- added videos should extend one horizontal V1 track rather than creating multiple vertical video/editor sections;
- every clip should have a thumbnail/visual strip and clear boundary;
- one global playhead should scrub across every clip;
- the timeline needs zoom in/out;
- standalone quick tools should remain in Tools.


## v0.9.6 Single Unified Timeline phone feedback

User result:
- the redesigned one-preview / one-horizontal-V1 Editor works correctly overall;
- the functional architecture is accepted.

Usability feedback:
- rounded bubble/card containers waste too much screen real estate;
- V1 thumbnail/filmstrip area should be smaller;
- rotating portrait <-> landscape resets the app/editor back to the main page and loses current UI state.

Engineering decision for v0.9.7:
- flatten Editor sections to divider-based layout;
- reduce V1 height/minimum clip width;
- compact A1/source labels;
- keep the existing Activity alive across orientation/screen-size configuration changes so Compose state is retained.


## v0.9.7 Compact Editor phone verification

User result:
- likes the new compact layout;
- all existing features reported working;
- wants the same compact visual language across every page/button.

Additional design requirements captured for v0.9.8:
- FFmpeg Studio top branding should remain only on Home;
- non-Home page headings should be very small/compact;
- V1 needs only the first thumbnail for each clip;
- filename/time text should not cover clip imagery;
- the remainder of each clip should be a simple blue/gray duration bar;
- a project-time ruler should sit directly below V1, represent total runtime, and scale/scroll with zoom.


## v0.9.8 compile failure

Android Studio build reached Kotlin compilation and failed before APK generation.

Compiler message:
`App.kt:1000:100 Argument type mismatch: actual type is Double, but Float was expected.`

Root cause:
The project time ruler used `.coerceAtLeast(1.0)` on a Float expression.

v0.9.8.1 action:
- changed literal to `1f`;
- bumped versionName/versionCode to 0.9.8.1/28;
- native engine and intended UI/media behavior unchanged.

Status:
**v0.9.8 is not a runnable verification build. Use v0.9.8.1 instead.**


## v0.9.8.1 successful build / intermittent ffprobe screenshot

Recovery status:
- v0.9.8.1 compiled after the timeline-ruler Float/Double fix;
- user installed and used it successfully;
- user reported the features were working.

One intermittent screenshot showed source analysis failure:
`Cannot run program .../lib/arm64/libffprobe_exec.so ... error=2, No such file or directory`.

Important limitation:
- the user could not reproduce the error after trying different clips/pages;
- therefore the exact trigger and root cause are not established;
- do not downgrade v0.9.8.1 or modify native engine paths based only on this one occurrence.

Future diagnostic request:
Add an exportable action/event trace that records user interaction sequence and app events so rare bugs can be reconstructed. Planned only; not implemented at this checkpoint.

Status:
**v0.9.8.1 is the last successful recovery baseline. Development intentionally stopped here.**


## v0.9.9 Action Trace candidate

Reason:
The v0.9.8.1 app was successful overall, but one screenshot showed an intermittent source-analysis failure where Android could not launch packaged ffprobe and returned `error=2, No such file or directory`. The user could not reproduce it.

Engineering choice:
Instrument first; do not modify the known-good native engine path based on one unreproduced event.

v0.9.9 adds:
- rolling Action Trace enabled by default;
- UI page/touch/action/setting/file/orientation/error sequence;
- conversion lifecycle sequence;
- ffprobe engine-state snapshots immediately before launch and on launch exception;
- exportable plain-text trace from Settings.

Status:
**Candidate only. v0.9.8.1 remains the physically successful baseline until v0.9.9 is built/tested.**


## v0.9.9 compile failure

Android Studio reached Kotlin compilation but failed before APK generation with an unresolved `awaitPointerEventScope` reference at App.kt line 107.

v0.9.9.1 removes the invalid explicit import and otherwise preserves the Action Trace implementation.

Status:
**v0.9.9 is not a runnable verification build. Use v0.9.9.1. v0.9.8.1 remains the last physically verified fallback.**


## v0.9.9.1 Action Trace reproduced ffprobe launch race

The recorder captured the formerly intermittent error multiple times in one session.

Evidence:
- ffprobe analyses succeeded immediately before and after some failures;
- every failure snapshot still showed the packaged ffprobe file existed, had the expected size, and was executable;
- ProcessBuilder.start() returned error=2 / No such file or directory;
- failures occurred while several primary/secondary/additional project clips were being analyzed around Editor/Tools navigation.

Source correlation:
`MediaProbe.probeDetailed()` used `cache/ffprobe/<System.currentTimeMillis()>` as its temporary directory. Multiple Compose probe effects can launch concurrently. Same-millisecond calls could therefore share the same temporary directory and `input.<ext>`, then one call's cleanup could delete the shared directory while another call was still using it.

Decision:
v0.9.9.2 makes the workspace unique with a UUID and uses the stable app cache directory as ffprobe's working directory. Native engine files remain unchanged.

Status:
**v0.9.9.1 is valuable diagnostic evidence but not a completed reliability pass. Test v0.9.9.2 next.**


## v0.9.9.2 ffprobe race-fix verification

User supplied three cumulative Action Trace reports after testing v0.9.9.2.

Current-session evidence:
- unique probe workspace IDs were created for each analysis;
- multiple workspaces were created almost simultaneously when returning to Editor;
- launch context repeatedly reported both the input parent and stable process directory existed;
- the sampled analyses completed successfully;
- no `session=A65B3D7C | ERROR` or current-session `ffprobe launch failure` entry was found.

Important trace interpretation:
The exported reports are cumulative and still contain older v0.9.9.1 `error=2` failures. Those historical entries are not evidence that v0.9.9.2 failed.

Status:
**v0.9.9.2 concurrent ffprobe workspace fix is physically verified. Preserve it.**


## v0.9.10 Project Clip Manager verification

User supplied Action Trace session CF670694.

Confirmed:
- multiple clip removals completed and project counts decreased correctly;
- removing Clip 2 promoted the next source into Clip 2;
- Clear all project clips cleared primary, secondary, and additional clip state;
- many subsequent ffprobe analyses completed with unique workspaces;
- no current-session ERROR or ffprobe launch failure was found.

Not conclusively exercised:
- Clear All followed by Add clips directly into a completely empty project without first choosing a primary source.

Status:
**Accepted working baseline with one unproven edge path.**


## v0.9.11 Selected Clip Trim/Split candidate

Direct base:
- accepted v0.9.10 Project Clip Manager.

Engineering implementation:
- per-project-clip source start/end range state;
- selected clip from V1/list drives preview and edit controls;
- non-destructive project Trim changes selected clip range;
- project Split replaces selected clip with adjacent virtual parts referencing the same source;
- Fast Join emits concat-demuxer inpoint/outpoint for edited ranges;
- Normalize & Join applies trim/atrim before normalization;
- runtime/ruler/size estimates account for edited segment lengths.

Local engineering checks:
- core Kotlin command/model files compiled cleanly with lightweight Android stubs;
- parser-oriented whole-source scan found no syntax markers;
- synthetic FFmpeg test confirmed ranged stream-copy concat produced expected shortened combined duration;
- synthetic normalized trim/atrim concat also produced expected duration.

Status:
**Candidate only. Android Studio compile/install and physical phone verification required.**

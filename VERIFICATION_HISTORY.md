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

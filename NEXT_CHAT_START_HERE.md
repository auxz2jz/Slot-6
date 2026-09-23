# FFmpeg Studio Android — NEXT CHAT START HERE

This file is the handoff entry point for the Android FFmpeg Studio project in **auxz2jz/Slot-6**.

## Repository / branch

- Repository: `auxz2jz/Slot-6`
- Android working branch: `native-android-v0.2`
- Upstream/main branch is primarily the FFmpeg source tree; do not treat `main` as the Android app source of truth.
- Current verified media baseline: **v0.8.9**, with **v0.9.0 Split physically tested successfully** on the phone.
- Current development source package: `FFmpegStudioAndroid-native-v0.9.1-visual-timeline-candidate.zip`
- Current native FFmpeg/ffprobe ARM64 binaries have intentionally remained unchanged through the recent Kotlin/UI feature releases.

## Current unverified candidate — v0.9.1

The current source candidate is the first **Visual Timeline Foundation** release.

- Candidate version: **v0.9.1 (versionCode 20)**
- Candidate artifact: `FFmpegStudioAndroid-native-v0.9.1-visual-timeline-candidate.zip`
- Candidate SHA-256: `66a89fba3995feffdecb46fb6e6b8108c53cf5c1367704955fc8315a466a253c`
- Direct base package: v0.9.0 Split candidate, SHA-256 `3bc36bcc7619f1fd9962e700e41d1fe84945f5daca564d57369eb1a1a4bc6304`.
- Native FFmpeg/ffprobe binaries are unchanged.
- New UI/editor work: embedded video preview, local thumbnail strip, V1 source-video track, A1 source-audio track, playhead seeking, draggable trim range, timeline -> Fast Trim, and timeline -> Split at playhead.
- Compact typed Trim and Split controls remain available and use the same existing processing pipelines.
- FFmpeg command construction, Split processing, diagnostics, and H.264/MKV seek-index finalization were not changed in v0.9.1.
- A full Android compile is still not available in the source-creation environment; Android Studio/device verification is required.
- After the timeline foundation is verified, the next editor phase should build Join/Merge as multiple clips on the same timeline, followed by additional audio tracks/waveforms/voiceover.

### v0.9.0 verification carried forward
The uploaded v0.9.0 Split report showed a completed one-point Split on the 30.304 s Jellyfish source. The outputs were 10.677 s and 19.680 s, and both outputs received healthy short-clip container random-seek probes. The user also confirmed the trim/seek behavior works well. The v0.9.0 audio-only warning suppression still needs its dedicated report if we want that maintenance item separately marked verified.


## Read these files first in a new chat

1. `NEXT_CHAT_START_HERE.md` — this file.
2. `PROJECT_STATUS.md` — current working behavior, known bugs, and next work.
3. `ANDROID_FEATURES.md` — continuous roadmap and DONE/PARTIAL/TODO status.
4. `VERIFICATION_HISTORY.md` — important device tests and what they proved.
5. `DEVELOPMENT_WORKFLOW.md` — rules for regular GitHub checkpoints and future work.

Do not rely on old conversation history if these repository documents disagree with it. The repository documents are intended to be the current handoff source of truth.

## Project goal

Native Android Kotlin / Jetpack Compose media conversion and editing app using FFmpeg/ffprobe. Keep the interface usable for non-expert users while still exposing advanced controls. Processing is local/on-device. FFmpeg remains the media-processing engine.

## Current proven baseline

The v0.8.9 line has the following verified behavior:

- Native Kotlin / Jetpack Compose application builds in Android Studio and runs on physical Android hardware.
- FFmpeg and ffprobe executable engine packaged for ARM64.
- Hardware H.264 and HEVC through Android MediaCodec.
- MPEG-4 software encoding.
- Android VP8 / VP9 / AV1 MediaCodec paths.
- Containers/workflows currently exercised: MKV, MP4-family workflows, WebM, MPEG-TS.
- AAC, FLAC, PCM/WAV, Opus, stream-copy audio workflows.
- Audio extraction to AAC/M4A, FLAC, WAV/PCM, and Opus.
- Saved user presets with persistence across app restart.
- Diagnostic presets hidden by default behind a Settings toggle.
- Build-development test guide ("Test This Build") with exact test instructions and Apply Test Settings behavior.
- Permanent per-job Run ID plus report IDs/fingerprints for duplicate report detection.
- Normal + Extended diagnostic reports are the authoritative technical record; Technical Details screenshots should not be needed except for visual/UI mismatches.
- Output telemetry includes size projection, progress, state, thermal/battery/RAM data where available.
- Automatic H.264 hardware + MKV seek-index finalization repair is verified working.
- WebM + Opus is verified with VP9 and AV1 on the test device.
- Fast stream-copy trim is verified.
- Audio-only output size estimation is verified fixed.

## Critical verified H.264 seek fix

Earlier H.264 hardware MKV output contained recurring FFprobe keyframe packets but random seeking failed. A lossless remux of the same H.264 stream fixed seeking. This isolated the practical problem to the original MKV finalization/index path rather than the encoded H.264 stream.

Starting in v0.8.3, H.264 hardware -> MKV automatically performs a lossless post-encode seek-index rebuild before the output is presented as complete. This was physically verified: the final v0.8.3 output sought normally.

Do not remove this finalization step casually. Preserve it unless a replacement has been verified on-device.

## Current development-testing system

During development, each build may provide a "Test This Build" guide containing:
- what changed,
- source file requirements,
- exact test settings,
- expected result,
- whether encoding is required,
- whether Normal/Extended reports are needed.

The guide can apply the test settings automatically. The user should not be expected to manually reproduce a long list of settings for controlled tests.

The development test UI is temporary and can be removed or disabled when the application is considered finished.

## Most recent verified tests — v0.8.9

### Fast Trim
Input: 30.304 s Jellyfish H.264/AC3 MKV test clip.
Preset: Build Test 0.8.9 - Fast Trim.
Requested range: 00:00:05 -> 00:00:15.
Method: fast stream copy, MKV.
Result:
- Completed.
- Wall-clock about 3 seconds.
- Output duration 10.243 s.
- Original 1920x1080 H.264 + AC3 5.1 retained.
- 12 real H.264 IDR units detected in the output.
- No automatic anomaly rules triggered.

### Audio-only estimate
Preset: Build Test 0.8.9 - Audio Estimate.
Opus 96 kbps stereo from the same 30-second source.
Result:
- Estimated about 0.4 MB.
- Actual about 359.2 KB / 97 kbps overall.
- Fix verified.

## Known issue discovered after v0.8.9

The audio-only diagnostic report still produces a meaningless automatic observation such as "no useful recurring keyframes" because the generic video seek rule runs on an audio-only output.

**Next maintenance fix:** suppress video keyframe/seek warnings and video-only seek diagnostics when the output contains no video stream.

Also consider allowing short trimmed/split clips to run the container random-seek probe rather than skipping merely because the clip is short.

## Next roadmap feature

The active feature is now **v0.9.1 Visual Timeline Foundation verification**.

Keep the compact fast tools while building the editor progressively:
- v0.9.1: preview + thumbnails + playhead + visual Trim/Split integration;
- after verification: multi-clip V1 timeline for Join/Merge;
- then additional audio tracks/waveforms/voiceover and later additional video tracks/overlays.

Do not replace the fast stream-copy Trim/Split tools; the visual editor should feed those workflows when appropriate.

## UI direction

Continue small UI improvements every release rather than one giant redesign.

Important user preferences:
- compact vertical layout;
- small inline `ⓘ` beside the control it explains, not a separate help row;
- info dialogs should explain the individual options inside that setting, not only the setting name;
- tutorials should use spotlight/coach-mark behavior: dim the screen, highlight the actual UI control, and point to it with a compact explanation;
- tutorial/build-test dialogs with long text must be scrollable;
- Test This Build instructions should remain visible/reopenable during development.

## Saved Presets

Verified working:
- Save
- Load
- Rename
- Update
- Duplicate
- Delete
- Persist after restart

Personal presets are separate from diagnostic/build-test presets. Diagnostic presets must not overwrite personal presets.

## Codec/container observations

### H.264 hardware
- Qualcomm C2 encoder is the known-good hardware path on the tested Samsung device.
- Low-bitrate CBR control has worked well after explicitly selecting the Qualcomm encoder.
- MKV requires the automatic seek-index finalization described above.

### HEVC hardware
- Low-bitrate CBR control became reliable after explicitly selecting `c2.qti.hevc.encoder`.
- Earlier HEVC hardware tests ignored requested forced keyframes and could produce only one FFprobe keyframe in the full output. Do not assume generic `-force_key_frames` is honored by all MediaCodec HEVC encoders.

### Android software HEVC
- `c2.android.hevc.encoder` on the tested device reported a severe size limit around 512x512.
- Original-resolution 3840x1600 configuration failed.
- 480p preserving widescreen aspect (~1152x480) effectively stalled because width exceeded the encoder limit.
- App should capability-check actual planned dimensions before starting.

### VP8 / VP9 / AV1 Android
- Verified to encode successfully on the test device.
- In controlled 480p tests, requested ~800 kbps video + audio produced files around 26% larger than the simple estimate.
- Treat hardware/software Android MediaCodec bitrate targeting for these codecs as approximate.
- Smart Target was intentionally disabled/guarded for these encoders rather than pretending exact output-size control.

### WebM + Opus
Verified:
- VP9 + Opus -> WebM
- AV1 + Opus -> WebM
- standalone Opus extraction

Native FFmpeg Opus path used in the app is currently intended for mono/stereo output; do not expose unsupported multichannel choices without verification.

## Diagnostic architecture

Reports should include:
- Run ID
- report type
- report fingerprint
- app/device/Android/SoC
- FFmpeg/ffprobe versions
- selected settings
- source media
- finished media
- planned + actual command
- phase timeline
- progress telemetry
- projection telemetry
- battery/charging/thermal/RAM/storage
- rate-control/speed-limit observations
- keyframe/random-access analysis when video exists
- container seek probes where applicable
- recent/full FFmpeg log
- exceptions/errors
- encoder capability inventory

Normal + Extended reports from one conversion share the same Run ID.

Duplicate-report rule:
matching Report ID + fingerprint means the same captured report state and should not be reanalyzed as a new run.

## Current native-engine policy

Avoid rebuilding FFmpeg unless a feature truly requires it. Recent features use capabilities already present in the packaged engine.

Potential later native expansion:
- libx264 software H.264
- libx265 software HEVC
- libvpx if a non-MediaCodec VP8/VP9 path is desired
- a dedicated software AV1 encoder
- other audio libraries if needed
- additional ABIs

Any such work must consider license/distribution obligations and should be isolated from the last verified app.

## Important workflow rule for the next chat

Before making code changes:
1. Read the five handoff/roadmap files listed above.
2. Confirm the current verified baseline and the current "Next roadmap feature".
3. Preserve the last verified behavior.
4. Make one bounded feature/reliability release.
5. Give the user an in-app Build Test for exactly what changed.
6. After the user verifies it, update GitHub documentation again.


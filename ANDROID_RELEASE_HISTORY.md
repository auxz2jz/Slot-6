# FFmpeg Studio Android — Release History Summary

This is the compact Android-app release history used for handoff. The detailed FFmpeg upstream changelog in the repository is unrelated to these Android app versions.

## v0.8.9 — Fast Trim / estimator / test-dialog fixes
Verified on-device.
- Fast Start/End stream-copy trim.
- Trim range parsing/validation.
- MKV copy compatibility checks.
- Trim progress based on clip duration.
- Audio-only estimate fix.
- Audio Extraction estimate displayed on-screen.
- Test This Build dialog made scrollable.
- NO ENCODE REQUIRED test labeling.
- Preserved H.264 MKV seek repair and WebM/Opus.

Known cleanup discovered:
- audio-only diagnostic still produces meaningless video/keyframe warning.
- short trim seek probe threshold should be improved.

## v0.8.8 — WebM + Opus
Verified on-device.
- WebM output.
- VP9 + Opus -> WebM.
- AV1 + Opus -> WebM.
- Opus Audio Extraction.
- Opus kept to mono/stereo for the verified current encoder path.
- Smart Target guarded/disabled for Android VP8/VP9/AV1 because tested bitrate control overshot estimates.
- Source-aware copy compatibility rules.

## v0.8.7 — Test This Build
Verified development workflow.
- Development-only Test This Build system.
- Opens once per development build and remains reopenable.
- Exact test instructions.
- Apply Test Settings.
- BUILD TEST ACTIVE card.
- Report tagging with build-test name.
- Used to verify VP8/VP9/AV1 MKV and H.264 MPEG-TS.

## v0.8.6 — Codec/container expansion
Verified on-device through v0.8.7 tests.
- VP8 Android MediaCodec.
- VP9 Android MediaCodec.
- AV1 Android MediaCodec.
- MPEG-TS.
- Container-aware codec filtering.
- Encoder capability/preflight checks extended to new codecs.
- Saved Presets support new choices.

## v0.8.5 — Settings cleanup + Audio Extraction
Verified.
- Diagnostic presets hidden by default behind Settings toggle.
- Advanced tab renamed Settings while preserving advanced FFmpeg controls.
- Improved compact dropdown text.
- Expanded inline info dialogs with explanations of each setting option.
- Audio Extraction workflow.
- AAC/M4A, FLAC, WAV/PCM.
- Saved Presets can store audio-extraction configurations.

## v0.8.4 — Personal Saved Presets
Verified.
- Save/load/update/rename/duplicate/delete.
- Persist after app restart.
- Preserve selected source when applying reusable settings.
- Personal presets separated from diagnostic presets.
- Compact UI pass.

## v0.8.3 — Automatic H.264 MKV seek fix
Physically verified.
- Automatic lossless remux/index rebuild after H.264 hardware -> MKV.
- Preserve original encode if final remux fails.
- Visible phases: prepare, encode, rebuild index, analyze, save.
- Phase timeline in diagnostics.
- Diagnostic E requires H.264 source.
- Hide irrelevant bitrate controls for stream copy.
- Inline info icons.
- Spotlight/coach-mark tutorial foundation.

This release closed the previously reproduced H.264 random-seeking failure.

## v0.8.2 — Serialized diagnostics / seek isolation
Verified.
- Stable Run ID shared by Normal and Extended reports.
- Report ID, schema, fingerprint.
- Export filenames include Run ID.
- Live projected-size telemetry captured.
- Fixed false keyframe-count text matching.
- H.264/HEVC elementary NAL analysis.
- Container/index seek probes.
- Diagnostic E stream-copy remux seek test.
- Technical Details content made available in reports.
- Quick tutorial foundation.

Critical experiment:
Diagnostic C H.264 file did not seek; Diagnostic E remux of same encoded stream did seek. This proved the practical MKV finalization/index problem.

## v0.8.1 — Reliability / encoder controls
Verified with long controlled tests.
- Diagnostic presets.
- Encoder dimension preflight.
- NV12 compatibility on Android software MediaCodec paths.
- Stall detection.
- Safer cancellation cleanup.
- Expanded battery/thermal/memory telemetry.
- Rate-control/keyframe/audio/performance controls.
- Preserved Qualcomm C2 CBR behavior.

## v0.8.0
Superseded and should not be used as a test baseline.
- Introduced rate-control, keyframe, audio-channel, speed-limit and encoder-effort controls.
- Older package inherited compile issues from v0.7.0.

## v0.7.1
Compile-fix release.
Important verified findings:
- Qualcomm HEVC C2 + CBR fixed earlier low-bitrate hardware size-control failure.
- Hardware HEVC still ignored recurring keyframe request in the long test.
- Android software HEVC capability was too small for the source's common 480p widescreen dimensions.
- Cancellation crash/reliability problems motivated later work.

## v0.7.0
- Wake lock.
- elapsed/ETA.
- lower bitrate presets.
- H.264/H.265 Android software MediaCodec choices.
- C2 preference.
- richer telemetry.
- full-output keyframe scan.
Original package had Kotlin nullable compile errors later fixed in v0.7.1.

## v0.6
Diagnostics baseline.
- Normal + Extended reports.
- Long hardware HEVC and software MPEG-4 experiments.
- Showed software MPEG-4 could honor requested size very closely.
- Showed early MediaCodec HEVC could ignore requested low bitrate and/or forced keyframes.

## v0.5
- Cancel control.
- live output size.
- projected final size.
- settings locked during active conversion.
- target-miss warning.
- forced keyframe request.
- MKV/MP4 seek-oriented mux options.

## v0.4.1
Compile-fix for v0.4.

## v0.4
- richer source/output information.
- Play converted / Share.
- bitrate selectors.
- improved target estimates.
- CBR request for target-size hardware path.
- UI refresh.

## v0.3
Smart Target phase 1.
- desired file size.
- ffprobe duration/media analysis.
- bitrate calculation.
- estimated output size.
- target warnings.

## v0.2
First complete native Android package with ARM64 FFmpeg/ffprobe engine.
- no INTERNET permission.
- mediaProcessing foreground service.
- engine preflight.
- hard build verification requiring FFmpeg/ffprobe.
- GitHub Actions native-engine build path.

## Native engine identity carried through recent releases

FFmpeg:
`792a5e06689f67f2f0dfb0e1a0c8eca119e10ccbae46c3de95dae3aaad22c2f7`

ffprobe:
`cbf1492715d8217e8deca640a84b13a973bfd696803dffd34abd1f629c4cc41c`

Recent releases deliberately avoided changing these native binaries while Kotlin/UI/workflow features were added.


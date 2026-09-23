# FFmpeg Studio Android — Release History Summary

This is the compact Android-app release history used for handoff. The detailed FFmpeg upstream changelog in the repository is unrelated to these Android app versions.

## v0.9.8.1 — Compile fix

**Built, installed, and used successfully on-device. This is the current recovery baseline.**
- versionCode 28.
- Fixes the v0.9.8 Kotlin compiler error in the project time ruler.
- `coerceAtLeast(1.0)` -> `coerceAtLeast(1f)` where a Float is required.
- No intended UI/media-processing changes.
- Candidate ZIP SHA-256: `445366602c6f44ed04c1237248dcee69b75ef25ddda971f863178d07cc59f7b5`.


## v0.9.8 — Unified Compact UI + Timeline Ruler

**Compilation failed before APK generation due to a Float/Double mismatch in the timeline ruler; superseded by v0.9.8.1.**
- versionCode 27.
- Compact UI language extended across all app pages and buttons.
- FFmpeg Studio branding shown in top bar on Home only.
- Compact non-Home page title bars.
- One leading representative thumbnail per V1 clip.
- Colored duration bar fills the remainder of each clip.
- Removed filename/duration overlays from clip blocks.
- Project runtime shown in V1 header.
- Zoom-aware total-project time ruler directly under V1 and synchronized with timeline scrolling.
- V1 height reduced to 58 dp.
- Rotation-state behavior and media processing unchanged.
- Candidate ZIP SHA-256: `cfb2cba9c3181ca800c988313ed668a73cb35f0790c7b234345e12284265a27d`.


## v0.9.7 — Compact Editor Layout + Rotation State

**Physically verified on-device. User likes the compact layout and reports all features working.**
- versionCode 26.
- Flatter divider-based Editor sections replace most rounded Editor cards.
- Reduced Editor padding and vertical spacing.
- V1 filmstrip height reduced from 108 dp to 72 dp.
- Smaller clip minimum width and thumbnail generation.
- A1 / Join source labels use compact text instead of pills.
- Orientation/screen-size changes preserve the current Editor/project state instead of recreating back to Home.
- Single preview/V1/global scrub/zoom architecture preserved.
- Standalone quick tools, decoder guard, FFmpeg commands and native binaries unchanged.
- Candidate ZIP SHA-256: `ef306a2ec27e164dcb49b508123c224fd70f26bb1bd48f4ca7be5c6cf69b27aa`.


## v0.9.6 — Single Unified Timeline Editor

**Functionally verified on-device; UI density and orientation-state issues identified for v0.9.7.**
- versionCode 25.
- Bottom navigation label Convert -> Editor.
- One large project-aware preview.
- One horizontal V1 track for one or many clips.
- Added clips extend V1 left-to-right rather than stacking editor sections vertically.
- One global project playhead with cross-clip scrub preview.
- Per-clip filmstrip imagery, file name, duration, and clear boundaries.
- 50%-400% horizontal timeline zoom.
- Best-effort preview playback handoff across clip boundaries.
- Trim/Split remain in the same editor and still target Clip 1 in this release.
- Join/Merge uses the same V1 project; standalone quick Join remains in Tools.
- Join source details compacted to avoid vertical page growth.
- v0.9.5 VP9/AV1 Normalize guard and all media-processing logic preserved.
- Native binaries unchanged.
- Candidate ZIP SHA-256: `2051f229ac8bf6d54c737828c15a2a47c1b8fa57fcd8f9d1af222d809a8e7ab9`.


## v0.9.5 — Unified Editor Timeline + Normalize Guard

**Physically verified on-device. All three controlled tests passed and the VP9/AV1 warning was clear.**
- versionCode 24.
- Multi-clip Project V1 is embedded inside the existing Main editor timeline.
- Standalone Trim, Split, and Join/Merge quick tools remain available.
- Cross-clip project scrubbing stays in the Main editor.
- Clip 1 detailed Trim/Split controls remain in the same editor; project-aware per-clip edits are the next phase.
- VP9/AV1 Normalize & Join is preflight-blocked after v0.9.4 phone logs showed decoder failures and code 69.
- Fast Join remains allowed for compatible VP9/AV1 streams because stream copy does not decode them.
- Supported Normalize & Join remains available for reliable current decoder paths such as H.264 mismatches.
- Native FFmpeg/ffprobe binaries and verified H.264/MKV seek-index finalization unchanged.
- Candidate ZIP SHA-256: `bd01d729d06563691be76421828a79836a5356cfefe5f61544034d11c4b415b9`.


## v0.9.4 — Multi-clip Timeline + Normalize & Join

**Partially verified on-device:** multi-clip scrubbing and three-clip Fast Join pass; VP9/AV1 mixed-format normalization fails in the current packaged decoder path.
- versionCode 23.
- Join/Merge remains a standalone tool and is also reachable directly from Visual Timeline.
- Multiple Join clips supported.
- Global timeline scrub crosses clip boundaries and previews the correct source/local time.
- Fast Join for matching inputs.
- Automatic Normalize & Join for mixed containers/codecs/resolutions/frame rates.
- Normalize output is H.264 hardware + AAC stereo in MKV using Clip 1 frame size.
- First normalization release requires video + audio in every clip.
- Diagnostic schema 6 records Clip 3+ source metadata.
- Native binaries unchanged.
- Candidate ZIP SHA-256: `2370a43a09f28ba4c5546b76b55022e2421ea4646082f52a054b614a634b3448`.


## v0.9.3 — Visual Join/Merge Foundation

**Physically verified by user feedback: the two-clip Join/Merge build works well.**
- versionCode 22.
- New Join / merge operation.
- Two source clips in fixed V1 order: Clip 1 -> Clip 2.
- V1 visual strip shows representative frames and proportional durations.
- Fast Join uses FFmpeg concat demuxer + stream copy to MKV.
- Preflight blocks incompatible clips and checks video codec/resolution/pixel format plus audio presence/codec/sample rate/channel count.
- Secondary source has its own URI, ffprobe analysis, source summary, and report identity.
- Diagnostic schema bumped to 5 with a Secondary Source Media section.
- Combined expected duration/size shown where source data is available.
- Existing fast Trim/Split, single-clip timeline, and verified live scrubbing are preserved.
- Native FFmpeg/ffprobe binaries and H.264/MKV seek-index finalization remain unchanged.
- External FFmpeg validation produced the expected combined duration, near-sum output size, and healthy random seeking.
- Candidate ZIP SHA-256: `d5f3fa2e6ae1ffa696c72072fec310691cf26ef882585c89247f662619486ed8`.


## v0.9.2 — Live Timeline Scrubbing

**Physically verified on-device. User reported the live scrubbing fix worked great.**
- versionCode 21.
- While paused, moving the playhead now requests the actual nearby source frame with MediaMetadataRetriever.
- Rapid scrubbing no longer depends on a stream of VideoView seek requests; the VideoView is moved to the final playhead position after release.
- Normal Play/Pause remains handled by VideoView.
- V1 filmstrip height increased from 72 dp to 96 dp.
- Compact Trim/Split controls and timeline-to-Trim/Split integration are preserved.
- FFmpeg commands, Split processing, diagnostics, H.264/MKV seek-index finalization, and native binaries are unchanged.
- Candidate ZIP SHA-256: `573ed5499f6fa86253e24ea4d334b1974e2b9508d570fcdc4e36b902200bbb92`.


## v0.9.1 — Visual Timeline Foundation

**Timeline UI present and generally working on-device; live paused scrub-preview lag identified.**
- versionCode 20.
- Expandable Visual timeline inside Source media.
- Embedded Android video preview with Play/Pause and seeking.
- Eight local thumbnail positions.
- V1 source-video strip with playhead plus visual trim boundaries.
- Draggable In/Out range, Set In, Set Out.
- Timeline range feeds the existing Fast Trim workflow.
- Timeline playhead feeds the existing one-point Split workflow.
- A1 source-audio row establishes the future multi-track layout.
- Compact typed Trim/Split controls remain available.
- FFmpeg commands, Split service/diagnostics, H.264/MKV seek finalization, and native binaries are unchanged.
- Candidate ZIP SHA-256: `66a89fba3995feffdecb46fb6e6b8108c53cf5c1367704955fc8315a466a253c`.


## v0.9.0 — Split

**Split path physically verified on-device; audio-only maintenance cleanup still has its own pending verification.**

- versionCode 19.
- One cut point splits one source into two MKV files.
- Stream-copy/segment-muxer workflow; no video/audio re-encode for the initial Split implementation.
- User selects one output folder; the app creates Part 1 and Part 2.
- Service/state/diagnostics support both generated outputs.
- Audio-only jobs no longer run video/keyframe seek analysis in the candidate.
- Short outputs with recurring keyframes can run container seek probes from 3 seconds upward.
- Build Test coverage includes Split, Audio Diagnostics, and an H.264/MKV seek-regression test.
- Verified H.264 hardware -> MKV automatic lossless seek-index finalization/remux remains preserved for the normal encode path.
- Native FFmpeg/ffprobe binaries are unchanged from v0.8.9.
- Candidate ZIP: `FFmpegStudioAndroid-native-v0.9.0-split-candidate.zip`
- Candidate SHA-256: `3bc36bcc7619f1fd9962e700e41d1fe84945f5daca564d57369eb1a1a4bc6304`
- One-point Split and short-output seek probing are verified from the phone run; the separate audio-only warning-suppression test remains pending.


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


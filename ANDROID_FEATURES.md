# FFmpeg Studio Android — Master Roadmap

> **Checkpoint 2026-09-23:** v0.9.7 Compact Editor is verified on-device. A **v0.9.8 (versionCode 27) Unified Compact UI + Timeline Ruler candidate** standardizes the UI and simplifies V1 to one thumbnail per clip plus a zoom-aware total-project ruler.

This file is the **continuous master record** for the Slot-6 Android application. It tracks what is already working, what still needs to be implemented, and which work is likely to require rebuilding the native FFmpeg engine.

## Roadmap maintenance rules

1. **Keep this file current.** Whenever a roadmap feature is completed and verified, update this file in the same development cycle.
2. **Do not delete completed features.** Move or mark them as completed so the repository retains a continuous record of progress.
3. **Merge duplicates instead of creating repeated entries.** Keep the most complete wording and use sub-items for related capabilities.
4. **Do not mark a feature complete just because code was written.** Mark it complete only after it has been built successfully and, when appropriate, tested on a physical Android device.
5. **Record partial completion clearly.** Use `PARTIAL` when only part of a roadmap item is working.
6. **Preserve the known-good app while developing.** Major native-engine changes should be isolated from the last verified working version until they have been tested.
7. **Avoid unnecessary GitHub/native-engine work.** Android/Kotlin features should be implemented without rebuilding FFmpeg when the existing engine already supports them.
8. **Use controlled GitHub operations.** When native-engine work is necessary, perform one deliberate change/build/check cycle at a time. Do not continuously poll workflows or automatically retry failed builds in a loop.
9. **Update this roadmap after each verified feature completion** so future work can resume from the repository record without relying only on conversation history.
10. **Keep status labels accurate:**
   - `DONE` = implemented and verified.
   - `PARTIAL` = some of the feature is implemented, but roadmap work remains.
   - `TODO` = not yet implemented.
   - `NATIVE BUILD` = likely requires rebuilding or expanding the native FFmpeg engine.

---

# 1. Core native Android foundation

- `DONE` Native Kotlin Android application.
- `DONE` Jetpack Compose user interface.
- `DONE` Android Studio-ready Gradle project.
- `DONE` Native FFmpeg and ffprobe engine packaged with the app for ARM64.
- `DONE` Local/on-device processing with no normal media upload requirement.
- `DONE` Android Storage Access Framework input selection.
- `DONE` Output-file saving through Android storage APIs.
- `DONE` Basic foreground conversion service.
- `DONE` Conversion progress reporting.
- `DONE` Conversion cancellation.
- `DONE` Human-readable error display with expandable technical details.
- `DONE` FFmpeg engine status display.
- `DONE` Basic video conversion tested successfully on a physical Android phone.
- `DONE` Hardware H.264/H.265 MediaCodec paths included in the current FFmpeg engine.
- `DONE` Software MPEG-4 fallback available.
- `DONE` Basic ffprobe/media inspection support.
- `DONE` Share completed files directly with other Android apps.
- `PARTIAL` Native media preview/player support exists through Play converted; broader player/preview improvements remain.
- `TODO` Better memory handling for very large media files.
- `TODO` Completion/failure notifications and richer background-job handling.

# 2. Smart target-file-size system

- `PARTIAL` Enter a desired final size and calculate a target bitrate; exact behavior is intentionally guarded for Android VP8/VP9/AV1 because tested MediaCodec rate control overshot estimates.
- `DONE` Calculate available video bitrate from duration/audio reservation for supported target-size workflows.
- `PARTIAL` Source ffprobe analysis is performed and feeds validation/estimation; full automatic setting selection remains TODO.
- `TODO` Automatically select a suitable codec, bitrate, resolution, frame rate, and audio configuration.
- `TODO` User priorities:
  - Best quality.
  - Smallest file.
  - Fastest conversion.
  - Maximum compatibility.
- `TODO` Quality safeguards that prevent unreasonable settings solely to hit an impossible size.
- `PARTIAL` Unrealistic/low-bitrate/encoder-limit warnings exist; broader recommendation logic remains.
- `TODO` Two-pass encoding when useful for more accurate size targeting.
- `DONE` Estimated output size before encoding, including corrected audio-only estimates.
- `DONE` Live projected final size during encoding with telemetry/report capture.

# 3. Expanded codec and container support

## Video codecs
- `DONE` H.264 / AVC through Android MediaCodec where supported.
- `DONE` H.265 / HEVC through Android MediaCodec where supported.
- `DONE` MPEG-4 software encoding.
- `DONE` Stream copy / remux option.
- `TODO` MPEG-2.
- `TODO` MJPEG.
- `TODO` FFV1 / lossless archival video.
- `TODO` ProRes-style workflows where supported.
- `DONE` VP8 / VP9 Android MediaCodec encoding on capable devices; `NATIVE BUILD` libvpx remains an optional future software path.
- `DONE` AV1 Android MediaCodec encoding on capable devices; `NATIVE BUILD` dedicated software AV1 remains optional future work.
- `NATIVE BUILD` libx264 software H.264 encoding.
- `NATIVE BUILD` libx265 software HEVC encoding.

## Audio codecs
- `DONE` AAC support in the current application workflow.
- `DONE` FLAC option.
- `DONE` PCM option.
- `DONE` Audio stream copy.
- `DONE` No-audio output option.
- `TODO` MP3.
- `TODO` ALAC.
- `TODO` AC-3.
- `TODO` E-AC-3.
- `TODO` Additional PCM/WAV formats.
- `DONE` Opus through the packaged FFmpeg native encoder for verified mono/stereo workflows; external libopus remains optional future native work if needed.
- `NATIVE BUILD` Vorbis or other external audio codec libraries if needed.

## Containers and compatibility
- `DONE` Basic MP4/MKV-style conversion workflow.
- `PARTIAL` Broader container support now includes verified WebM and MPEG-TS plus existing MP4/MKV/MOV-family workflows; AVI/FLV/other containers remain.
- `DONE` Container-aware codec/audio compatibility filtering and start validation for the currently exposed normal workflows.
- `PARTIAL` Normal dropdowns filter incompatible combinations; a distinct finished Beginner mode is still TODO.
- `TODO` Expose broader combinations in Advanced mode.
- `DONE` Device MediaCodec capability probing/preflight is used for exposed Android encoders, including bitrate/resolution/rate-control limits.
- `TODO` Automatic software fallback when a hardware encoder fails.

# 4. Visual trimming and editing

- `DONE` Basic Start/End fast stream-copy trim is implemented and physically verified; visual/frame-exact trimming remains future work.
- `PARTIAL` Main visual editor timeline is working on-device with live scrubbing and multi-clip Project V1. v0.9.5 embeds multi-clip Join directly inside this same Main editor rather than a separate Join timeline card. Project-aware per-clip Trim/Split/reorder, zoom, and waveforms remain.
- `PARTIAL` Draggable visual trim In handle exists and the overall timeline is working on-device; broader editor refinement remains.
- `PARTIAL` Draggable visual trim Out handle exists and the overall timeline is working on-device; broader editor refinement remains.
- `DONE` Embedded preview with play/pause and live paused playhead scrubbing is working on the physical test device as of v0.9.2.
- `TODO` Frame-accurate or near-frame-accurate seeking where practical.
- `TODO` Draggable crop rectangle over video preview.
- `DONE` Basic resize/resolution selection.
- `TODO` Custom dimensions.
- `TODO` Aspect-ratio conversion.
- `TODO` Pad / letterbox controls.
- `TODO` Frame-rate selection and conversion.
- `TODO` Rotate 90° clockwise/counterclockwise and 180°.
- `TODO` Horizontal and vertical flip.
- `DONE` Split one video at one cut point into two MKV files using stream copy; physically verified on-device. Multiple cut points remain future work. The v0.9.1 timeline can feed the Split point visually.
- `PARTIAL` Merge/join videos — multi-clip Fast Join and supported normalization are verified. v0.9.6 moves Join/Merge onto the same single V1 editor surface while preserving standalone quick Join in Tools. Per-clip reorder/removal remains TODO.
- `TODO` Join video and audio files.
- `TODO` Reorder/remove clips before joining — next unified-timeline increment after v0.9.5 verification.
- `TODO` Basic transitions where practical.

# 5. Time and motion tools

- `TODO` Playback-speed changes.
- `TODO` Slow motion.
- `TODO` Time lapse.
- `TODO` Reverse video where practical.
- `TODO` Reverse audio where practical.
- `TODO` Video fade in/out.
- `TODO` Audio fade in/out.

# 6. Batch processing and queue

- `TODO` Select multiple files.
- `TODO` Batch conversion queue.
- `TODO` Reorder queued jobs.
- `TODO` Per-file status and progress.
- `TODO` Cancel individual jobs.
- `TODO` Pause/resume queue where technically practical.
- `TODO` Apply one preset to all selected files.
- `TODO` Assign different settings to individual files.
- `TODO` Retry failed jobs.
- `TODO` Completed-job history.
- `TODO` Repeat/re-run previous jobs.
- `TODO` Overall queue progress.

# 7. Presets and automatic recommendations

- `TODO` Phone preset.
- `TODO` TV preset.
- `TODO` Archive preset.
- `TODO` Discord/messaging preset.
- `TODO` Email attachment preset.
- `TODO` YouTube/video-sharing preset.
- `TODO` Social-media presets.
- `TODO` High-quality preset.
- `TODO` Small-file preset.
- `TODO` Fast-encode preset.
- `TODO` Maximum-compatibility preset.
- `DONE` Save custom personal presets with load/update/rename/duplicate/delete and persistence across restart.
- `TODO` Favorite/pinned presets.
- `TODO` Recent presets.
- `PARTIAL` Saved Presets persist reusable configurations; general automatic last-setting restore remains TODO.
- `TODO` Analyze the source file and recommend sensible settings.
- `TODO` Quick Recommendation analysis using ffprobe/FFmpeg source information such as codec, bitrate, resolution, frame rate, duration, audio bitrate, stream layout, and other useful characteristics.
- `TODO` Identify practical ways to make the file smaller while minimizing visible quality loss, including codec, bitrate, resolution, frame-rate, and audio recommendations.
- `TODO` Explain each recommendation in plain English, including the expected tradeoff in size, quality, speed, and compatibility.
- `TODO` Detect when the source is already efficiently compressed and warn when re-encoding is unlikely to help or could reduce quality.
- `TODO` Optional Deep Analysis mode that sample-encodes representative portions of the video and compares candidate settings before recommending an encode.
- `TODO` Quality-comparison metrics for Deep Analysis, using SSIM/PSNR where available and VMAF if a future native build includes suitable support.
- `TODO` Use the analysis results with Target File Size mode to say whether a requested size is realistic before encoding.
- `TODO` Automatically identify when re-encoding is unnecessary.
- `TODO` Auto codec/settings mode tied to target-size and user priorities.

# 8. Audio tools

- `DONE` Extract audio.
- `DONE` Remove audio.
- `TODO` Replace audio track — planned for the timeline audio-track phase.
- `TODO` Select among multiple audio tracks.
- `DONE` Audio bitrate controls for supported re-encode/extraction workflows.
- `TODO` Volume adjustment.
- `TODO` Loudness normalization.
- `TODO` Peak normalization.
- `TODO` EQ controls.
- `TODO` Bass and treble controls.
- `TODO` Noise reduction where practical.
- `TODO` Trim silence.
- `DONE` Mono/stereo channel-layout conversion options are available in supported audio workflows.
- `TODO` Mono-to-stereo conversion where useful.
- `PARTIAL` Output channel-layout selection supports Keep/Mono/Stereo and additional layouts where codec support permits; per-source-channel routing remains TODO.
- `TODO` Sample-rate conversion.
- `TODO` Mix multiple audio sources — use A2/A3 timeline tracks for music/voiceover after the visual timeline foundation and Join/Merge.
- `TODO` Add background music.
- `TODO` Audio fades.
- `TODO` Preserve/copy the original audio without re-encoding when appropriate.

# 9. Subtitle tools

- `TODO` Detect subtitle tracks.
- `TODO` Select subtitle tracks.
- `TODO` Remove subtitle streams.
- `TODO` Extract subtitle streams.
- `TODO` Add external subtitle files.
- `TODO` Burn subtitles permanently into video.
- `TODO` Copy compatible subtitles into a new container.
- `TODO` Convert supported subtitle formats.
- `TODO` Select subtitle language/track.
- `TODO` Style burned subtitles where supported.
- `TODO` Basic subtitle metadata handling.

# 10. Video filters, watermarks, text, and overlays

- `TODO` Brightness.
- `TODO` Contrast.
- `TODO` Saturation.
- `TODO` Hue.
- `TODO` Sharpen.
- `TODO` Blur.
- `TODO` Denoise.
- `TODO` Grayscale.
- `TODO` Deinterlace.
- `TODO` Color temperature where practical.
- `TODO` Gamma.
- `TODO` Simple color-correction presets.
- `TODO` Image/logo watermark.
- `TODO` Text overlay.
- `TODO` Date/time overlay.
- `TODO` Custom captions.
- `TODO` Picture-in-picture.
- `TODO` Overlay position and size controls.
- `TODO` Overlay opacity controls.
- `TODO` Overlay start/end times.
- `TODO` Preview overlays before processing where practical.

# 11. Image, frame, thumbnail, and GIF tools

- `PARTIAL` Basic GIF creation is available.
- `TODO` Improved GIF start/end selection.
- `TODO` GIF FPS controls.
- `TODO` GIF size/resolution controls.
- `TODO` GIF quality controls.
- `TODO` Extract a single frame/screenshot at a selected timestamp.
- `TODO` Extract frames every X seconds.
- `TODO` Export full image sequences.
- `TODO` Thumbnail generator.
- `TODO` Contact-sheet generator.

# 12. Detailed media inspector and metadata

- `PARTIAL` Basic ffprobe/media inspection exists.
- `TODO` Container information.
- `TODO` Video codec/profile/level details.
- `TODO` Audio codec details.
- `TODO` Subtitle-track details.
- `TODO` Resolution.
- `TODO` Frame rate.
- `TODO` Duration.
- `TODO` Bitrate.
- `TODO` Color information where available.
- `TODO` Full track/stream information.
- `TODO` Metadata viewer.
- `TODO` Metadata editor for title, artist, album, comments, copyright, etc.
- `TODO` Cover art where supported.
- `TODO` Preserve metadata option.
- `TODO` Remove metadata option.
- `TODO` Keep technical information accessible without cluttering Beginner mode.

# 13. Output and file-management improvements

- `PARTIAL` Output-file selection and saving are working.
- `TODO` Better automatic output filenames.
- `TODO` Custom filename templates.
- `TODO` Output-folder controls.
- `TODO` Avoid accidental overwrites.
- `TODO` Automatically suggest the correct extension.
- `TODO` Free-space checks.
- `DONE` Estimated output file size, including live projection during processing and audio-only estimate correction.
- `TODO` Convenient access to completed files.
- `TODO` Share finished files with other Android apps.
- `TODO` Conversion history.
- `TODO` Re-run a previous job.

# 14. Progress, performance, and reliability

- `DONE` Basic conversion progress percentage.
- `DONE` Cancellation.
- `DONE` Human-readable errors plus technical details.
- `DONE` Current FFmpeg processed-media timestamp is displayed during conversion (currently shown as raw seconds, e.g. `Processed 1233.5 s`).
- `DONE` Encoding speed display verified on a physical device (for example `7.38x`).
- `DONE` Show current processed media position in human-readable time.
- `DONE` Show current processed media position together with total duration.
- `TODO` Keep encoding speed beside the time/progress display.
- `DONE` Elapsed real-world conversion time.
- `DONE` Estimated time remaining.
- `DONE` Estimated/projected final file size during encoding.
- `DONE` Hardware/software MediaCodec capability detection and resolution/rate-mode preflight.
- `TODO` Automatic software fallback when hardware encoding fails.
- `TODO` Recovery from failed jobs without losing the batch queue.
- `PARTIAL` Preflight validation now covers encoder dimensions/capabilities, container compatibility, trim ranges, source-audio requirements, and diagnostic-test requirements; continue expanding.
- `TODO` Better handling of very large files.

# 15. Beginner and Advanced modes

- `PARTIAL` Advanced raw FFmpeg arguments already exist.
- `TODO` Beginner mode with simplified plain-English choices.
- `TODO` Hide unnecessary codec/technical details in Beginner mode.
- `TODO` Auto recommendations.
- `TODO` Advanced codec details, profiles, levels, bitrates, and technical settings.
- `TODO` Generated FFmpeg command preview.
- `TODO` Copy generated FFmpeg command.
- `TODO` Human-readable explanation of the generated command.
- `TODO` Warnings for incompatible or unreasonable setting combinations.
- `TODO` Searchable tools panel.
- `TODO` Favorites/pinned tools.

# 16. Streaming and specialized output

- `TODO` HLS output.
- `TODO` .m3u8 playlist generation.
- `TODO` Segment creation.
- `DONE` MPEG transport-stream output verified with H.264/AAC.
- `TODO` Web-friendly MP4 output.
- `DONE` WebM output verified with VP9+Opus and AV1+Opus.
- `TODO` Streaming-oriented presets.
- `TODO` Appropriate segmented-output controls.

# 17. UI and usability polishing

- `TODO` Better media previews.
- `TODO` Cleaner navigation as the feature set grows.
- `TODO` Light/dark appearance improvements.
- `TODO` Better status screens.
- `TODO` Easier settings organization.
- `DONE` Compact inline info controls with option-specific explanations for major settings.
- `TODO` Keep common tasks simple while preserving expert controls.
- `PARTIAL` Settings includes diagnostic-preset visibility and advanced controls; continue polishing.

# 18. Native-engine and build work

These items are the work most likely to require GitHub Actions / Android NDK builds. They should be done in controlled batches after the Android-side features are defined.

- `DONE` Current ARM64 FFmpeg/ffprobe Android engine build pipeline.
- `DONE` Current engine includes Android MediaCodec support.
- `NATIVE BUILD` Add libx264 if desired.
- `NATIVE BUILD` Add libx265 if desired.
- `NATIVE BUILD` Add libvpx for VP8/VP9 where needed.
- `NATIVE BUILD` Add an AV1 encoder library such as libaom or another suitable option.
- `PARTIAL` Current engine already provides an Opus encoder used successfully for mono/stereo; external libopus/other libraries remain optional if future requirements exceed current support.
- `NATIVE BUILD` Expand Android MediaCodec support where practical.
- `NATIVE BUILD` Add additional CPU architectures such as x86_64 if needed.
- `NATIVE BUILD` Record the upstream FFmpeg commit used for each engine build.
- `NATIVE BUILD` Maintain codec build profiles and license notices for bundled libraries.
- `NATIVE BUILD` Automated build/smoke-test improvements.
- `NATIVE BUILD` Release APK artifacts when appropriate.
- `NATIVE BUILD` Consider a future full JNI/shared-library FFmpeg integration only if the current executable-based integration becomes limiting.

# Recommended development order

The current priority is to build out Android-side features while leaving the verified native engine alone whenever possible.

1. **Verify v0.9.8 Unified Compact UI + Timeline Ruler** on-device.
2. Add project-aware per-clip Trim/Split plus drag reordering/removal on V1.
3. Add waveform-backed A1/A2/A3 audio tracks for source audio, music, and voiceover.
4. Replace/select/mix audio tracks and broader audio tools.
5. Subtitle tools.
6. Batch conversion queue and history.
7. Smart Target / automatic recommendation refinement and MediaCodec calibration.
8. Beginner/Advanced mode and broader UI polish.
9. One controlled native-engine expansion phase only when existing packaged capabilities are insufficient.
10. Further hardware acceleration and optimization.

# Development-track guidance

## Usually does NOT require a GitHub/native FFmpeg rebuild

Target-file-size logic, automatic bitrate calculations, media-inspection UI, presets, batch queues, timeline/crop UI, merge/split orchestration, history, metadata UI, file-management improvements, progress estimates, Beginner/Advanced modes, and most features that can be expressed through capabilities already present in the packaged FFmpeg engine.

## Likely DOES require a GitHub/native FFmpeg rebuild

Adding external native libraries such as x264, x265, libvpx, AV1 encoders, libopus, additional CPU architectures, major MediaCodec changes, or replacing the current FFmpeg executable integration with a different native architecture.

# Development-only test system

- `DONE` Per-build **Test This Build** guide with exact instructions and automatic test-setting application.
- `DONE` Build tests can declare **NO ENCODE REQUIRED**.
- `DONE` BUILD TEST ACTIVE card keeps instructions visible during a controlled run.
- `PARTIAL` Long Test This Build dialog was made scrollable in v0.8.9; preserve and continue verifying small-screen behavior.
- `DONE` Diagnostic reports carry build-test names plus Run ID/report fingerprints for duplicate recognition.
- `TODO` Remove/disable development-only testing UI for the finished production release.

# Tutorials

- `PARTIAL` Spotlight/coach-mark tutorial foundation exists: dim screen and highlight relevant controls.
- `TODO` Continue adding tutorial coverage for new user-facing workflows without forcing one huge first-run sequence.
- `TODO` Keep tutorials re-openable from Help/About or the relevant feature.

# Current decoder/editor maintenance

- `PARTIAL` VP9/AV1 Normalize & Join decoder guard — v0.9.4 device logs proved the packaged FFmpeg decode path can fail immediately; v0.9.5 blocks this unsafe normalization path. A future decoder fallback/native/media-stack solution remains TODO.
- `TODO` Project-aware per-clip Trim/Split/reordering inside the unified Main editor.

# Known maintenance items from v0.8.9

- `PARTIAL` Suppress video/keyframe seek warnings for audio-only outputs — implementation exists; dedicated audio-only verification report still pending.
- `DONE` Allow useful container seek probes for short trimmed/split clips when enough keyframes exist — verified on both v0.9.0 split outputs.
- `DONE` Automatic H.264 hardware -> MKV lossless seek-index finalization/remux; physically verified and must be preserved.
- `PARTIAL` Android VP8/VP9/AV1 direct bitrate control works, but exact target-size behavior remains approximate; Smart Target is guarded for these paths.

# Core project rule

Kotlin + Jetpack Compose is the Android interface. FFmpeg remains the primary media-processing engine. The current working version should remain the known-good baseline while new functionality is added incrementally and verified.
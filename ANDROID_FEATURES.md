# FFmpeg Studio Android — Master Roadmap

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
- `TODO` Share completed files directly with other Android apps.
- `TODO` Native media preview/player improvements.
- `TODO` Better memory handling for very large media files.
- `TODO` Completion/failure notifications and richer background-job handling.

# 2. Smart target-file-size system

- `TODO` Enter a desired final size such as 10 MB, 25 MB, 100 MB, 700 MB, or a custom value.
- `TODO` Calculate available video bitrate automatically from duration and audio requirements.
- `TODO` Analyze the input media before choosing settings.
- `TODO` Automatically select a suitable codec, bitrate, resolution, frame rate, and audio configuration.
- `TODO` User priorities:
  - Best quality.
  - Smallest file.
  - Fastest conversion.
  - Maximum compatibility.
- `TODO` Quality safeguards that prevent unreasonable settings solely to hit an impossible size.
- `TODO` Warn when a requested file size is unrealistic and recommend alternatives.
- `TODO` Two-pass encoding when useful for more accurate size targeting.
- `TODO` Estimated output size before encoding.
- `TODO` Estimated size during encoding where practical.

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
- `NATIVE BUILD` VP8 / VP9 using a suitable encoder such as libvpx where needed.
- `NATIVE BUILD` AV1 using a suitable encoder such as libaom or another practical Android encoder.
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
- `NATIVE BUILD` Opus through libopus where needed.
- `NATIVE BUILD` Vorbis or other external audio codec libraries if needed.

## Containers and compatibility
- `DONE` Basic MP4/MKV-style conversion workflow.
- `TODO` Broader support for MOV, WebM, AVI, MPEG-TS, M4A, OGG, FLV, and other useful FFmpeg-supported containers.
- `TODO` Automatically detect codec/container incompatibilities.
- `TODO` Show only sensible combinations in Beginner mode.
- `TODO` Expose broader combinations in Advanced mode.
- `TODO` Detect available hardware encoders on the device and display only usable choices.
- `TODO` Automatic software fallback when a hardware encoder fails.

# 4. Visual trimming and editing

- `PARTIAL` Trim start/end currently available through entered values.
- `TODO` Visual video timeline.
- `TODO` Draggable trim-start handle.
- `TODO` Draggable trim-end handle.
- `TODO` Preview while seeking/trimming.
- `TODO` Frame-accurate or near-frame-accurate seeking where practical.
- `TODO` Draggable crop rectangle over video preview.
- `DONE` Basic resize/resolution selection.
- `TODO` Custom dimensions.
- `TODO` Aspect-ratio conversion.
- `TODO` Pad / letterbox controls.
- `TODO` Frame-rate selection and conversion.
- `TODO` Rotate 90° clockwise/counterclockwise and 180°.
- `TODO` Horizontal and vertical flip.
- `TODO` Split one video into multiple clips.
- `TODO` Merge/join videos.
- `TODO` Join video and audio files.
- `TODO` Reorder clips before joining.
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
- `TODO` Save custom presets.
- `TODO` Favorite/pinned presets.
- `TODO` Recent presets.
- `TODO` Remember previous settings.
- `TODO` Analyze the source file and recommend sensible settings.
- `TODO` Automatically identify when re-encoding is unnecessary.
- `TODO` Auto codec/settings mode tied to target-size and user priorities.

# 8. Audio tools

- `DONE` Extract audio.
- `DONE` Remove audio.
- `TODO` Replace audio track.
- `TODO` Select among multiple audio tracks.
- `TODO` Audio bitrate controls.
- `TODO` Volume adjustment.
- `TODO` Loudness normalization.
- `TODO` Peak normalization.
- `TODO` EQ controls.
- `TODO` Bass and treble controls.
- `TODO` Noise reduction where practical.
- `TODO` Trim silence.
- `TODO` Stereo-to-mono conversion.
- `TODO` Mono-to-stereo conversion where useful.
- `TODO` Channel selection.
- `TODO` Sample-rate conversion.
- `TODO` Mix multiple audio sources.
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
- `TODO` Estimated output file size.
- `TODO` Convenient access to completed files.
- `TODO` Share finished files with other Android apps.
- `TODO` Conversion history.
- `TODO` Re-run a previous job.

# 14. Progress, performance, and reliability

- `DONE` Basic conversion progress percentage.
- `DONE` Cancellation.
- `DONE` Human-readable errors plus technical details.
- `TODO` Elapsed time.
- `TODO` Estimated time remaining.
- `TODO` Encoding speed display.
- `TODO` Estimated final file size during encoding.
- `TODO` Hardware-encoder capability detection.
- `TODO` Automatic software fallback when hardware encoding fails.
- `TODO` Recovery from failed jobs without losing the batch queue.
- `TODO` Better validation before conversion starts.
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
- `TODO` MPEG transport-stream output.
- `TODO` Web-friendly MP4 output.
- `TODO` WebM output.
- `TODO` Streaming-oriented presets.
- `TODO` Appropriate segmented-output controls.

# 17. UI and usability polishing

- `TODO` Better media previews.
- `TODO` Cleaner navigation as the feature set grows.
- `TODO` Light/dark appearance improvements.
- `TODO` Better status screens.
- `TODO` Easier settings organization.
- `TODO` Explanations/tooltips for unfamiliar codec terminology.
- `TODO` Keep common tasks simple while preserving expert controls.
- `TODO` Settings page improvements.

# 18. Native-engine and build work

These items are the work most likely to require GitHub Actions / Android NDK builds. They should be done in controlled batches after the Android-side features are defined.

- `DONE` Current ARM64 FFmpeg/ffprobe Android engine build pipeline.
- `DONE` Current engine includes Android MediaCodec support.
- `NATIVE BUILD` Add libx264 if desired.
- `NATIVE BUILD` Add libx265 if desired.
- `NATIVE BUILD` Add libvpx for VP8/VP9 where needed.
- `NATIVE BUILD` Add an AV1 encoder library such as libaom or another suitable option.
- `NATIVE BUILD` Add libopus and other useful external audio libraries where needed.
- `NATIVE BUILD` Expand Android MediaCodec support where practical.
- `NATIVE BUILD` Add additional CPU architectures such as x86_64 if needed.
- `NATIVE BUILD` Record the upstream FFmpeg commit used for each engine build.
- `NATIVE BUILD` Maintain codec build profiles and license notices for bundled libraries.
- `NATIVE BUILD` Automated build/smoke-test improvements.
- `NATIVE BUILD` Release APK artifacts when appropriate.
- `NATIVE BUILD` Consider a future full JNI/shared-library FFmpeg integration only if the current executable-based integration becomes limiting.

# Recommended development order

The current priority is to build out Android-side features while leaving the verified native engine alone whenever possible.

1. Smart target-file-size system and automatic settings.
2. Expanded ffprobe/media inspection.
3. Presets and Auto mode.
4. Batch conversion queue.
5. Visual trimming/cropping/resizing improvements.
6. Merge/split/join tools.
7. Audio tools.
8. Subtitle tools.
9. History, estimates, reliability, and output-management improvements.
10. Beginner/Advanced mode and broader UI polish.
11. One controlled native-engine expansion phase for additional codecs/libraries.
12. Further hardware acceleration and optimization.

# Development-track guidance

## Usually does NOT require a GitHub/native FFmpeg rebuild

Target-file-size logic, automatic bitrate calculations, media-inspection UI, presets, batch queues, timeline/crop UI, merge/split orchestration, history, metadata UI, file-management improvements, progress estimates, Beginner/Advanced modes, and most features that can be expressed through capabilities already present in the packaged FFmpeg engine.

## Likely DOES require a GitHub/native FFmpeg rebuild

Adding external native libraries such as x264, x265, libvpx, AV1 encoders, libopus, additional CPU architectures, major MediaCodec changes, or replacing the current FFmpeg executable integration with a different native architecture.

# Core project rule

Kotlin + Jetpack Compose is the Android interface. FFmpeg remains the primary media-processing engine. The current working version should remain the known-good baseline while new functionality is added incrementally and verified.
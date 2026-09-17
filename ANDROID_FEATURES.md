# OpenFFmpeg Android — Master Feature List

This is the clean starting specification for rebuilding Slot-6 as a native Android application in Kotlin + Jetpack Compose while keeping the original FFmpeg codebase as the media-processing engine through Android NDK/JNI.

## Already implemented in the previous Slot-6 application — carry forward

### File handling and local processing
- Choose a video, audio, or image file.
- Display filename, size, media type, and duration.
- Process media locally on the device.
- Preserve an offline-first workflow with no upload required for normal conversion.

### Existing output formats
- MP4 using H.264/AAC.
- MKV using H.264/AAC.
- WebM using VP9/Opus.
- MOV using H.264/AAC.
- MP3 audio output.
- WAV audio output.
- FLAC audio output.
- Animated GIF output.

### Existing encoding controls
- Quality presets: High Quality, Balanced, Smaller File.
- Resolution: Original, 2160p, 1440p, 1080p, 720p, 480p, 360p.
- Frame rate: Original, 60, 30, 24, 15 FPS.
- Audio bitrate: 96, 128, 160, 192, 256, 320 kbps.
- Faster-encoding mode.
- Fast remux / stream-copy mode when possible.
- Preserve metadata toggle.
- Custom output filename.

### Existing editing controls
- Trim start time.
- Trim end time.
- Rotate 90° clockwise.
- Rotate 90° counterclockwise.
- Rotate 180°.
- Horizontal flip.
- Vertical flip.
- Playback speed: 0.5x, 0.75x, 1x, 1.25x, 1.5x, 2x.
- Volume: 50%, 75%, 100%, 125%, 150%, 200%.
- Remove audio / mute.
- Grayscale filter.

### Existing advanced tools
- Advanced FFmpeg arguments.
- Generated FFmpeg command preview.
- Copy generated command.
- Activity/FFmpeg log.
- Error logging.

### Existing job controls
- Start conversion.
- Cancel conversion.
- Progress bar.
- Progress percentage.
- Processing status.
- Result preview for video, audio, or image output.
- Save/download finished result.

### Existing screenshot and inspection tools
- Extract a PNG screenshot at a selected timestamp.
- Screenshot sizing: Original, up to 1920 px, 1280 px, or 854 px wide.
- Basic media information panel.
- FFmpeg engine status display.

## Planned features — implement in the native Android version

### Architecture and Android foundation
- Native Android application written in Kotlin.
- Jetpack Compose user interface.
- Android Studio-ready Gradle project.
- Keep the original FFmpeg source as the primary media engine.
- Compile FFmpeg for Android with the Android NDK.
- JNI/native bridge between Kotlin and FFmpeg.
- Software FFmpeg encoding fallback.
- Use supported Android hardware-accelerated codec paths where practical.
- No internet connection required for normal encoding/editing.
- Android Storage Access Framework file picker.
- Select input files and output locations.
- Save directly to Android storage.
- Share completed files with other Android apps.
- Native media preview/player.
- Better memory handling for large media files.
- Background encoding jobs where Android permits.
- Encoding-progress notifications.
- Completion/failure notifications.

### Expanded codec and format support
- H.264 / AVC.
- H.265 / HEVC.
- AV1 using suitable FFmpeg-supported encoders where practical.
- VP9.
- Opus.
- AAC.
- MP3.
- FLAC.
- WAV / PCM.
- ProRes where practical.
- Additional FFmpeg-supported image formats.
- Broader FFmpeg-supported containers beyond the initial MP4/MKV/WebM/MOV set.
- User-selectable codec and encoder options.

### Visual trim and timeline editing
- Video preview while editing.
- Draggable trim-start handle.
- Draggable trim-end handle.
- Timeline-style clip cutter.
- Frame-accurate or near-frame-accurate seeking where practical.
- Split one video into multiple clips.
- Merge clips.
- Join multiple videos.
- Join video and audio files.

### Visual crop and geometry tools
- Draggable crop rectangle over video preview.
- Crop presets.
- Resize.
- Pad / letterbox.
- Aspect-ratio conversion.
- Custom dimensions.
- Vertical 1080x1920 preset.
- Square 1080x1080 preset.
- 4K / 2160p preset.
- 1440p preset.
- 1080p preset.
- 720p preset.
- 480p preset.

### Time and motion tools
- Playback-speed changes.
- Slow motion.
- Time lapse.
- Reverse video where practical.
- Reverse audio where practical.
- Video fade in.
- Video fade out.
- Audio fade in.
- Audio fade out.

### Compression and advanced encoding
- Manual bitrate controls.
- Constant-quality controls.
- Frame-rate conversion.
- Two-pass encoding.
- Target-file-size encoding.
- Preset target sizes such as 10 MB, 25 MB, and 100 MB.
- Custom target size.
- Automatic bitrate calculation from desired size and duration.
- Estimated output size where practical.
- Estimated time remaining where practical.
- Audio-only extraction.
- Video-only output.
- Fast stream copy / remux.
- Reusable custom FFmpeg presets.

### Batch processing and queue
- Select multiple files.
- Batch conversion queue.
- Per-file status.
- Per-file progress.
- Cancel individual jobs.
- Pause/resume queue where technically practical.
- Apply one preset to all selected files.
- Assign different presets to individual files.
- Completed-job history.
- Repeat previous job.
- Retry failed jobs.

### Preset library
- Phone preset.
- TV preset.
- Archive preset.
- Discord preset.
- Email attachment preset.
- YouTube preset.
- Social-media presets.
- Save custom presets.
- Favorite/pinned presets.
- Recent presets.

### Video filters
- Brightness.
- Contrast.
- Saturation.
- Hue.
- Sharpen.
- Blur.
- Denoise.
- Grayscale.
- Deinterlace.
- Color temperature where practical.
- Gamma.
- Simple color-correction presets.

### Audio tools
- Volume adjustment.
- Loudness normalization.
- Peak normalization.
- EQ controls.
- Bass controls.
- Treble controls.
- Noise reduction where practical.
- Trim silence.
- Stereo-to-mono conversion.
- Mono-to-stereo conversion where useful.
- Channel selection.
- Sample-rate conversion.
- Audio bitrate selection.
- Replace audio track.
- Mix multiple audio sources.
- Add background music.
- Audio fades.

### Watermarks, text, and overlays
- Image/logo watermark.
- Text overlay.
- Date/time overlay.
- Custom captions.
- Picture-in-picture.
- Position controls.
- Opacity controls.
- Overlay start time.
- Overlay end time.

### Subtitle tools
- Burn subtitles into video.
- Add subtitle streams.
- Remove subtitle streams.
- Extract subtitle streams.
- Convert supported subtitle formats.
- Select subtitle language/track.
- Style burned subtitles where supported.

### Image, frame, and GIF tools
- Extract a single screenshot.
- Extract frames every X seconds.
- Export full image sequences.
- Thumbnail generator.
- Contact-sheet generator.
- Animated GIF creator.
- GIF start/end selection.
- GIF FPS control.
- GIF size controls.
- GIF quality controls.

### Detailed media inspector
- Container information.
- Video codec.
- Audio codec.
- Subtitle tracks.
- Resolution.
- Frame rate.
- Duration.
- Bitrate.
- Color information where available.
- Track/stream information.

### Metadata editor
- Title.
- Artist.
- Album.
- Comment.
- Copyright.
- Cover art where supported.
- Preserve metadata.
- Remove metadata.

### Streaming output
- HLS output.
- .m3u8 playlist generation.
- Segment creation.
- Web-friendly MP4 output.
- WebM output.
- Streaming-oriented presets.

### Android user-interface improvements
- Clean mobile-first dashboard.
- Beginner mode.
- Advanced mode.
- Light theme.
- Dark theme.
- Searchable tools panel.
- Favorites / pinned tools.
- Settings page.
- Better validation.
- Human-readable error explanations.
- Better progress display.
- Estimated output size.
- Estimated time remaining.
- Visual FFmpeg command builder.
- Human-readable explanation of the generated FFmpeg command.
- Full FFmpeg log for troubleshooting.

### Repository and build requirements
- Keep the original FFmpeg source available as the native media engine.
- Record the upstream FFmpeg commit used for each build.
- Automated Android builds.
- Codec build profiles.
- Release APK artifacts.
- Version numbers.
- Changelog.
- Android/NDK build documentation.
- License notices for bundled codec libraries.
- Automated build/smoke tests.

## Recommended development order
1. Native Android project shell: Kotlin + Jetpack Compose + NDK/JNI bridge.
2. Build original FFmpeg for Android and prove a basic conversion.
3. Port all features that already existed in the previous Slot-6 app.
4. Visual trimming.
5. Visual cropping.
6. Batch conversion queue.
7. Merge / join.
8. Target-file-size compression.
9. Subtitle tools.
10. Expanded codec support.
11. Watermarks and overlays.
12. Audio cleanup tools.
13. Preset library.
14. Detailed metadata/stream inspector.
15. Hardware-accelerated paths and further optimization.

## Core project rule
Kotlin + Jetpack Compose is the Android interface. The original FFmpeg source remains the primary media-processing engine through Android NDK/JNI rather than being replaced by an unrelated encoding library.

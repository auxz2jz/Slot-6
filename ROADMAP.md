# OpenFFmpeg Studio Roadmap

This file is the long-term feature backlog for the Slot-6 FFmpeg mirror and its browser GUI. Review this file before major UI, codec, build, or repository changes so planned ideas are not lost.

## Current project structure

- Slot-6 contains a mirror of the FFmpeg source repository.
- The browser GUI lives under `docs/`.
- The GitHub Pages app uses the FFmpeg WebAssembly runtime stored in this repository.
- The browser version is intended to process media locally on the user's device.

## Codec and encoder ideas

Potential encoders/codecs to add to a custom WebAssembly build where licensing and browser performance allow:

- H.264 / AVC
- H.265 / HEVC, including x265 where practical
- AV1 using SVT-AV1 and/or libaom-av1 where practical
- VP9
- Opus
- AAC
- MP3
- FLAC
- WAV / PCM
- ProRes where practical
- Additional image codecs/formats supported by FFmpeg

### Codec build notes

- Adding external encoders will require a custom FFmpeg WebAssembly build.
- Larger codec sets will increase download size and memory use.
- Some libraries have licensing requirements that must be reviewed before distribution.
- Browser WebAssembly is CPU/software based and will not provide the same hardware-encoding path as a native desktop build.

## GUI and workflow features

### High-priority next features

- Visual trimming with a video preview and draggable start/end controls
- Visual crop tool with draggable crop rectangle
- Batch conversion queue
- Merge / join video and audio files
- Compress to a target file size such as 10 MB, 25 MB, 100 MB, etc.
- Subtitle tools
- More codecs and encoder choices

### Conversion and output controls

- Preset library
  - Phone
  - TV
  - Archive
  - Discord
  - Email attachment
  - YouTube
  - Social media
- Resolution presets
  - 4K / 2160p
  - 1440p
  - 1080p
  - 720p
  - 480p
  - Vertical 1080x1920
  - Square 1080x1080
- Frame-rate conversion
- Constant quality controls
- Bitrate controls
- Two-pass encoding
- Target-size encoding
- Fast remux / stream copy
- Audio-only extraction
- Video-only output
- Custom output filenames
- Reusable custom FFmpeg presets

## Editing features

- Timeline-style clip cutter
- Split video into multiple clips
- Merge clips
- Replace audio track
- Mix audio from multiple sources
- Add background music
- Fade audio in/out
- Fade video in/out
- Playback speed changes
- Slow motion
- Time lapse
- Reverse video/audio where practical
- Rotate 90/180/270 degrees
- Horizontal and vertical flip
- Crop
- Resize
- Pad / letterbox
- Aspect-ratio conversion

## Video filters

- Brightness
- Contrast
- Saturation
- Hue
- Sharpen
- Blur
- Denoise
- Grayscale
- Deinterlace
- Color temperature where practical
- Gamma
- Simple color correction presets

## Watermarks, text, and overlays

- Add image/logo watermark
- Add text overlay
- Add date/time overlay
- Add custom captions
- Picture-in-picture
- Position controls
- Opacity controls
- Overlay start/end times

## Subtitle features

- Burn subtitles into video
- Add subtitle streams
- Remove subtitle streams
- Extract subtitle streams
- Convert supported subtitle formats
- Select subtitle language/track
- Style burned subtitles where supported

## Audio features

- Volume adjustment
- Loudness normalization
- Peak normalization
- EQ controls
- Bass/treble controls
- Noise reduction where practical
- Trim silence
- Stereo / mono conversion
- Channel selection
- Sample-rate conversion
- Audio bitrate selection
- Audio track replacement
- Audio track mixing

## Image and frame tools

- Extract a single screenshot
- Extract frames every X seconds
- Export full image sequences
- Thumbnail generator
- Contact sheet generator
- Animated GIF creator
- GIF start/end selection
- GIF FPS control
- GIF size and quality controls

## Media inspection and metadata

- Detailed stream information
- Video codec
- Audio codec
- Subtitle tracks
- Resolution
- Frame rate
- Duration
- Bitrate
- Color information where available
- Metadata editor
  - Title
  - Artist
  - Album
  - Comment
  - Copyright
  - Cover art where supported

## Multi-file and queue features

- Drag-and-drop multiple files
- Batch conversion
- Per-file status
- Queue pause/resume where possible
- Cancel individual jobs
- Apply one preset to all selected files
- Different presets per file
- Completed-job history
- Repeat previous job
- Retry failed jobs

## Streaming and web output

- HLS output
- `.m3u8` playlist generation
- Segment creation
- Web-friendly MP4 output
- WebM output
- Streaming-oriented presets

## User-interface improvements

- Cleaner dashboard layout
- Mobile-first controls
- Desktop expanded layout
- Light/dark theme option
- Better progress display
- Estimated output size where practical
- Estimated time where practical
- Visual command builder
- Human-readable explanation of generated FFmpeg command
- Searchable tools panel
- Favorites / pinned tools
- Recent presets
- Settings page
- Beginner mode and advanced mode
- Better validation and error explanations

## Repository and build improvements

- Keep FFmpeg mirror separate from custom GUI changes where practical
- Add automated upstream FFmpeg synchronization
- Add a scheduled sync workflow
- Record the upstream commit used for each build
- Add automated WebAssembly builds
- Add custom codec build profiles
- Add release artifacts for browser runtime builds
- Keep browser GUI deployable through GitHub Pages
- Add version numbers to the GUI and runtime
- Add changelog
- Add build documentation
- Add license notices for bundled codec libraries
- Add automated smoke tests for the web UI

## Native application possibilities

A future native desktop build could reuse the same FFmpeg source while unlocking features that browser WebAssembly cannot provide efficiently.

Potential native targets:

- Windows desktop
- Linux desktop
- macOS desktop
- Android with Kotlin + Jetpack Compose

Potential native-only advantages:

- NVIDIA NVENC hardware encoding
- Intel Quick Sync Video
- AMD AMF hardware encoding
- Better access to local files and folders
- Much larger files
- Better memory usage
- Faster multi-threaded processing
- Background jobs
- Native drag-and-drop folders
- Better access to GPU acceleration

## Browser limitations to remember

- WebAssembly encoding is generally CPU based.
- Very large media files can hit browser memory limits.
- Some browser/mobile combinations may terminate long-running jobs.
- Hardware encoders such as NVENC, Quick Sync, and AMF are not directly available to normal browser WebAssembly apps.
- Complex codecs can make the WebAssembly runtime much larger.

## Suggested development order

1. Visual trim controls
2. Visual crop controls
3. Batch conversion
4. Merge / join
5. Target-file-size compression
6. Subtitle tools
7. Expanded codec support
8. Watermarks and overlays
9. Audio cleanup tools
10. Preset library
11. Detailed metadata/stream inspector
12. Automated WebAssembly codec builds
13. Upstream FFmpeg synchronization
14. Native desktop/Android variants

## Maintenance rule

When a new feature idea is discussed, add it to this file unless it is already represented here. Before beginning a major new OpenFFmpeg Studio feature or architecture change, review this roadmap and update completed/planned items as needed.

# FFmpeg Studio v0.9.0 phone test plan

This is an **unverified candidate build** until the tests below pass on the phone. The same instructions are available in-app under **Test This Build**.

## Test 1 — Split at 00:10
1. Use the same ~30-second Jellyfish H.264/AC3 MKV used for recent short tests.
2. Open **Test This Build** and choose **Test 1 — Split at 00:10**.
3. Tap **Apply test settings**. Do not change the loaded settings.
4. Tap **Choose output folder & start** and select a folder where the two files can be created.
5. Expected: the app creates `<source>_part1.mkv` and `<source>_part2.mkv` using stream copy. Both should play and seek normally.
6. The requested split is 10 seconds, but the exact boundary may move to a nearby usable keyframe because this first Split mode does not re-encode.
7. Their durations should add up to roughly the original source duration.
8. Export **Normal + Extended** reports after the run so both media summaries and both short-clip seek probes can be checked.

## Test 2 — Audio-only diagnostics
1. Choose **Test 2 — Audio-only diagnostics**.
2. Use the same 30-second source and apply the test settings.
3. Run the Opus 96 kbps stereo extraction.
4. Expected: extraction completes normally.
5. Export the **Normal** report.
6. Pass condition: the report must not contain a video/keyframe seeking warning such as `no useful recurring keyframes` for this audio-only output.

## Test 3 — H.264 MKV seek regression
1. Choose **Test 3 — H.264 MKV seek regression**.
2. Use the same 30-second Jellyfish source and apply the test settings.
3. Run the short H.264 hardware -> MKV conversion.
4. Expected: the automatic **Rebuilding seek index** phase appears after encoding.
5. Play the finished MKV and seek to several positions.
6. Pass condition: seeking works normally and the automatic H.264/MKV seek-index finalization remains applied.
7. If the rebuild phase is missing or seeking fails, export **Normal + Extended** reports.

## What changed in v0.9.0
- First Split workflow: one cut point -> two MKV files.
- Split uses FFmpeg segment muxing with stream copy; no re-encode is performed.
- Split output is saved to one selected folder because two files are created.
- Completion UI exposes Play/Share controls for Part 1 and Part 2.
- Diagnostic reports now carry media/probe/keyframe information for both split files.
- Audio-only outputs skip video-only keyframe diagnostics and warnings.
- Container random-seek probing now runs on short outputs when recurring keyframes are available (duration threshold reduced from >30 s to >=3 s).
- Verified v0.8.3 H.264 hardware -> MKV automatic seek-index rebuild remains in place.
- Native ARM64 FFmpeg/ffprobe binaries are unchanged from v0.8.9.

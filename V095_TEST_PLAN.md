# FFmpeg Studio v0.9.5 phone test plan

Status: **candidate / not yet verified on-device**.

## Test 1 — Unified main editor timeline — NO ENCODE REQUIRED
1. Use the normal Jellyfish source as Clip 1.
2. Open **Main editor timeline**.
3. Tap **Add clip(s) / Join** and add the Jellyfish source twice more.
4. Expected: the same Main editor expands to show **Project V1** with three clips and global cross-clip scrubbing. There should not be a second independent Join timeline card outside the Main editor.
5. Scrub across both clip boundaries and confirm the project preview switches to the correct clip/local time.
6. Confirm Clip 1 Trim / Split controls remain available in the same Main editor.

## Test 2 — VP9 / AV1 normalization guard — NO ENCODE REQUIRED
1. Select mismatched Join clips where at least one source is VP9 or AV1, using one of the files that failed in v0.9.4.
2. Expected: the app explains that the packaged decoder path cannot reliably Normalize & Join that codec yet.
3. Start must remain disabled. FFmpeg must not launch, so there should be no code-69 conversion failure.
4. Matching VP9/AV1 clips may still use Fast Join because stream copy does not decode them.

## Test 3 — Supported Normalize & Join
1. Choose mismatched **H.264-based** sources that both have audio—for example an H.264/AC3 MKV plus an H.264/AAC MPEG-TS output. Avoid VP9/AV1 for this controlled test.
2. Expected: the app selects **Normalize & Join**.
3. Output should be one H.264/AAC MKV normalized to Clip 1 dimensions.
4. Play through the join boundary and seek to several positions.
5. Export **Normal + Extended** reports.

## Current editor scope
The Main editor is now the shared visual workspace for single-clip Trim/Split and multi-clip Join/Merge. In v0.9.5 the detailed Trim/Split range still targets Clip 1. Project-aware per-clip trimming/splitting/reordering is the next timeline phase. Standalone quick tools remain available.

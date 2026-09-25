# FFmpeg Studio v0.9.11 phone test plan

## Test 1 — Selected Clip Trim — NO ENCODE REQUIRED
STEP 1: Open Editor and load the normal Jellyfish H.264 MKV.
STEP 2: Add the same Jellyfish clip twice so the project has 3 clips.
STEP 3: Select Clip 2 by tapping its name in Project clips or its V1 block.
STEP 4: Confirm Clip 2 is visibly selected and the large preview follows Clip 2.
STEP 5: Put Trim In near 00:05 and Trim Out near 00:15.
STEP 6: Tap "Trim selected clip in project".

PASS:
- only Clip 2 becomes about 10 seconds long;
- Clip 1 and Clip 3 keep their original lengths;
- V1, ruler and total project runtime shrink accordingly.

## Test 2 — Selected Clip Split — NO ENCODE REQUIRED
STEP 1: Keep the 3-clip project from Test 1.
STEP 2: Select Clip 3.
STEP 3: Put the playhead about 00:10 inside Clip 3.
STEP 4: Tap "Split clip".

PASS:
- project clip count increases by one;
- old Clip 3 becomes adjacent _part1 and _part2 entries;
- the two parts together equal about the original Clip 3 duration;
- scrubbing across the two parts keeps using the same large preview correctly.

## Test 3 — Edited Fast Join export
STEP 1: Keep the edited project.
STEP 2: Use matching Jellyfish H.264/MKV sources so Fast Join is available.
STEP 3: Choose an output and start the Join.
STEP 4: Play and seek the completed file.

PASS:
- output completes and seeks;
- output duration follows the edited project runtime rather than the untouched full-file sum;
- stream-copy edit boundaries may land slightly near keyframes.

If any error appears, export Action Trace immediately and stop.

# FFmpeg Studio v0.9.13 phone test plan

## Test 1 — Drag clips directly on V1 — NO ENCODE REQUIRED

STEP 1: Open Editor and build a Join project with at least 4 clips.
STEP 2: Split one clip so _part1 and _part2 appear.
STEP 3: Long-press _part2 directly on V1, drag it left or right, then release.
STEP 4: Drag a normal clip to a different position too.
STEP 5: Compare V1 with the Project clips list.

PASS:
- dragged clip visibly follows the gesture;
- it lands in a new position on release;
- V1 and Project clips show the same order;
- selected marker follows the moved clip;
- split range/duration moves with its part;
- no clip disappears or duplicates;
- project runtime does not change just because order changes;
- ordinary horizontal swipe still scrolls V1;
- Move left / Move right buttons still work.

NO ENCODE REQUIRED.

If it fails, export Action Trace immediately.

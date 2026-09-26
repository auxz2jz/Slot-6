# FFmpeg Studio v0.9.12 phone test plan

## Test 1 — Rearrange project clips — NO ENCODE REQUIRED

STEP 1: Open Editor and create a Join project with at least 3 clips.
STEP 2: Split one clip so _part1 and _part2 appear.
STEP 3: Select _part2 in V1 or Project clips.
STEP 4: Tap Move left.
STEP 5: Move it again or use Move right.
STEP 6: Move another normal clip too.

PASS:
- V1 and Project clips show the same new order;
- selected marker follows the moved clip;
- split parts move like normal clips;
- source range/duration stays attached to the moved clip;
- no clip disappears;
- project runtime does not change just because order changed.

## Test 2 — Timestamp-safe edited Fast Join

STEP 1: Keep the trimmed/split/reordered project.
STEP 2: Use matching H.264 Jellyfish clips so Fast Join is available.
STEP 3: Choose output & start.
STEP 4: Play/seek across every clip boundary.
STEP 5: Export Normal or Extended diagnostics.

PASS:
- output order matches reordered V1;
- Trim/Split ranges remain applied;
- output completes and seeks normally;
- no obvious boundary audio/video glitch;
- report does not contain a non-monotonic DTS automatic observation;
- small keyframe-aligned fast-cut duration differences are acceptable.

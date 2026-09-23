# FFmpeg Studio v0.9.7 phone test plan

## Test 1 — Compact Editor layout — NO ENCODE REQUIRED
Load the normal Jellyfish clip and open Editor -> Main editor. Confirm the Editor uses thin dividers/small labels instead of large rounded section bubbles, V1 is visibly shorter, and A1/source labels are compact.

## Test 2 — Rotation state — NO ENCODE REQUIRED
Load 3 clips, scrub into Clip 2, change a visible setting, then rotate portrait -> landscape -> portrait. The app should remain on Editor with the same project/settings instead of returning Home/resetting.

## Test 3 — Compact V1 zoom/scrub — NO ENCODE REQUIRED
With 3 clips, test 50%, 100%, and 200% zoom and scrub across both clip boundaries. The smaller V1 strip should remain usable and the one large preview should follow the project playhead. Confirm quick tools remain under Tools.

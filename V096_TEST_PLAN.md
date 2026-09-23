# FFmpeg Studio v0.9.6 phone test plan

Status: **candidate / awaiting Android Studio and phone verification**.

## Test 1 — One preview / one timeline — NO ENCODE REQUIRED
Use the normal Jellyfish test clip. Open Editor -> Main editor. Confirm there is exactly one large preview and one V1 timeline strip underneath. Trim In/Out and Split use this same editor. No second Join preview/timeline should appear.

## Test 2 — Three clips on one V1 track + zoom — NO ENCODE REQUIRED
Add the same Jellyfish file twice more. Confirm Clip 1, Clip 2, and Clip 3 appear end-to-end on one horizontal V1 row rather than stacking vertically. Use Zoom − / Zoom + and confirm only the horizontal time scale changes. Scrub across both boundaries; the one large preview should switch to the correct source/local time. Playback handoff is an additional check, but cross-clip scrubbing is the required pass condition.

## Test 3 — Quick Tools regression — NO ENCODE REQUIRED
Open Tools. Confirm standalone Trim, Split, Join/Merge and the other quick operations remain. Choosing one should return to Editor without creating another stacked editor surface. The verified v0.9.5 VP9/AV1 Normalize warning should remain unchanged.

## Intentional limit
Detailed Trim/Split still target Clip 1 in v0.9.6. Project-aware per-clip cuts, reordering/removal, and waveform audio tracks are the next editor phase.

# FFmpeg Studio v0.9.1 phone test plan

Status: **candidate / not yet verified on-device**.

## Test 1 — Visual timeline / preview — NO ENCODE REQUIRED
Use the same ~30-second Jellyfish H.264/AC3 MKV. Open Source media -> Visual timeline. Confirm embedded preview, Play/Pause, eight thumbnail positions, tap/slider seeking, V1 playhead, draggable trim In/Out range, Set In/Set Out, and the A1 source-audio row. No encode is required; send a screenshot only for a visual/layout problem.

## Test 2 — Timeline -> Fast Trim
Apply the build test. The compact Trim settings load 00:00:05 -> 00:00:15. Open Visual timeline; its range should synchronize. Move either boundary if desired, tap **Use selected range for Fast Trim**, confirm the compact Start/End fields match, then run Trim and confirm the result plays/seeks normally.

## Test 3 — Timeline -> Split at playhead
Apply the build test. Open Visual timeline; the playhead should synchronize to about 00:00:10. Seek if desired, tap **Split at playhead**, confirm the compact Split field matches, then run Split and verify both outputs play/seek normally.

## Intentional design
The visual editor does not replace the compact fast tools. It writes into the same existing Trim/Split settings and processing pipelines. FFmpeg commands/native binaries/H.264 MKV seek finalization are unchanged in v0.9.1.

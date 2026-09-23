# FFmpeg Studio v0.9.2 phone test plan

Status: **candidate / not yet verified on-device**.

## Test 1 — Live scrub preview — NO ENCODE REQUIRED
1. Use the same ~30-second Jellyfish H.264/AC3 MKV.
2. Open **Visual timeline**.
3. Leave playback paused.
4. Drag the playhead slider slowly and quickly across several seconds.
5. Expected: the large preview should visibly refresh to the current source frame as the playhead moves instead of remaining stuck on an older frame for one or two seconds.
6. Release the slider, then press Play. Playback should continue from the selected timeline position.
7. The V1 thumbnail strip should be taller than v0.9.1.

No FFmpeg encode is required for this first test. If scrubbing still sticks, describe approximately how many seconds the preview lags. A screenshot is only needed for a layout/clipping problem.

## Regression checks
- Compact Trim and Split controls remain present.
- Timeline range can still feed Fast Trim.
- Timeline playhead can still feed Split.
- Visual timeline remains reachable in the same Convert/Tools workflow as v0.9.1.

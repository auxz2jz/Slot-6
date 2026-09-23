# FFmpeg Studio v0.9.3 phone test plan

Status: **candidate / not yet verified on-device**.

## Test 1 — Two-clip V1 timeline — NO ENCODE REQUIRED
1. Use the same ~30-second Jellyfish H.264/AC3 MKV as **Clip 1**.
2. Open **Join / merge**.
3. Choose the same Jellyfish file again as **Clip 2**.
4. Expected:
   - Source Media shows both clips.
   - V1 shows Clip 1 followed by Clip 2 as two proportional visual blocks.
   - Each block shows a representative frame, file name, and duration.
   - Combined duration is about 01:00.6.
   - The app reports **Ready for fast Join**.
5. No encode is required for this first test. A screenshot is only needed if the V1 layout is clipped, overlapping, or visually wrong.

## Test 2 — Fast Join / Merge
1. Keep the same Jellyfish file selected as both Clip 1 and Clip 2.
2. Start the Join.
3. Expected:
   - Output is MKV.
   - FFmpeg uses stream copy; no video/audio re-encode.
   - Final duration is about 60.6 seconds.
   - H.264 1920x1080 and AC3 5.1 are preserved.
   - Output size is approximately the two source sizes combined.
4. Play through the join point around 30 seconds. There should be no broken playback at the boundary.
5. Seek to several places before and after the join point.
6. Export **Normal + Extended** diagnostic reports after the run.

## Compatibility behavior
This first Join release intentionally accepts only compatible clips. If video codec/resolution/pixel format or audio structure differs, the app should block Fast Join and explain the mismatch instead of trying to create a bad output.

## Intentional limits of v0.9.3
- Exactly two clips.
- Fixed order: Clip 1 then Clip 2.
- MKV stream-copy Join only.
- No drag reordering yet.
- No automatic re-encode for mismatched clips yet.
- No transitions yet.

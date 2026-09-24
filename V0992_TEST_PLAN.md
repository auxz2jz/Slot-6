# FFmpeg Studio v0.9.9.2 phone test plan

## Test 1 — Build
Build :app:assembleDebug. Confirm versionName 0.9.9.2 / versionCode 31.

## Test 2 — Concurrent ffprobe reliability — NO ENCODE REQUIRED
Load Jellyfish as primary. Add Clip 2 and at least one additional clip, then switch Tools -> Editor a few times so multiple analyses are requested close together.

Expected: no ProcessBuilder error=2. Export Action Trace afterward; it should show unique ffprobe workspace IDs, launch-context checks, and completed analyses.

## Test 3 — Recorder regression — NO ENCODE REQUIRED
Navigate Home / Editor / Tools / Settings, rotate portrait -> landscape -> portrait, then export trace. Project state and recorder should remain intact.

If error=2 returns, export immediately and stop.

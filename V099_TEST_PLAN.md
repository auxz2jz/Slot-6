# FFmpeg Studio v0.9.9 phone test plan

## Test 1 — Action Trace basic capture — NO ENCODE REQUIRED
Open Settings -> Action trace and leave Recording on. Visit Home, Editor and Tools, change a few settings, then export the trace. Confirm ordered timestamped PAGE / TOUCH / ACTION / SETTING events and no content:// source URIs.

## Test 2 — ffprobe engine trace — NO ENCODE REQUIRED
Select/analyze Jellyfish, another known-good clip, then Jellyfish again. Export the trace. Normal runs should show "Before ffprobe analysis" and "ffprobe analysis completed". If the old error=2 issue appears, export immediately; the trace should include engine state and launch exception.

## Test 3 — Navigation / rotation trace — NO ENCODE REQUIRED
Load a clip in Editor, scrub once, rotate portrait -> landscape -> portrait, visit Tools, return to Settings and export. Project state should remain intact and the trace should show configuration and page events.

Do not spend a long time trying to reproduce the rare ffprobe issue.

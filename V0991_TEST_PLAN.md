# FFmpeg Studio v0.9.9.1 phone test plan

## Test 1 — Build first
Build `:app:assembleDebug`. The previous unresolved `awaitPointerEventScope` compile error must be gone.

## Test 2 — Action Trace basic capture — NO ENCODE REQUIRED
Leave Settings -> Action trace recording on. Visit Home, Editor and Tools, change a few settings, then export the trace. Confirm ordered PAGE / TOUCH / ACTION / SETTING events and no content:// source URIs.

## Test 3 — ffprobe + rotation trace — NO ENCODE REQUIRED
Analyze two known-good clips, rotate portrait -> landscape -> portrait, and export the trace. If the old ffprobe error appears, export immediately rather than repeatedly trying to reproduce it.

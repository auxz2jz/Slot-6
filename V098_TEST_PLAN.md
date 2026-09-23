# FFmpeg Studio v0.9.8 phone test plan

## Test 1 — Compact interface consistency — NO ENCODE REQUIRED
Open Home, Editor, Tools, Settings, and About. FFmpeg Studio branding should appear in the top bar on Home only. Other pages use a short compact title bar. Section headings, cards, buttons, and spacing should use the same compact visual language.

## Test 2 — Simplified V1 + project time ruler — NO ENCODE REQUIRED
Load the Jellyfish clip and add it twice more. Each V1 clip should have one leading thumbnail followed by a clean colored duration bar. Filename/duration overlays should not cover V1. A time ruler should appear underneath, begin at 00:00, and end near the full combined project runtime (~01:31 for three 30.3 s clips).

## Test 3 — Zoom-aware ruler + rotation regression — NO ENCODE REQUIRED
Test 50%, 100%, 200%, and 400% zoom. V1 and ruler must scroll together; tick spacing changes with zoom while total runtime stays constant. Scrub into Clip 2 and rotate portrait -> landscape -> portrait; Editor/project state should remain intact.

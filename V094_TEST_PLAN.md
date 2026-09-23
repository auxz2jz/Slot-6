# FFmpeg Studio v0.9.4 phone test plan

## Test 1 — Multi-clip timeline scrub — NO ENCODE REQUIRED
Use the usual Jellyfish clip as Clip 1. Add it two more times. Confirm 3 labeled V1 blocks and scrub the global playhead across both boundaries. The large preview must switch to the source under the playhead and show local clip time.

## Test 2 — Fast Join three matching clips
Join three copies of the Jellyfish file. Expected: ~90.9 s, original H.264 1920x1080 + AC3 5.1 retained, normal playback and seeking across both boundaries. Export Normal + Extended reports.

## Test 3 — Normalize mixed files
Choose two or more videos with different container/codec/resolution. Every clip should have video + audio. The app should switch to Normalize & Join rather than reject the mismatch. Expected output: one H.264/AAC MKV using Clip 1 frame size. Export Normal + Extended reports.

Intentional limits:
- clip order is still add/selection order;
- Normalize & Join currently requires audio in every clip;
- drag reorder, transitions, and A2/A3 music/voiceover come next.

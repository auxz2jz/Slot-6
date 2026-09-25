# FFmpeg Studio v0.9.10 phone test plan

All tests are **NO ENCODE REQUIRED**.

## Test 1 — Clip list + individual Remove
1. Open Editor.
2. Choose one normal video.
3. Tap Add clips and select at least two more videos.
4. Confirm every clip name appears in the Project clips text list.
5. Tap Remove on the middle clip.

PASS: that filename disappears from the list and V1. Later clips shift left one position. The project runtime/ruler recalculates.

## Test 2 — Clear all clips
1. With at least three clips loaded, tap Clear all clips.
2. Confirm the project has zero clips and no primary source remains.
3. Tap Add clips and select two or more videos.

PASS: the project repopulates as Clip 1, Clip 2, Clip 3... without first using Choose input file.

## Test 3 — ffprobe regression
1. Add four or five clips.
2. Remove two different clips one at a time.
3. Add two clips again.
4. Go Tools -> Editor -> Tools -> Editor once.

PASS: no ffprobe ProcessBuilder error=2. If any source-analysis error appears, export Action Trace immediately and stop. Otherwise no trace is needed.

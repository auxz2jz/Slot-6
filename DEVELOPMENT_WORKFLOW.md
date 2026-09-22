# FFmpeg Studio Android — Development / GitHub Checkpoint Workflow

Purpose: prevent project progress from being trapped in one long chat.

## Repository location

- Repository: `auxz2jz/Slot-6`
- Android development branch: `native-android-v0.2`

## Required checkpoint cadence

After every verified build or meaningful engineering decision, update GitHub before moving far ahead.

At minimum update:
1. `PROJECT_STATUS.md`
2. `ANDROID_FEATURES.md`
3. `VERIFICATION_HISTORY.md` when a test materially changes conclusions
4. changelog/version notes when a release is produced
5. `NEXT_CHAT_START_HERE.md` if the next feature or critical baseline changes

Do not wait for the chat to become full before saving state.

## Before starting work in a new chat

The assistant should:
1. Read `NEXT_CHAT_START_HERE.md`.
2. Read `PROJECT_STATUS.md`.
3. Read `ANDROID_FEATURES.md`.
4. Read `VERIFICATION_HISTORY.md`.
5. Confirm the current Android branch and version.
6. Inspect the source version before modifying code.

If repository source is older than the verified artifact/version described in the status files, do not overwrite newer work with older code. Reconcile first.

## Release discipline

Use small releases.

Preferred pattern:
- one feature or one tightly related reliability group;
- preserve proven behavior;
- avoid native FFmpeg rebuild unless needed;
- add/update Test This Build instructions;
- give exact test settings through an in-app build-test preset;
- user verifies on the phone;
- reports are analyzed;
- GitHub checkpoint is updated;
- move to next feature.

Do not bundle many unverified roadmap items into one release.

## Physical verification rule

Use status labels consistently:
- `DONE` = implemented and verified on-device when physical verification is relevant.
- `PARTIAL` = implemented only in part, or code exists but roadmap work/verification remains.
- `TODO` = not implemented.
- `NATIVE BUILD` = likely requires rebuilding/expanding packaged FFmpeg native engine.

Do not mark a feature DONE merely because code compiled.

## Test This Build policy

During active development, each build should carry an on-screen Test This Build guide.

Each test should state:
- what changed;
- what source media to use;
- exact expected settings;
- expected result;
- whether encoding is required;
- what the user should visually check;
- whether Normal/Extended reports are required;
- whether a screenshot is required.

Provide **Apply test settings** for controlled tests whenever possible.

If no encode is needed, explicitly show:
**NO ENCODE REQUIRED**

Long instructions must be scrollable.

## Diagnostic report policy

Normal/Extended reports are the technical source of truth.

Each conversion should preserve:
- stable Run ID;
- report ID;
- report fingerprint;
- schema version.

Duplicate detection:
same Report ID + fingerprint = same captured report state.

The assistant should ignore duplicate report uploads after confirming identity rather than repeatedly analyzing them.

Screenshots are only needed for:
- visual layout problem;
- incorrect on-screen value;
- tutorial/highlight issue;
- control overlap/cutoff;
- something displayed differently from the report.

Do not require screenshots of expanded Technical Details when the same content is already in reports.

## H.264/MKV regression rule

The verified H.264 hardware -> MKV workflow includes automatic lossless seek-index finalization/remux.

This was proven necessary by the C -> E experiment and physically verified in v0.8.3.

Any change touching:
- H.264 command construction,
- MKV muxing,
- output finalization,
- stream-copy/remux,
- post-processing,
must preserve or deliberately replace this behavior and should include a seek regression test.

## Native-engine rule

Keep native FFmpeg/ffprobe binaries unchanged for Kotlin/UI/workflow features when the current engine already has the needed capability.

Native rebuilds should be isolated and deliberate.

Possible future native additions:
- libx264
- libx265
- libvpx
- software AV1
- other audio encoders
- other ABIs

Before adding native third-party libraries:
- review licensing;
- document source/version;
- document build flags;
- preserve a known-good prior engine;
- do one controlled build/check cycle at a time;
- never poll/retry GitHub Actions in an uncontrolled loop.

## UI evolution rule

The user wants incremental UI improvement every version, not a full redesign all at once.

Preferred:
- compact vertical layout;
- inline `ⓘ` next to the control;
- option-specific explanations;
- dimmed spotlight tutorials;
- scrollable dialogs;
- simple normal workflow retained as advanced features grow.

## Current next-step rule

At the checkpoint dated 2026-09-22:
- current verified release line: v0.8.9;
- next feature: **Split**;
- Split should be developed and verified before Join/Merge;
- next cleanup: suppress video/keyframe warnings for audio-only outputs;
- consider enabling seek probes for short trim/split outputs.

After Split is verified, checkpoint these files again before starting Join/Merge.


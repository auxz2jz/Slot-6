# FFmpeg Studio v0.9.8.1 compile-fix test plan

## Test 1 — Build
Build the project in Android Studio exactly as before. The previous `App.kt:1000:100 Double but Float expected` error must be gone and `:app:compileDebugKotlin` should pass.

## Test 2 — v0.9.8 UI/ruler checks
After install, repeat the v0.9.8 no-encode checks:
- compact interface consistency;
- one thumbnail per V1 clip plus clean duration bar;
- zoom-aware project time ruler;
- rotation state preservation.

No media-engine behavior was intentionally changed.

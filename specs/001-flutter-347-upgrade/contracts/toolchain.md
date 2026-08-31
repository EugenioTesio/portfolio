# Contract: Toolchain

The project exposes a **supported runtime** to maintainers and CI. After this feature, that contract is:

| Surface | Requirement |
|---------|-------------|
| Local SDK | Flutter 3.47.2 stable (Dart 3.13.2) |
| `pubspec.yaml` `environment.sdk` | `^3.13.0` |
| PR workflow | `.github/workflows/all-pr-checks.yml` uses `flutter-version: "3.47.2"` and `channel: stable` |
| Web deploy workflows | `.github/workflows/firebase-hosting-merge.yml` and `firebase-hosting-pull-request.yml` use the same pin |
| Human docs | README Flutter/Dart badges and constitution Technical Constraints describe 3.47.x / Dart `^3.13.0` |

**Verification**: `flutter --version` in CI logs shows 3.47.2. `flutter pub get` succeeds without SDK solver errors.

**Non-goals**: Dart 4, Flutter versions outside the 3.47 line, new host platforms.

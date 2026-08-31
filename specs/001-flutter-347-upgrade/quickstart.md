# Quickstart: Validate Flutter 3.47 upgrade

Use this after implementation to prove the spec’s independent tests. Commands assume Flutter **3.47.2** is the active SDK (`flutter --version`).

## Prerequisites

- Flutter 3.47.2 stable (Dart 3.13.2)
- Repo checkout of this feature branch
- No extra env files required (Firebase web options are in `lib/firebase_options.dart`)

## 1. Resolve and generate

```bash
flutter --version          # expect 3.47.2 / Dart 3.13.x
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

**Expect**: No solver errors. Generated `*.g.dart` and l10n files under `lib/src/localization/` (not `package:flutter_gen`).

## 2. Quality gates

```bash
dart format --line-length=80 --set-exit-if-changed .
flutter analyze
flutter test
flutter build web
```

**Expect**: Format clean, analyze with no issues, all existing tests pass, web build succeeds. See [contracts/quality-gates.md](contracts/quality-gates.md).

## 3. Local visitor check

```bash
flutter run -d chrome
```

Walk [visitor journeys](contracts/visitor-journeys.md) VJ-1–VJ-7 at mobile, tablet, and desktop widths (DevTools device mode or window resize using existing `Responsive` breakpoints).

**Expect**: Home, projects, theme switch, language switch, and outbound links behave as before. URLs have no hash prefix.

## 4. Inventory check

Compare `pubspec.yaml` / `pubspec.lock` to [contracts/dependency-inventory.md](contracts/dependency-inventory.md). Every declared package is upgraded, replaced, or removed as listed; no stray `envied` or `url_strategy`.

## 5. Docs / CI check

- `.github/workflows/all-pr-checks.yml` and both Firebase Hosting workflows pin `3.47.2`
- README badges say Flutter 3.47 and Dart 3.13
- `.specify/memory/constitution.md` Technical Constraints match the new SDK range

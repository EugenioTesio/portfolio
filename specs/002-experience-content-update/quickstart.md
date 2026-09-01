# Quickstart: Validate experience content update

Use this after implementation to prove the spec’s independent tests. Flutter **3.47.x** (Dart 3.13.x) should already be the active SDK.

## Prerequisites

- Repo checkout of this feature
- `flutter pub get` already succeeds (no new packages required)

## 1. Generate localization

```bash
flutter gen-l10n
```

**Expect**: `ittiDevJobTitle` / `ittiDevJobDescription` exist on `AppLocalizations` in EN and ES. No missing-key analyzer errors.

## 2. Quality gates

```bash
dart format --line-length=80 --set-exit-if-changed .
flutter analyze
flutter test
```

**Expect**: Format clean, analyze clean, all tests pass including new experience assertions. See [contracts/quality-gates.md](contracts/quality-gates.md).

## 3. Local visitor check

```bash
flutter run -d chrome
```

Walk [visitor journeys](contracts/visitor-journeys.md):

1. Open Experience — ITTI / ueno bank / Mobile Expert is first; dates include Present.
2. Confirm bold orange terms in bullets (light and dark theme).
3. Scroll remaining four roles — impact-driven categories, not old task lists.
4. Switch to Spanish — Experto Mobile, `Actual`, translated bullets, same highlights.
5. Resize to mobile and desktop — chips wrap; no horizontal overflow.

## 4. Content check

Compare on-screen copy to [contracts/content-catalog.md](contracts/content-catalog.md). Highlighted phrases must match `<strong>` spans. Chip list for ITTI must match [data-model.md](data-model.md).

## 5. Theme token check

Inspect `lib/src/constants/theme.dart`: both themes register `HighlightColors`. `ExperienceCard` must not contain a raw orange hex.

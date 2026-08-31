# Implementation Plan: Flutter 3.47 Upgrade

**Branch**: `cursor/flutter-347-upgrade` | **Date**: 2026-08-31 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from `/specs/001-flutter-347-upgrade/spec.md`

**Note**: This template is filled in by the `/speckit-plan` command; its definition describes the execution workflow.

## Summary

Bring the portfolio onto **Flutter 3.47.2** (Dart 3.13.2) and move every third-party library to the latest version that resolves on that SDK. Preserve visitor journeys, feature-first layout, Riverpod (migrated 2 → 3), localization, and theming. Replace `url_strategy` with SDK `usePathUrlStrategy`, replace unmaintained `auto_size_text` with `auto_size_text_plus`, and remove unused `envied`. Remove `custom_lint` (Riverpod 3.1.4+ uses `analysis_server_plugin`). Pin transitive `html` to `0.15.5+1` so `flutter_html` 3.0.0 compiles. Pin CI and hosting workflows to 3.47.2; update constitution and README runtime docs.

## Technical Context

**Language/Version**: Dart `^3.13.0` (bundled with Flutter 3.47.2)

**Primary Dependencies**: Flutter 3.47.2 SDK; Riverpod 3.4.x + riverpod_annotation 4.x; FlexColorScheme 8.4; firebase_core 4.14; google_fonts 8.2; font_awesome_flutter 11; flutter_html 3.0; seo 0.0.10; url_launcher 6.3; auto_size_text_plus 3.0.2 (replaces auto_size_text)

**Storage**: N/A (static content in assets, ARB, and in-code repositories)

**Testing**: `flutter_test` + Patrol 4.x widget tests (`test/src/app_test.dart`)

**Target Platform**: Flutter Web (Firebase Hosting); existing mobile/desktop project folders unchanged

**Project Type**: Existing single Flutter application (feature-first under `lib/src/features/`)

**Performance Goals**: Local checkout → running site under 10 minutes excluding first SDK install (SC-001); production `flutter build web` succeeds

**Constraints**: No Dart 4; no new visitor features; no cross-feature imports; no ad-hoc theme/copy; quality gates must pass on 3.47.2; do not delete tests to hide upgrade breakage

**Scale/Scope**: One app, ~4 features (introduction, about, experience, project) + main shell; ~20 pub packages; 1 widget test file plus generated Riverpod parts

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

| Principle | Gate | Pre-research | Post-design |
|-----------|------|--------------|-------------|
| I. Feature-first | No new capabilities outside `lib/src/features/<feature>/`; no cross-feature bypasses | Pass — upgrade only | Pass — plan does not add features or shared shortcuts |
| II. Riverpod | State via Riverpod; providers beside features; no new global singletons | Pass if 2.x kept **or** 3.x with same placement | Pass — migrate to Riverpod 3/annotation 4; regenerate `*.g.dart`; keep `@riverpod` next to features |
| III. Responsive & accessible | Existing breakpoints and semantics preserved | Pass | Pass — VJ-7; Patrol width variants kept |
| IV. Localization & theming | No hard-coded copy; theme from `theme.dart` / FlexColorScheme | Pass | Pass — l10n moves off `flutter_gen` into `lib/src/localization/`; FCS 8 edits stay in `theme.dart` |
| V. Quality gates | format, analyze, test; commit generated files | Pass if CI updated | Pass — pin 3.47.2; enable codegen in PR checks; `flutter build web` on hosting workflows |
| Technical constraints | Flutter 3.x, Dart range, Firebase hosting, YAGNI deps | Current docs still say Dart `>=3.0.2` / CI 3.10.2 | Pass after implementation PATCH of constitution + README (FR-013). New packages limited to FR-014 replacements (`auto_size_text_plus`, SDK `flutter_web_plugins`). |

**Gate result**: PASS. No unjustified violations. Constitution Technical Constraints will be amended (PATCH) during implementation to name Flutter 3.47.x and Dart `^3.13.0`.

## Project Structure

### Documentation (this feature)

```text
specs/001-flutter-347-upgrade/
├── plan.md              # This file (/speckit-plan command output)
├── research.md          # Phase 0 output (/speckit-plan command)
├── data-model.md        # Phase 1 output (/speckit-plan command)
├── quickstart.md        # Phase 1 output (/speckit-plan command)
├── contracts/           # Phase 1 output (/speckit-plan command)
│   ├── toolchain.md
│   ├── quality-gates.md
│   ├── visitor-journeys.md
│   └── dependency-inventory.md
└── tasks.md             # Phase 2 output (/speckit-tasks command - NOT created by /speckit-plan)
```

### Source Code (repository root)

```text
lib/
├── main.dart
├── firebase_options.dart
└── src/
    ├── app.dart
    ├── common_widgets/
    ├── constants/          # theme.dart, sizes.dart
    ├── localization/       # ARB + generated app_localizations (post-upgrade)
    └── features/
        ├── about/
        ├── experience/
        ├── introduction/
        ├── main/
        └── project/

test/
└── src/
    └── app_test.dart

.github/workflows/
├── all-pr-checks.yml
├── firebase-hosting-merge.yml
└── firebase-hosting-pull-request.yml

pubspec.yaml
l10n.yaml
analysis_options.yaml
README.md
.specify/memory/constitution.md
```

**Structure Decision**: Keep the existing single Flutter app. Do not add packages, apps, or a new feature module. Changes concentrate on `pubspec.yaml`, CI workflows, `lib/main.dart`, `lib/src/constants/theme.dart`, `lib/src/common_widgets/app_text.dart`, Font Awesome call sites, `l10n.yaml` + l10n imports, Riverpod `*.g.dart`, tests, README, and constitution.

## Complexity Tracking

> No constitution violations require justification.

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| — | — | — |

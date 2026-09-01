# Implementation Plan: Experience Content Update

**Branch**: `002-experience-content-update` | **Date**: 2026-09-01 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from `/specs/002-experience-content-update/spec.md`

**Note**: This template is filled in by the `/speckit-plan` command; its definition describes the execution workflow.

## Summary

Add the current **ITTI S.A.E.C.A. / ueno bank** Mobile Expert role as the first Experience card, rewrite Pairtree, Tandamos, Valtech, and Freelance into the Standard Impact-Driven Format, and render key terms as **bold orange** using a shared theme token plus existing `flutter_html` `<strong>` markup. Copy lives in EN/ES ARB files. No new packages.

## Technical Context

**Language/Version**: Dart `^3.13.0` / Flutter 3.47.x

**Primary Dependencies**: Existing stack only — Flutter SDK, Riverpod 3.4.x, FlexColorScheme 8.4, `flutter_html` 3.0, `flutter_localizations` / ARB, Patrol 4.x for widget tests

**Storage**: N/A (in-memory `ExperienceRepository` + ARB)

**Testing**: `flutter_test` + Patrol widget tests (`test/src/app_test.dart` plus new experience assertions)

**Target Platform**: Flutter Web (Firebase Hosting); existing mobile/desktop shells unchanged

**Project Type**: Existing single Flutter application (feature-first under `lib/src/features/`)

**Performance Goals**: Experience section remains instantly scannable (SC-003: current role identifiable within 5 seconds); no new network calls

**Constraints**: Constitution I–V; no ad-hoc colors; no hard-coded user copy in widgets; 80-char lines; no new dependencies; resume PDF out of scope

**Scale/Scope**: 5 experience records; 1 new optional domain field; 1 theme extension; 2 ARB files + generated l10n; 1 card widget style map; chip wrap on ITTI (~23 chips)

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

| Principle | Gate | Pre-research | Post-design |
|-----------|------|--------------|-------------|
| I. Feature-first | Experience stays under `lib/src/features/experience/`; shared tokens only in `constants/` | Pass | Pass — `HighlightColors` in `theme.dart`; `companyContext` on domain `Experience`; no cross-feature imports |
| II. Riverpod | Existing `experienceRepositoryProvider`; no new global singletons | Pass | Pass — reuse provider; no annotation change expected |
| III. Responsive & accessible | Mobile/tablet/desktop card layout preserved; chips wrap | Pass | Pass — VJ-5; mobile date placement unchanged |
| IV. Localization & theming | ARB copy; theme tokens not widget hex | Pass | Pass — content catalog in ARB; orange via `ThemeExtension` |
| V. Quality gates | format, analyze, test; commit generated l10n | Pass | Pass — [contracts/quality-gates.md](contracts/quality-gates.md) |
| Technical constraints | Flutter 3.47.x, YAGNI deps, package imports, 80-col | Pass | Pass — no new packages; `flutter_html` Style only |

**Gate result**: PASS. No unjustified violations. Complexity Tracking empty.

## Project Structure

### Documentation (this feature)

```text
specs/002-experience-content-update/
├── plan.md              # This file (/speckit-plan command output)
├── research.md          # Phase 0 output
├── data-model.md        # Phase 1 output
├── quickstart.md        # Phase 1 output
├── contracts/
│   ├── content-catalog.md
│   ├── highlight-styling.md
│   ├── visitor-journeys.md
│   └── quality-gates.md
└── tasks.md             # Phase 2 output (/speckit-tasks — not created here)
```

### Source Code (repository root)

```text
lib/src/
├── constants/
│   └── theme.dart                    # HighlightColors ThemeExtension
├── localization/
│   ├── app_en.arb                    # ITTI + rewritten descriptions
│   ├── app_es.arb
│   └── app_localizations*.dart       # generated
└── features/experience/
    ├── domain/experience.dart        # optional companyContext
    ├── data/experience_repository.dart
    └── presentation/
        ├── experience_section.dart   # unchanged shell
        ├── experience_desktop.dart   # list still most-recent-first
        └── widgets/experience_card.dart  # Html strong styles + context label

test/src/
├── app_test.dart                     # keep width variants
└── features/experience/              # new assertions (path flexible)
```

**Structure Decision**: Stay in the existing experience feature. Do not add a new feature module, package, or HTML renderer. Theme extension is the only shared-layer change.

## Complexity Tracking

> No constitution violations require justification.

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| — | — | — |

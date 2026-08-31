<!--
Sync Impact Report
- Version change: 1.0.0 → 1.0.1
- Modified principles: None
- Added sections: None
- Removed sections: None
- Technical Constraints: Runtime pinned to Flutter 3.47.x / Dart ^3.13.0;
  hosting secrets guidance no longer names unused envied
- Follow-up TODOs: None
-->

# Portfolio Constitution

## Core Principles

### I. Feature-First Architecture

Every capability MUST live under `lib/src/features/<feature>/` with clear boundaries:
`domain/`, `data/`, and `presentation/`. Shared UI and utilities belong in
`lib/src/common_widgets/` or `lib/src/constants/` only when used by two or more
features. New work MUST NOT introduce cross-feature imports that bypass the
public surface of a feature.

**Rationale**: The codebase already follows Riverpod feature-first structure;
enforcing boundaries keeps the portfolio maintainable as features grow.

### II. Riverpod State Management

Application state MUST be managed with Riverpod (`flutter_riverpod`,
`riverpod_annotation`, code generation). Providers belong next to the feature
they serve. Widgets MUST consume state through `ref.watch` / `ref.read`; global
mutable singletons outside Riverpod are prohibited unless justified in the
feature spec.

**Rationale**: Consistent state management reduces bugs and aligns with the
documented architecture referenced in the project README.

### III. Responsive & Accessible UI

Layouts MUST adapt across mobile, tablet, and desktop breakpoints using the
existing `Responsive` utilities and feature-specific `*_mobile`, `*_tablet`, and
`*_desktop` presentation variants where needed. Interactive elements MUST meet
reasonable contrast and tap-target expectations; semantic labels MUST be provided
for icons and controls that lack visible text.

**Rationale**: The portfolio is a public-facing showcase; responsive polish and
basic accessibility reflect professional quality.

### IV. Localization & Theming First

User-visible strings MUST NOT be hard-coded in widgets. Copy belongs in Flutter
localization resources and is accessed through the project's localization
providers. Theme values MUST flow from `lib/src/constants/theme.dart` and
`flex_color_scheme`; ad-hoc colors and typography in feature widgets are
prohibited unless added to the shared theme.

**Rationale**: Multi-language and multi-theme support are first-class product
requirements, not optional enhancements.

### V. Verified Quality Gates

All changes MUST pass CI checks before merge: `dart format`, `flutter analyze`,
and `flutter test`. Widget and integration tests SHOULD use `flutter_test` and
`patrol` for critical user flows, especially responsive layout variants. Generated
files (`*.g.dart`) MUST be committed when provider or repository annotations
change.

**Rationale**: Automated gates protect deploy quality; Patrol-backed tests
already validate rendering across breakpoints.

## Technical Constraints

- **Runtime**: Flutter 3.47.x stable, Dart SDK `^3.13.0` (see `pubspec.yaml`).
- **Hosting**: Firebase Hosting for web deployments; Firebase configuration MUST
  remain environment-safe (no secrets in source; use CI secrets).
- **Dependencies**: Prefer well-maintained pub packages; new dependencies MUST
  be justified in the feature plan and kept minimal (YAGNI).
- **Code style**: Follow `analysis_options.yaml` (package imports, 80-char lines,
  trailing commas, `prefer_single_quotes`). `flutter_lints` and `riverpod_lint`
  violations MUST be resolved or explicitly suppressed with rationale.
- **Assets**: Images and fonts live under `assets/`; web SEO metadata uses the
  `seo` package where applicable.

## Development Workflow

1. **Specify before implement**: Non-trivial work starts with a Spec Kit feature
   spec and plan; constitution compliance is checked during `/speckit-analyze`.
2. **Branch & PR**: Work happens on feature branches; PRs MUST pass the
   `all-pr-checks` workflow (format, analyze, test).
3. **Codegen**: After changing `@riverpod` or similar annotations, run
   `dart run build_runner build` and include generated outputs in the PR.
4. **Review focus**: Reviewers verify feature boundaries, provider placement,
   localization/theming usage, responsive behavior, and test coverage for
   changed flows.
5. **Deploy**: Merges to the deployment branch trigger Firebase Hosting via
   existing GitHub Actions workflows.

## Governance

This constitution supersedes ad-hoc conventions when they conflict. Amendments
require:

1. A documented rationale and version bump per semantic versioning (MAJOR for
   breaking governance changes, MINOR for new principles/sections, PATCH for
   clarifications).
2. Update to `.specify/memory/constitution.md` with a Sync Impact Report comment.
3. Propagation check: feature specs, plans, and tasks MUST remain consistent
   with amended principles before implementation proceeds.

All PRs and Spec Kit artifacts MUST verify compliance with Core Principles.
Complexity beyond these rules MUST be justified in the feature plan. Runtime
development guidance lives in feature specs and plans produced by Spec Kit
commands.

**Version**: 1.0.1 | **Ratified**: 2026-08-28 | **Last Amended**: 2026-08-31

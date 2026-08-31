---
description: "Task list for Flutter 3.47 upgrade implementation"
---

# Tasks: Flutter 3.47 Upgrade

**Input**: Design documents from `/specs/001-flutter-347-upgrade/`

**Prerequisites**: plan.md, spec.md, research.md, data-model.md, contracts/, quickstart.md

**Tests**: Spec FR-006 requires the **existing** suite to keep running (update in place; do not delete tests). No new test files or TDD-first tasks unless APIs in `test/src/app_test.dart` break.

**Organization**: Tasks are grouped by user story so each story can be implemented, tested, and delivered independently.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies on incomplete tasks)
- **[Story]**: User story label (`US1`, `US2`, `US3`) — required on user-story phases only
- Include exact file paths in descriptions

## Path Conventions

Existing single Flutter app at repository root (`lib/`, `test/`, `.github/workflows/`). Do not add packages, apps, or feature modules.

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Confirm the target toolchain before editing the existing app

- [x] T001 Confirm the active SDK is Flutter 3.47.2 (Dart 3.13.2) per `specs/001-flutter-347-upgrade/contracts/toolchain.md` (`flutter --version`); install or switch the SDK if it is not

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Resolvable 3.47 dependency graph and l10n tool config. No user story can compile until this phase is done.

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [x] T002 Set `environment.sdk` to `^3.13.0` in `pubspec.yaml` (reject Dart 4; match bundled Dart 3.13.2)
- [x] T003 Apply `specs/001-flutter-347-upgrade/contracts/dependency-inventory.md` to `pubspec.yaml`: bump every remaining package to the planned latest 3.47-compatible constraint (re-check pub.dev at upgrade time); add SDK `flutter_web_plugins` and `auto_size_text_plus` ^3.0.2; remove `url_strategy`, `auto_size_text`, and `envied`; move `build_runner`, `flutter_launcher_icons`, and `flutter_native_splash` into `dev_dependencies`; keep `sort_pub_dependencies` order
- [x] T004 Set `synthetic-package: false` in `l10n.yaml` (keep `arb-dir: lib/src/localization`, `output-localization-file: app_localizations.dart`, and `generate: true` in `pubspec.yaml`)
- [x] T005 Run `flutter pub upgrade --major-versions` then `flutter pub get` and commit the resolved `pubspec.lock` with no solver/SDK conflicts

**Checkpoint**: Foundation ready — `flutter pub get` succeeds on 3.47.2; user story implementation can begin

---

## Phase 3: User Story 1 - Build and run on Flutter 3.47 (Priority: P1) 🎯 MVP

**Goal**: A maintainer on Flutter 3.47.2 can generate sources, analyze, test, and launch the local site without toolchain or compile conflicts.

**Independent Test**: On Flutter 3.47.2, run `flutter pub get`, `dart run build_runner build --delete-conflicting-outputs`, `flutter gen-l10n`, `flutter analyze`, `flutter test`, and `flutter run -d chrome`. Success is a clean analysis result, passing existing tests, and a usable local home with primary navigation (spec US1).

### Implementation for User Story 1

- [x] T006 [P] [US1] Replace `package:flutter_gen/gen_l10n/app_localizations.dart` with `package:portfolio/src/localization/app_localizations.dart` in `lib/src/app.dart`, `lib/src/localization/localized_build_context.dart`, `lib/src/localization/app_localizations_provider.dart`, and `lib/src/localization/localization_provider.dart`
- [x] T007 [P] [US1] Replace `package:flutter_gen/gen_l10n/app_localizations.dart` with `package:portfolio/src/localization/app_localizations.dart` in `lib/src/features/introduction/data/resume_repository.dart`, `lib/src/features/experience/data/experience_repository.dart`, `lib/src/features/project/data/project_repository.dart`, and `lib/src/features/main/presentation/widgets/locale_button.dart`
- [x] T008 [US1] Run `flutter gen-l10n` and commit generated `lib/src/localization/app_localizations.dart` plus locale-specific generated files under `lib/src/localization/` (not `package:flutter_gen`)
- [x] T009 [US1] In `lib/main.dart`, remove `package:url_strategy/url_strategy.dart`, call `usePathUrlStrategy()` from `package:flutter_web_plugins/url_strategy.dart`, and keep `Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)` compiling against `firebase_core` ^4.14.0
- [x] T010 [P] [US1] Switch `lib/src/common_widgets/app_text.dart` from `package:auto_size_text/auto_size_text.dart` to `package:auto_size_text_plus/auto_size_text_plus.dart`, keeping existing `AutoSizeText` usage
- [x] T011 [US1] Migrate Riverpod 2 → 3 / `riverpod_annotation` 4: run `dart run custom_lint` / `dart fix` using `riverpod_lint`, replace generated `*Ref` parameter types with `Ref` in `lib/src/features/introduction/data/contact_repository.dart`, `lib/src/features/introduction/data/resume_repository.dart`, `lib/src/features/experience/data/experience_repository.dart`, `lib/src/features/project/data/project_repository.dart`, `lib/src/localization/localization_provider.dart`, `lib/src/localization/app_localizations_provider.dart`, `lib/src/features/main/presentation/provider/section_key_provider.dart`, and `lib/src/features/main/presentation/provider/dark_mode_controller.dart`; keep `@riverpod` next to each feature; do not introduce global singletons
- [x] T012 [US1] Run `dart run build_runner build --delete-conflicting-outputs` and commit regenerated `lib/src/features/introduction/data/contact_repository.g.dart`, `lib/src/features/introduction/data/resume_repository.g.dart`, `lib/src/features/experience/data/experience_repository.g.dart`, `lib/src/features/project/data/project_repository.g.dart`, `lib/src/localization/localization_provider.g.dart`, `lib/src/localization/app_localizations_provider.g.dart`, `lib/src/features/main/presentation/provider/section_key_provider.g.dart`, and `lib/src/features/main/presentation/provider/dark_mode_controller.g.dart`
- [x] T013 [US1] Change `Contact.icon` from `IconData` to `FaIconData` in `lib/src/features/introduction/domain/contact.dart` (Font Awesome 11)
- [x] T014 [P] [US1] Render contacts with `FaIcon` and compare `FaIconData` in `lib/src/features/introduction/presentation/widgets/contact_bar.dart` (replace `Icon(contact.icon)` and `_fixGithubIconPadding`)
- [x] T015 [P] [US1] Replace `Icon(FontAwesomeIcons…)` with `FaIcon(...)` in `lib/src/features/introduction/presentation/widgets/magic_icon.dart`
- [x] T016 [P] [US1] Replace `Icon(FontAwesomeIcons.filePdf)` with `FaIcon(...)` in `lib/src/features/introduction/presentation/widgets/resume_button.dart`
- [x] T017 [P] [US1] Replace `Icon(FontAwesomeIcons.github)` with `FaIcon(...)` in `lib/src/features/project/presentation/widgets/project_image.dart`
- [x] T018 [P] [US1] Replace `Icon(FontAwesomeIcons.terminal)` with `FaIcon(...)` in `lib/src/features/main/presentation/widgets/app_bar.dart`
- [x] T019 [P] [US1] Keep `Html(data:, style:)` compiling on `flutter_html` ^3.0.0 in `lib/src/common_widgets/app_text.dart` and `lib/src/features/experience/presentation/widgets/experience_card.dart`; keep `Seo` usage compiling on `seo` ^0.0.10 in `lib/src/common_widgets/app_text.dart` and `lib/src/app.dart`
- [x] T020 [US1] Make `lib/src/constants/theme.dart` compile against `flex_color_scheme` ^8.4.0 (update removed/renamed FCS APIs only; do not move colors into feature widgets)
- [x] T021 [US1] Resolve `flutter_lints` 6 findings in application code and drop only lint names that `package:flutter_lints/flutter.yaml` no longer provides from `analysis_options.yaml`; do not disable remaining rules to hide upgrade noise
- [x] T022 [US1] Update the existing Patrol widget test in `test/src/app_test.dart` for Patrol ^4.9.0 (keep it under `test/`; update finders/APIs in place; do not delete the test)
- [x] T023 [US1] Run `flutter analyze` and `flutter test` until both pass on Flutter 3.47.2 with no dropped tests
- [x] T024 [US1] Run `flutter run -d chrome` and confirm the home experience loads and primary navigation works (spec US1 acceptance scenario 4)

**Checkpoint**: User Story 1 is independently testable — clean analyze, passing tests, local site launches on 3.47.2

---

## Phase 4: User Story 2 - Keep third-party libraries current (Priority: P1)

**Goal**: Every declared third-party library is on the latest Flutter 3.47-compatible published version; breaking-change fallout preserves visitor-facing behavior; FR-014 exceptions are recorded.

**Independent Test**: Diff `pubspec.yaml` / `pubspec.lock` against `specs/001-flutter-347-upgrade/contracts/dependency-inventory.md`. Success is every remaining package at that latest compatible version (or a documented FR-014 exception) while analyze/tests still pass.

### Implementation for User Story 2

- [x] T025 [US2] Re-check pub.dev against `specs/001-flutter-347-upgrade/contracts/dependency-inventory.md` and bump any newer compatible patch in `pubspec.yaml`, then refresh `pubspec.lock` with `flutter pub get`
- [x] T026 [US2] Restore light/dark visual parity after FlexColorScheme 8 in `lib/src/constants/theme.dart` (keep tokens there; `interactionEffects` / `tintedDisabledControls` already false; do not add ad-hoc colors in feature widgets)
- [x] T027 [US2] Confirm Nunito still comes from `GoogleFonts.nunito()` in `lib/src/constants/theme.dart` and existing `assets/fonts/nunito/` entries in `pubspec.yaml` after `google_fonts` ^8.2.1
- [x] T028 [US2] Confirm `url_launcher` ^6.3.2 still opens the same targets from `lib/src/features/introduction/presentation/widgets/contact_bar.dart`, `lib/src/features/introduction/presentation/widgets/resume_button.dart`, `lib/src/features/introduction/presentation/widgets/resume_language_dialog_tile.dart`, `lib/src/features/project/presentation/widgets/project_card.dart`, and `lib/src/common_widgets/link.dart`
- [x] T029 [US2] Verify `animated_glitch` 2.0.0+2 still compiles in `lib/src/features/introduction/presentation/widgets/profile_image.dart`; if it fails, replace or isolate only as required and record the FR-014 exception in `specs/001-flutter-347-upgrade/contracts/dependency-inventory.md`
- [x] T030 [US2] Align the `intl` constraint in `pubspec.yaml` with the `flutter_localizations` SDK pin (prefer SDK-aligned; use ^0.20.3 only if it does not conflict)
- [x] T031 [US2] Confirm `pubspec.yaml` contains no `envied`, `url_strategy`, or `auto_size_text`; update `specs/001-flutter-347-upgrade/contracts/dependency-inventory.md` if any FR-014 exception or newer patch was taken

**Checkpoint**: User Stories 1 and 2 both hold — graph is latest-compatible and visitor-facing library behavior is preserved

---

## Phase 5: User Story 3 - Automated checks and published site stay healthy (Priority: P2)

**Goal**: Merge checks and production web builds run on Flutter 3.47.2; primary visitor journeys still work; runtime docs match the new toolchain.

**Independent Test**: Trigger format/analyze/test (and codegen) plus `flutter build web` on 3.47.2, then walk VJ-1–VJ-7 in `specs/001-flutter-347-upgrade/contracts/visitor-journeys.md` at mobile, tablet, and desktop widths.

### Implementation for User Story 3

- [x] T032 [US3] Pin `subosito/flutter-action@v2` to `flutter-version: "3.47.2"` and `channel: stable` in `.github/workflows/all-pr-checks.yml`, and enable `dart run build_runner build --delete-conflicting-outputs` (replace the commented `flutter pub run build_runner build` step) so stale `*.g.dart` cannot merge
- [x] T033 [P] [US3] Pin `flutter-version: "3.47.2"` and `channel: stable` on `subosito/flutter-action@v2` in `.github/workflows/firebase-hosting-merge.yml`
- [x] T034 [P] [US3] Pin `flutter-version: "3.47.2"` and `channel: stable` on `subosito/flutter-action@v2` in `.github/workflows/firebase-hosting-pull-request.yml`
- [x] T035 [US3] Run `flutter build web` on Flutter 3.47.2 until it succeeds with no dependency or toolchain errors
- [x] T036 [US3] Walk visitor journeys VJ-1–VJ-7 in `specs/001-flutter-347-upgrade/contracts/visitor-journeys.md` on the local/web build at existing `Responsive` breakpoints (mobile, tablet, desktop): home, section nav, projects, theme switch, language switch, outbound links; URLs must have no hash prefix; no new hard-coded copy; theme still from `lib/src/constants/theme.dart`
- [x] T037 [P] [US3] PATCH `.specify/memory/constitution.md` Technical Constraints to Flutter 3.47.x and Dart `^3.13.0`, drop the unused `envied` hosting mention, bump version 1.0.0 → 1.0.1, and fill the Sync Impact Report comment
- [x] T038 [P] [US3] Update README toolchain badges in `README.md` from Flutter 3.10 / Dart 3.0 to Flutter 3.47 / Dart 3.13 (no leftover 3.10 statements)

**Checkpoint**: All three user stories are independently verifiable — CI pin, web build, journeys, and docs match 3.47.2

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Quality-gate hygiene and quickstart proof across stories

- [x] T039 Run `dart format --line-length=80 --set-exit-if-changed .` and fix any rewritten files
- [x] T040 Confirm generated l10n under `lib/src/localization/` and all `*.g.dart` provider files are committed (constitution V)
- [x] T041 Execute `specs/001-flutter-347-upgrade/quickstart.md` end-to-end (resolve/generate, quality gates, inventory check, docs/CI check) and fix any remaining gap

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies — start immediately
- **Foundational (Phase 2)**: Depends on Setup — **BLOCKS** all user stories
- **User Story 1 (Phase 3)**: Depends on Foundational; includes compile-blocking API migrations (l10n, URL strategy, Riverpod 3, Font Awesome 11, FCS 8 compile, Patrol 4)
- **User Story 2 (Phase 4)**: Depends on Foundational; in practice run after US1 compiles so inventory/visual checks are against a green analyze/test
- **User Story 3 (Phase 5)**: Depends on Foundational; CI/docs can start once `pubspec.yaml` pins exist, but visitor-journey verification needs US1 (and US2 visual restores)
- **Polish (Phase 6)**: Depends on the user stories you intend to ship

### User Story Dependencies

- **User Story 1 (P1)**: After Phase 2. No dependency on US2/US3. MVP.
- **User Story 2 (P1)**: After Phase 2. Independently checks the inventory; visual/API polish assumes US1 compile migrations for those packages already landed (same upgrade PR for a solo maintainer).
- **User Story 3 (P2)**: After Phase 2. Journey walkthrough needs a runnable US1 build; CI workflow files do not depend on US2 visually.

### Within Each User Story

- Localization import rewrites (T006–T007) before `flutter gen-l10n` (T008)
- `Contact.icon` type change (T013) before `FaIcon` call sites (T014–T018)
- Riverpod source migration (T011) before codegen (T012)
- Analyze/test (T023) after compile-blocking migrations (T006–T022)
- Inventory re-check (T025) before recording exceptions (T031)

### Parallel Opportunities

- T006 and T007 (l10n import rewrites in different files)
- T010 (`app_text.dart`) in parallel with T006–T007
- T014–T018 (Font Awesome widgets in different files) after T013
- T019 (`Html`/`Seo`) in parallel with FA widget tasks
- T033 and T034 (hosting workflows)
- T037 and T038 (constitution vs README)

---

## Parallel Example: User Story 1

```bash
# After T005 (pub get) and in parallel:
Task: "Rewrite flutter_gen imports in lib/src/app.dart and lib/src/localization/*.dart"
Task: "Rewrite flutter_gen imports in resume/experience/project repositories and locale_button.dart"
Task: "Switch auto_size_text_plus in lib/src/common_widgets/app_text.dart"

# After T013 (Contact.icon → FaIconData), launch FA widgets together:
Task: "FaIcon in lib/src/features/introduction/presentation/widgets/contact_bar.dart"
Task: "FaIcon in lib/src/features/introduction/presentation/widgets/magic_icon.dart"
Task: "FaIcon in lib/src/features/introduction/presentation/widgets/resume_button.dart"
Task: "FaIcon in lib/src/features/project/presentation/widgets/project_image.dart"
Task: "FaIcon in lib/src/features/main/presentation/widgets/app_bar.dart"
```

---

## Parallel Example: User Story 3

```bash
# After T032 pattern is known, pin hosting workflows together:
Task: "Pin Flutter 3.47.2 in .github/workflows/firebase-hosting-merge.yml"
Task: "Pin Flutter 3.47.2 in .github/workflows/firebase-hosting-pull-request.yml"

# Docs in parallel:
Task: "PATCH .specify/memory/constitution.md runtime constraints"
Task: "Update Flutter/Dart badges in README.md"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup (SDK 3.47.2)
2. Complete Phase 2: Foundational (pubspec + l10n.yaml + lockfile)
3. Complete Phase 3: User Story 1 (compile, analyze, test, local run)
4. **STOP and VALIDATE**: US1 independent test
5. Demo the local 3.47 site if needed

### Incremental Delivery

1. Setup + Foundational → resolvable 3.47 graph
2. Add User Story 1 → analyze/test/run on 3.47 → **MVP**
3. Add User Story 2 → latest-library inventory + visual parity → demo
4. Add User Story 3 → CI pin, `flutter build web`, visitor journeys, docs → ship
5. Polish → format + quickstart.md

US1 and US2 are both P1; a single maintainer should land them in one upgrade PR. US3 is required before merge so CI cannot stay on 3.10.2.

### Parallel Team Strategy

With multiple developers, after Phase 2:

- Developer A: US1 compile path (l10n, Riverpod, `main.dart`, tests)
- Developer B: US1 Font Awesome / HTML / theme compile (coordinate `theme.dart` and `contact.dart`)
- Developer C: US3 workflow pins and README/constitution (can start as soon as version numbers are known)

Avoid two people editing `pubspec.yaml`, `lib/main.dart`, or `lib/src/constants/theme.dart` at once.

---

## Notes

- [P] tasks = different files, no dependencies on incomplete work
- [Story] label maps the task to spec.md user stories (US1/US2/US3)
- Do not add visitor features, cross-feature imports, or Dart 4
- Do not delete tests to hide upgrade breakage (FR-006)
- Do not silence analyzer rules wholesale (FR-005)
- Commit after each task or logical group (codegen + lockfile together)
- Stop at any checkpoint to validate the story independently

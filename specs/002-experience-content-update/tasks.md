---
description: "Task list for experience content update implementation"
---

# Tasks: Experience Content Update

**Input**: Design documents from `/specs/002-experience-content-update/`

**Prerequisites**: plan.md, spec.md, research.md, data-model.md, contracts/, quickstart.md

**Tests**: Spec SC-006 and `contracts/quality-gates.md` require new coverage (ITTI first, `<strong>` markup, Spanish `Actual`). Not TDD-first; add tests after each story’s implementation. Keep `test/src/app_test.dart` width variants.

**Organization**: Tasks are grouped by user story so each story can be implemented, tested, and delivered independently.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies on incomplete tasks)
- **[Story]**: User story label (`US1`–`US4`) — required on user-story phases only
- Include exact file paths in descriptions

## Path Conventions

Existing single Flutter app at repository root (`lib/`, `test/`). Do not add packages, apps, or a new feature module.

Copy source: `specs/002-experience-content-update/contracts/content-catalog.md`  
Chips / `companyContext`: `specs/002-experience-content-update/data-model.md`  
Orange token: `specs/002-experience-content-update/contracts/highlight-styling.md`

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Feature branch for constitution workflow (work is not on `main`)

- [x] T001 Create and check out git branch `002-experience-content-update` from current `main` so implementation is not committed on `main`

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Domain field and theme token every story’s UI will use. No story should hard-code orange or overload `company`.

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [x] T002 [P] Add `HighlightColors` `ThemeExtension` with `emphasis` (`Color(0xFFC2410C)` light, `Color(0xFFFF8000)` dark) and register it on `lightTheme` and `dartTheme` in `lib/src/constants/theme.dart` per `specs/002-experience-content-update/contracts/highlight-styling.md`
- [x] T003 [P] Add optional `companyContext` (`String?`) to `Experience` in `lib/src/features/experience/domain/experience.dart` per `specs/002-experience-content-update/data-model.md`

**Checkpoint**: Foundation ready — theme exposes highlight token; domain accepts `companyContext`; user stories can start

---

## Phase 3: User Story 1 - View current role at ueno bank (Priority: P1) 🎯 MVP

**Goal**: Experience section lists ITTI S.A.E.C.A. / ueno bank, Mobile Expert, Sep. 2023 – Present first, with impact-driven bullets and ATS chips.

**Independent Test**: Open Experience in English. First card is ITTI / ueno bank / Mobile Expert / Sep. 2023 – Present, ≥8 catalog bullets, ATS chips including Flutter, Codemagic, GitHub Actions, Sonar, Checkmarx, Fastify, New Relic, Instabug (VJ-1).

### Implementation for User Story 1

- [x] T004 [US1] Add `ittiDevJobTitle` and `ittiDevJobDescription` to `lib/src/localization/app_en.arb` using the ITTI English HTML from `specs/002-experience-content-update/contracts/content-catalog.md` (`<strong>` highlights, `&amp;` escapes)
- [x] T005 [US1] Run `flutter gen-l10n` and commit generated `lib/src/localization/app_localizations.dart`, `lib/src/localization/app_localizations_en.dart`, and `lib/src/localization/app_localizations_es.dart` (do not hand-edit generated Dart)
- [x] T006 [US1] Insert the ITTI `Experience` at index 0 in `lib/src/features/experience/data/experience_repository.dart`: company `ITTI S.A.E.C.A.`, `companyContext` `ueno bank`, startDate `Sep. 2023`, endDate `_appLocalizations.resumePresent`, job/description from new l10n getters, technologies list exactly as `specs/002-experience-content-update/data-model.md`
- [x] T007 [US1] Show ` | {companyContext}` after `company` when non-null (italic, same color as company) in both mobile and non-mobile company rows in `lib/src/features/experience/presentation/widgets/experience_card.dart`

### Tests for User Story 1

- [x] T008 [US1] Add `test/src/features/experience/experience_repository_test.dart` that loads English `AppLocalizations`, calls `ExperienceRepository.fetchExperiences()`, and asserts length 5, first company `ITTI S.A.E.C.A.`, first `companyContext` `ueno bank`, first job `Mobile Expert`, first `endDate` `Present`

**Checkpoint**: User Story 1 is independently testable — current role is first with catalog copy and chips (highlights may still be default HTML bold until US2)

---

## Phase 4: User Story 2 - Scan highlighted impact terms (Priority: P1)

**Goal**: `<strong>` terms in experience HTML render bold orange from `HighlightColors`, readable in light and dark, wrapping on all breakpoints.

**Independent Test**: On any card with `<strong>` (ITTI after US1), marked terms are bold orange; unmarked text is default body; toggle theme; resize mobile/tablet/desktop (VJ-2, VJ-5).

### Implementation for User Story 2

- [x] T009 [US2] In `lib/src/features/experience/presentation/widgets/experience_card.dart`, pass `Html(style:)` per `specs/002-experience-content-update/contracts/highlight-styling.md`: zero `body` margin/padding; compact `ul`/`li`; `strong` and `b` use `FontWeight.bold` and `Theme.of(context).extension<HighlightColors>()!.emphasis` — no raw orange hex in this file

### Tests for User Story 2

- [x] T010 [US2] Extend `test/src/features/experience/experience_repository_test.dart` so every `<li>` in the ITTI English description contains at least one `<strong>` (quality-gates highlight markup)

**Checkpoint**: User Stories 1 and 2 hold — ITTI copy plus orange highlights from the theme token

---

## Phase 5: User Story 3 - Consistent impact-driven format across all roles (Priority: P2)

**Goal**: Pairtree, Tandamos, Valtech, and Freelance use the same impact-driven HTML format and highlight markup; dates/titles/companies stay historically accurate; chips match rewritten tools.

**Independent Test**: All five cards use category-led bullets with `<strong>` terms; Pairtree Jun. 2022 – May. 2023, Tandamos Feb. 2022 – May. 2023, Valtech Sep. 2021 – Feb. 2022, Freelance Apr. 2011 – Aug. 2021 unchanged (VJ-3).

### Implementation for User Story 3

- [x] T011 [P] [US3] Replace `pairtreeDevJobDescription`, `tandamosDevJobDescription`, `valtechDevJobDescription`, and `freelanceDevJobDescription` in `lib/src/localization/app_en.arb` with the English HTML in `specs/002-experience-content-update/contracts/content-catalog.md` (keep existing title keys)
- [x] T012 [P] [US3] Replace the same four description keys in `lib/src/localization/app_es.arb` with the Spanish HTML in `specs/002-experience-content-update/contracts/content-catalog.md` (keep existing Spanish titles)
- [x] T013 [US3] Update technology lists in `lib/src/features/experience/data/experience_repository.dart`: add Sentry and Alembic to Pairtree; add Firebase to Tandamos; add Firebase and Sentry to Freelance if missing; do not change historical dates, titles, or companies
- [x] T014 [US3] Run `flutter gen-l10n` and commit regenerated files under `lib/src/localization/`

### Tests for User Story 3

- [x] T015 [US3] Extend `test/src/features/experience/experience_repository_test.dart` so Pairtree, Tandamos, Valtech, and Freelance English descriptions each contain `<strong>` category prefixes and their `startDate`/`endDate`/`company` match pre-feature metadata

**Checkpoint**: All five English (and four historical Spanish) roles share impact-driven format; US1 metadata intact

---

## Phase 6: User Story 4 - Bilingual experience content (Priority: P2)

**Goal**: Spanish locale shows all five roles including ITTI, with `Actual` for the current end date and the same highlight markup.

**Independent Test**: Switch language to Spanish; Experto Mobile, Spanish ITTI bullets, `Actual`, and the other four Spanish titles/descriptions (VJ-4).

### Implementation for User Story 4

- [x] T016 [US4] Add `ittiDevJobTitle` (`Experto Mobile`) and `ittiDevJobDescription` (Spanish HTML from `specs/002-experience-content-update/contracts/content-catalog.md`) to `lib/src/localization/app_es.arb`
- [x] T017 [US4] Run `flutter gen-l10n` and commit regenerated `lib/src/localization/app_localizations_es.dart` (and siblings if changed)

### Tests for User Story 4

- [x] T018 [US4] Extend `test/src/features/experience/experience_repository_test.dart` with a Spanish `AppLocalizations` case: first job `Experto Mobile`, first `endDate` `Actual`, ITTI Spanish description contains `<strong>`

**Checkpoint**: EN and ES experience copy is complete and tested

---

## Phase 7: Polish & Cross-Cutting Concerns

**Purpose**: Quality gates, responsive wrap, no constitution leaks

- [x] T019 Run `dart format --line-length=80` on `lib/src/constants/theme.dart`, `lib/src/features/experience/domain/experience.dart`, `lib/src/features/experience/data/experience_repository.dart`, `lib/src/features/experience/presentation/widgets/experience_card.dart`, and `test/src/features/experience/experience_repository_test.dart`
- [x] T020 Run `flutter analyze` and `flutter test` until both pass, keeping `test/src/app_test.dart` width variants (SC-006, `specs/002-experience-content-update/contracts/quality-gates.md`)
- [x] T021 Walk VJ-1–VJ-6 in `specs/002-experience-content-update/quickstart.md` via `flutter run -d chrome`: ITTI first, orange highlights light/dark, rewritten roles, Spanish `Actual`, chip wrap and no overflow at `Responsive` breakpoints in `lib/src/common_widgets/responsive.dart`
- [x] T022 Confirm `lib/src/features/experience/presentation/widgets/experience_card.dart` has no raw highlight hex and `pubspec.yaml` has no new dependencies

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies — start immediately
- **Foundational (Phase 2)**: Depends on Setup — BLOCKS all user stories
- **User Story 1 (Phase 3)**: Depends on Foundational — MVP
- **User Story 2 (Phase 4)**: Depends on Foundational; needs US1 ITTI HTML and `ExperienceCard` (same file as T007) — run after US1
- **User Story 3 (Phase 5)**: Depends on Foundational; T013 edits `experience_repository.dart` after T006; T012 edits `app_es.arb` before US4 T016 — run after US1, before or after US2
- **User Story 4 (Phase 6)**: Depends on T012 (`app_es.arb`); add ITTI Spanish after historical ES rewrites
- **Polish (Phase 7)**: Depends on all desired stories

### User Story Dependencies

- **User Story 1 (P1)**: After Phase 2 only — MVP
- **User Story 2 (P1)**: After US1 (shared `experience_card.dart`; needs ITTI `<strong>` copy)
- **User Story 3 (P2)**: After US1 (shared repository); T011/T012 can proceed once T004 exists
- **User Story 4 (P2)**: After US3 T012 so `app_es.arb` is not edited in parallel

### Within Each User Story

- ARB before `flutter gen-l10n`
- l10n getters before repository wiring
- Domain/theme before card UI
- Implementation before that story’s tests
- Story complete before the next story that shares the same files

### Parallel Opportunities

- T002 and T003 (theme vs domain)
- T011 and T012 (EN vs ES historical ARB)
- After Foundational, US2 styling cannot parallel US1 card work (same file)
- US3 English ARB (T011) can overlap late US1 once T004 is done, if T005 gen-l10n is sequenced

---

## Parallel Example: Foundational

```bash
Task: "Add HighlightColors ThemeExtension in lib/src/constants/theme.dart"
Task: "Add companyContext to lib/src/features/experience/domain/experience.dart"
```

## Parallel Example: User Story 3

```bash
Task: "Rewrite four descriptions in lib/src/localization/app_en.arb"
Task: "Rewrite four descriptions in lib/src/localization/app_es.arb"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup (feature branch)
2. Complete Phase 2: Foundational (theme + `companyContext`)
3. Complete Phase 3: User Story 1
4. **STOP and VALIDATE**: First card is ITTI / Mobile Expert / Present
5. Demo if ready

### Incremental Delivery

1. Setup + Foundational → tokens and domain ready
2. US1 → current role visible (MVP)
3. US2 → bold orange highlights
4. US3 → historical roles match ITTI format
5. US4 → full Spanish
6. Polish → format, analyze, test, quickstart walkthrough

### Parallel Team Strategy

With two people after Phase 2:

1. Developer A: US1 then US2 (`experience_card.dart`, repository, EN ITTI ARB)
2. Developer B: wait for T004, then T011; after A finishes T006, do T013; after T012, do US4

Prefer sequential A-then-B on this repo (few files).

---

## Notes

- [P] tasks = different files, no dependencies on incomplete tasks
- [Story] labels map to spec US1–US4
- Do not invent copy; use `contracts/content-catalog.md`
- Do not put orange hex in feature widgets
- Resume PDFs are out of scope
- Tandamos backend name is Nest.js (catalog), not Next.js

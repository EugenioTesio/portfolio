# Research: Experience Content Update

**Feature**: `002-experience-content-update`  
**Date**: 2026-09-01

## 1. Orange highlight color (theme token)

- **Decision**: Add a `HighlightColors` `ThemeExtension` on both `lightTheme` and `dartTheme` in `lib/src/constants/theme.dart`. Use **light** `Color(0xFFC2410C)` and **dark** `Color(0xFFFF8000)`. Experience cards read the token via `Theme.of(context).extension<HighlightColors>()`.
- **Rationale**: Constitution IV forbids ad-hoc colors in feature widgets. Dark theme already uses `#FF8000` as `secondaryContainer` (section titles); matching that keeps dark-mode accent consistent. Light `secondaryContainer` is navy (`#003B73`), so highlights cannot reuse it. `#C2410C` on light surfaces is darker than `#FF8000` to keep body-adjacent text closer to WCAG AA contrast.
- **Alternatives considered**:
  - Reuse `ColorScheme.secondaryContainer` — orange only in dark mode; navy in light mode (fails FR-003).
  - Inline `Color(0xFFFF8000)` in `ExperienceCard` — violates constitution IV.
  - New FlexColorScheme role (e.g. remap tertiary) — would restyle unrelated chips/hovers.

## 2. Markup for highlighted terms

- **Decision**: Keep descriptions as HTML lists (`<ul><li>`) in ARB files. Wrap every highlighted phrase in `<strong>…</strong>`. Style `strong` (and `b` as alias) in `ExperienceCard`’s `Html(style:)` map: `fontWeight: FontWeight.bold` and `color` from `HighlightColors.emphasis`. Zero `body`/`ul` margins so card padding does not double-space.
- **Rationale**: `flutter_html` 3.0.0 already renders descriptions and treats `strong` as a built-in bold tag. No new package. Owner source used Markdown `**bold**`; HTML `<strong>` is the equivalent the widget already understands. Category labels (e.g. `Architecture & Scalability:`) and inner metrics/tools are both wrapped.
- **Alternatives considered**:
  - Markdown in ARB + a Markdown widget — new dependency; constitution YAGNI.
  - CSS classes / custom `HtmlExtension` — extra complexity for a single style.
  - `AppText` HTML path — `ExperienceCard` already uses `Html` directly; keep one render path.

## 3. New ITTI / ueno bank entry

- **Decision**: Insert a fifth `Experience` at index 0 in `ExperienceRepository.fetchExperiences()`. Company `ITTI S.A.E.C.A.`; optional `companyContext` `ueno bank` shown as ` | ueno bank` after the company name (italic, same color as company). Job title from ARB (`Mobile Expert` / Spanish equivalent). Start date `Sep. 2023` (repository constant, same pattern as existing roles). End date `_appLocalizations.resumePresent` (`Present` / `Actual`). No URL. Technology chips = owner ATS list (see [data-model.md](./data-model.md)).
- **Rationale**: Spec FR-001/FR-009. Existing companies and month-year dates already live as repository constants; only titles/descriptions are ARB. Reusing `resumePresent` avoids a hard-coded English “Present”. `companyContext` matches the resume header `ITTI S.A.E.C.A. | ueno bank` without overloading `company`.
- **Alternatives considered**:
  - Single company string `ITTI S.A.E.C.A. | ueno bank` — cannot italicize the product name.
  - Localize all historical dates — out of scope; FR-006 preserves existing metadata.

## 4. Localization of copy

- **Decision**: Add ARB keys `ittiDevJobTitle` and `ittiDevJobDescription` in `app_en.arb` / `app_es.arb`. Replace Pairtree, Tandamos, Valtech, and Freelance description (and titles if needed) with impact-driven HTML. Run `flutter gen-l10n` and commit generated `app_localizations*.dart`. Technology chip labels stay English proper nouns in both locales (existing pattern).
- **Rationale**: Constitution IV. Canonical strings live in [contracts/content-catalog.md](./contracts/content-catalog.md) so implementation does not invent copy.
- **Alternatives considered**: Hard-code English HTML in the repository — violates FR-008 and constitution IV.

## 5. Impact-driven rewrite of existing roles

- **Decision**: Condense overlapping task bullets into fewer impact-driven bullets: `[Category]: [what] — [outcome]`. Preserve facts already in the ARB. Align Tandamos backend naming to **Nest.js** (technology chips), treating the current “Next.js” description as a copy error. Expand chips only when a rewritten bullet names a product not already listed (e.g. Pairtree **Sentry**, **Alembic**).
- **Rationale**: Spec FR-005/FR-006. Condensing Freelance (~20 tasks) into ~8 bullets keeps cards scannable on mobile (SC-005) while keeping domain facts (OCPP, stores, GCP, Firebase).
- **Alternatives considered**: One-to-one rewrite of every legacy bullet — longer cards, weaker scan. Inventing new metrics not in source — rejected (FR-006).

## 6. Domain model change

- **Decision**: Add optional `String? companyContext` to `Experience`. All other fields unchanged. Presentation: if non-null, render ` | {companyContext}` after `company`.
- **Rationale**: Only ITTI needs product branding beside the employer. No new entity type.
- **Alternatives considered**: New `ExperienceCompany` object — overkill for one optional label.

## 7. Dependencies and codegen

- **Decision**: No new pub packages. No Riverpod annotation changes expected (`experienceRepository` already exists). After ARB edits, `flutter gen-l10n` only. Do not run `build_runner` unless a provider signature actually changes.
- **Rationale**: Constitution YAGNI. Highlight styling is theme + `flutter_html` Style.
- **Alternatives considered**: `google_fonts` extra weight — Nunito already loaded.

## 8. Tests

- **Decision**: Keep existing Patrol width-variant smoke test. Add a widget test that pumps `MyApp` (or a scoped `ExperienceDesktop` with `ProviderScope`) and asserts: five experience cards; first title/company are ITTI / Mobile Expert; `Present`/`Actual` after locale switch; at least one `Html` widget. Assert descriptions contain `<strong>` via repository fetch in a unit-style test with a fake/real `AppLocalizations`.
- **Rationale**: Constitution V. Color pixel tests are brittle; markup + visible strings prove FR-001/FR-003/FR-008. Locale switch covers US-4.
- **Alternatives considered**: Golden tests of orange spans — high flake across themes. Skip tests — fails SC-006 spirit.

## 9. Git branch vs spec directory

- **Decision**: Spec identity is `002-experience-content-update`. Implementation work SHOULD use a feature branch of that name (constitution workflow). This `/speckit-plan` run does not create the git branch (no `before_specify` git hook).
- **Rationale**: `.specify/feature.json` already points at `specs/002-experience-content-update`. Checkout at plan time was `main`.
- **Alternatives considered**: Rename spec dir to match current git branch — unnecessary; directory is independent of branch (specify skill).

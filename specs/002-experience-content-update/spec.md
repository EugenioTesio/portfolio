# Feature Specification: Experience Content Update

**Feature Branch**: `002-experience-content-update`

**Created**: 2026-09-01

**Status**: Draft

**Input**: User description: "Add current ITTI S.A.E.C.A. / ueno bank Mobile Expert experience (Sep 2023 – Present), display key terms with bold orange highlights, and rewrite all existing experience entries using the Standard Impact-Driven Format."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - View current role at ueno bank (Priority: P1)

A recruiter or hiring manager opens the Experience section and immediately sees Eugenio's most recent role at **ITTI S.A.E.C.A.** (*ueno bank*) as **Mobile Expert** (promoted from Tech Lead), dated **Sep 2023 – Present**, with impact-driven bullet points covering architecture, release engineering, security, observability, and technical leadership.

**Why this priority**: The portfolio currently omits the candidate's latest and most senior role. Without it, visitors see an outdated career timeline that understates current expertise and seniority.

**Independent Test**: Open the Experience section in English. Confirm the first card shows ITTI/ueno bank, Mobile Expert, Sep 2023 – Present, and at least eight impact-driven bullets with highlighted key terms. Delivers immediate credibility for current fintech/mobile leadership.

**Acceptance Scenarios**:

1. **Given** a visitor on the portfolio site, **When** they scroll to the Experience section, **Then** the most recent entry is ITTI S.A.E.C.A. / ueno bank (Mobile Expert, Sep 2023 – Present) listed before all other roles.
2. **Given** the ueno bank experience card, **When** the visitor reads the description, **Then** they see impact-driven bullets covering architecture migration, ecosystem unification, AI-augmented engineering, release train/CD, CI/quality/security gates, fintech security, observability, BFF/cloud deployment, and technical leadership.
3. **Given** the ueno bank experience card, **When** the visitor views technology chips, **Then** they see the ATS-relevant stack (Flutter, Dart, BLoC, Riverpod, Codemagic, GitHub Actions, Sonar, Checkmarx, Node.js, Fastify, New Relic, Instabug, and related terms).

---

### User Story 2 - Scan highlighted impact terms (Priority: P1)

A visitor skimming experience descriptions quickly notices key technologies, metrics, and outcomes because important words appear **bold** and in a distinct **orange** accent color, making achievements scannable without reading every word.

**Why this priority**: The user explicitly requested bold orange highlights. Scannable highlights improve recruiter engagement and align with ATS keyword visibility goals.

**Independent Test**: Open any experience card. Verify that technologies, scale metrics (e.g., "50+ engineers", "300+ stakeholders"), architecture patterns, and tool names render bold and orange consistently across light and dark themes and all breakpoints.

**Acceptance Scenarios**:

1. **Given** any experience description containing highlighted terms, **When** rendered on screen, **Then** those terms appear bold and orange (or the theme's designated highlight accent) while surrounding text uses the default body style.
2. **Given** a visitor switches between light and dark theme, **When** they view experience descriptions, **Then** highlighted terms remain legible with sufficient contrast in both themes.
3. **Given** a visitor on mobile, tablet, or desktop, **When** they view experience cards, **Then** highlighted terms display correctly without layout overflow or broken formatting.

---

### User Story 3 - Consistent impact-driven format across all roles (Priority: P2)

A visitor reads every experience entry (ITTI/ueno bank, Pairtree, Tandamos, Valtech, Freelance) written in a consistent **Standard Impact-Driven Format**: each bullet leads with a category or action, states what was done, names relevant technologies, and quantifies impact where possible—replacing the current task-list style descriptions.

**Why this priority**: Uniform, outcome-focused copy strengthens the portfolio narrative and makes older roles comparable in quality to the new ueno bank entry.

**Independent Test**: Review all five experience cards. Each must use impact-driven bullets (not bare task lists), include highlighted key terms, and preserve accurate dates, titles, companies, and technology chips.

**Acceptance Scenarios**:

1. **Given** the four pre-existing experiences, **When** a visitor reads their descriptions, **Then** each bullet follows impact-driven structure (action + scope + outcome/metric) rather than simple "Developed X" task statements.
2. **Given** Pairtree, Tandamos, Valtech, and Freelance entries, **When** compared to the ueno bank entry, **Then** they share the same visual formatting conventions (bullet structure, highlight styling, technology chips).
3. **Given** the rewritten experiences, **When** a visitor checks dates and titles, **Then** historical accuracy is preserved (no changed employment periods or role titles unless explicitly updated by the owner).

---

### User Story 4 - Bilingual experience content (Priority: P2)

A Spanish-speaking visitor switches the site language and sees all experience content—including the new ueno bank role and rewritten entries—in professionally translated Spanish with the same impact-driven structure and highlighted terms.

**Why this priority**: The portfolio constitution requires localization-first copy. Experience is a primary section for both EN and ES audiences.

**Independent Test**: Switch language to Spanish. All experience titles, descriptions, and date labels (including "Present") render in Spanish with equivalent meaning and highlight styling.

**Acceptance Scenarios**:

1. **Given** the site language is Spanish, **When** the visitor opens Experience, **Then** all five roles display Spanish job titles and descriptions.
2. **Given** the ueno bank role end date is ongoing, **When** viewed in either language, **Then** the end date shows the localized "Present" equivalent.

---

### Edge Cases

- Very long bullet text on narrow mobile screens: text wraps cleanly; highlights do not break mid-word awkwardly.
- HTML special characters in company names (e.g., asterisks for emphasis in source copy): render correctly without breaking the HTML parser.
- Overlapping employment periods (Pairtree Jun 2022 – May 2023 overlaps Tandamos Feb 2022 – May 2023): chronological order still reflects most-recent-first; overlapping dates remain as historically accurate.
- Technology chip list exceeds one line: chips wrap within the card without clipping.
- Missing or empty highlight markup in a bullet: bullet still renders; only explicitly marked terms receive highlight styling.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: The Experience section MUST include a new entry for **ITTI S.A.E.C.A.** (*ueno bank*), **Mobile Expert** (promoted from Tech Lead), **Sep 2023 – Present**, positioned as the first (most recent) item.
- **FR-002**: The ueno bank description MUST include impact-driven bullets covering: micro-app/app shell architecture migration; Empresas/Individuos ecosystem unification; AI-augmented engineering workflows; 15-day release train with Codemagic CD; GitHub Actions CI with quality/security gates (tests, analyzer, Sonar, Checkmarx); RASP and mobile security hardening; Instabug/New Relic observability; Fastify BFF on NullPlatform; Spec-Driven Development adoption and promotion from Tech Lead to Mobile Expert.
- **FR-003**: Key terms within experience descriptions (technologies, metrics, architecture patterns, tools, and outcome phrases) MUST render **bold** and in a distinct **orange** highlight color across all experience entries.
- **FR-004**: Highlight styling MUST remain readable in both light and dark themes and MUST meet reasonable contrast expectations for body-adjacent accent text.
- **FR-005**: All four existing experiences (Pairtree, Tandamos, Valtech, Freelance) MUST be rewritten in the **Standard Impact-Driven Format**, defined as: `[Category/Action]: [What was done] — [measurable outcome or scale indicator]`, with key terms highlighted.
- **FR-006**: Employment metadata (company, job title, start date, end date) for existing roles MUST remain historically accurate unless the owner provides corrections.
- **FR-007**: Technology chips for each role MUST reflect the technologies named in that role's description and ATS keyword list; the ueno bank entry MUST include the full technology set provided by the owner.
- **FR-008**: All user-visible experience strings MUST be localized in English and Spanish; no hard-coded copy in presentation widgets.
- **FR-009**: The ongoing role end date MUST use the existing localized "Present" label rather than a hard-coded English string.
- **FR-010**: Experience content MUST render correctly on mobile, tablet, and desktop layouts without regression to card structure, spacing, or navigation.

### Key Entities

- **Experience Entry**: A single role record with start date, end date, job title, company name, HTML description (with highlight markup), optional URL, and technology chip list.
- **Highlighted Term**: A phrase within a description bullet marked for bold orange styling—typically a technology, metric, architecture pattern, or tool name.
- **Impact Bullet**: A description list item structured as action + scope + outcome, replacing legacy task-list phrasing.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: 100% of experience entries (5 total) display impact-driven bullet format—not legacy task-list phrasing—verified by content review checklist.
- **SC-002**: 100% of experience entries include at least one bold orange highlighted term per bullet, visible in both light and dark themes.
- **SC-003**: A visitor can identify the current role (ITTI/ueno bank, Mobile Expert, Present) within 5 seconds of opening the Experience section.
- **SC-004**: Switching between English and Spanish shows fully translated experience content for all five roles with no untranslated strings.
- **SC-005**: Experience section renders without layout breakage on mobile (≤600px), tablet (601–1024px), and desktop (≥1025px) viewports.
- **SC-006**: All automated quality gates (format, analyze, test) pass after content and styling changes.

## Assumptions

- **Impact-Driven Format**: Each bullet uses a leading category or strong action verb, names relevant technologies inline, and includes a scale or outcome indicator where the source material provides one (e.g., "50+ engineers", "100% code coverage", "15-day Release Train").
- **Highlight scope**: Terms marked with bold in the owner's source copy (technologies, metrics, product names, architecture patterns) become orange-highlighted terms; not every word in a bullet is highlighted.
- **Company display**: ITTI S.A.E.C.A. is the company name; *ueno bank* appears as contextual branding within the description or company display, consistent with the owner's resume formatting.
- **Spanish translations**: Professional-quality Spanish equivalents are authored for all new and rewritten content, preserving meaning and highlight markers.
- **Orange highlight color**: A dedicated accent color (orange) is added to the shared theme for highlight styling rather than inline widget colors, keeping constitution compliance for theming.
- **Chronological order**: Experiences remain sorted most-recent-first; ueno bank is inserted at the top of the repository list.
- **No resume PDF changes**: This feature updates the portfolio Experience section only; downloadable resume assets are out of scope unless separately requested.

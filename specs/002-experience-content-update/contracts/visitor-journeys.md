# Contract: Experience visitor journeys

Breakpoints: mobile `< 640px`, tablet `640–1023px`, desktop `≥ 1024px` (`Responsive`).

## VJ-1 — Current role first (P1)

**Given** the portfolio is open in English  
**When** the visitor opens the Experience section  
**Then** the first card shows:

- Title: `Mobile Expert`
- Company line: `ITTI S.A.E.C.A. | ueno bank`
- Dates: `Sep. 2023 – Present` (en dash or existing ` - ` separator)
- At least eight impact-driven bullets covering architecture, unification, AI, release train, CI/security, RASP, observability, BFF, leadership
- ATS-related technology chips including Flutter, Codemagic, GitHub Actions, Sonar, Checkmarx, Fastify, New Relic, Instabug

## VJ-2 — Highlight scan (P1)

**Given** any experience card  
**When** the visitor reads a bullet  
**Then** category labels and marked tools/metrics appear bold and orange  
**And** unmarked text uses the default body style  
**And** the same holds after toggling light/dark theme

## VJ-3 — Historical roles rewritten (P2)

**Given** the Experience section  
**When** the visitor reads Pairtree, Tandamos, Valtech, and Freelance  
**Then** each uses category-led impact bullets (not the old “Developed X.” task list)  
**And** dates, company names, and role titles match the pre-feature metadata  
**And** Pairtree remains Jun. 2022 – May. 2023, overlapping Tandamos dates unchanged

## VJ-4 — Spanish locale (P2)

**Given** the visitor switches language to Spanish  
**When** they view Experience  
**Then** ITTI title is the Spanish ARB value, description is Spanish HTML, end date is `Actual`  
**And** the other four roles show Spanish titles and rewritten descriptions  
**And** highlight styling still applies to `<strong>` terms

## VJ-5 — Responsive layout (P1/P2)

**Given** mobile, tablet, and desktop widths  
**When** the visitor views Experience  
**Then** cards do not overflow horizontally  
**And** on mobile, dates appear under the company (existing `ExperienceCard` behavior)  
**And** technology chips wrap to additional lines instead of clipping

## VJ-6 — Regression: rest of site

**Given** experience content changed  
**When** the visitor uses Home, About, Projects, theme, language, and outbound links  
**Then** those journeys still work (existing `test/src/app_test.dart` width smoke test remains green)

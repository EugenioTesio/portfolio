# Data Model: Experience Content Update

This feature extends the existing **Experience** record and adds a **theme-level highlight token**. No persistence layer; data is in-memory from `ExperienceRepository` plus ARB copy.

## Experience (existing, extended)

A single employment role shown as a card in the Experience section.

| Field | Type | Rules |
|-------|------|--------|
| startDate | string | Month-year display (existing pattern, e.g. `Sep. 2023`). Not translated except as already stored. |
| endDate | string | Month-year **or** localized `resumePresent` when the role is current. |
| job | string | Localized title from ARB. ITTI: Mobile Expert / Experto Mobile. |
| company | string | Employer proper noun. ITTI: `ITTI S.A.E.C.A.` |
| companyContext | string? | **New, optional.** Product/client brand. ITTI: `ueno bank`. Null for historical roles. |
| description | string | HTML `<ul>` of impact-driven `<li>` items. Highlighted phrases wrapped in `<strong>`. Localized. |
| technologies | list of string? | Chip labels; English proper nouns. Must cover named tools in that role’s description. |
| url | string? | Unchanged. All current roles remain `null`. |

**Relationships**: `ExperienceRepository.fetchExperiences()` returns a list ordered **most-recent-first**. Count MUST be **5** after this feature: ITTI, Pairtree, Tandamos, Valtech, Freelance.

**Validation**:

- First item company is `ITTI S.A.E.C.A.` and `companyContext` is `ueno bank`.
- First item `endDate` equals the active locale’s `resumePresent`.
- Every `description` contains at least one `<strong>` per `<li>`.
- Historical `startDate`/`endDate`/`job`/`company` for Pairtree, Tandamos, Valtech, Freelance stay as today except job/description ARB rewrites (titles stay Full Stack / Backend equivalents).

### ITTI technology chips (FR-007)

Exact ordered list:

1. Flutter  
2. Dart  
3. BLoC  
4. Riverpod  
5. Micro-Apps  
6. App Shell Architecture  
7. Multi-Agent AI (Cursor, Copilot)  
8. Codemagic  
9. GitHub Actions  
10. CI/CD  
11. Sonar  
12. Checkmarx  
13. Node.js  
14. Fastify  
15. NullPlatform  
16. RASP  
17. Mobile Security  
18. New Relic  
19. Instabug  
20. App Store Connect  
21. Google Play Console  
22. Huawei AppGallery  
23. Spec-Driven Development  

Chip label `Multi-Agent AI (Cursor, Copilot)` is shortened vs the ATS block so chips wrap without overflow (edge case: chip wrap).

### Chip additions on rewritten roles

| Role | Keep | Add |
|------|------|-----|
| Pairtree | existing list | Sentry, Alembic |
| Tandamos | existing list | Firebase |
| Valtech | existing list | none |
| Freelance | existing list | Firebase, Sentry (if not already implied by stack; add only if missing) |

## HighlightColors (new theme extension)

Not a domain entity stored in the repository. A `ThemeExtension` attached to light and dark `ThemeData`.

| Field | Type | Rules |
|-------|------|--------|
| emphasis | Color | Light: `0xFFC2410C`. Dark: `0xFFFF8000`. Used only for `<strong>` / `<b>` in experience HTML. |

**Relationships**: One extension instance per theme. `ExperienceCard` MUST read this token; MUST NOT hard-code the hex.

**State**: Always present after theme construction. Missing extension at runtime is a defect.

## ImpactBullet (logical, not a class)

A `<li>` inside `description`.

| Part | Rules |
|------|--------|
| Category | Leading label ending with `:`, wrapped in `<strong>` |
| Body | What was done; named tools/metrics also in `<strong>` |
| Outcome | Scale or result, when the source material has one |

Not modeled as a Dart type; stays concatenated HTML for `flutter_html`.

## Localization keys (copy source)

| Key | Used by |
|-----|---------|
| `ittiDevJobTitle` | ITTI `job` |
| `ittiDevJobDescription` | ITTI `description` |
| `pairtreeDevJobTitle` / `pairtreeDevJobDescription` | existing, description rewritten |
| `tandamosDevJobTitle` / `tandamosDevJobDescription` | existing, description rewritten |
| `valtechDevJobTitle` / `valtechDevJobDescription` | existing, description rewritten |
| `freelanceDevJobTitle` / `freelanceDevJobDescription` | existing, description rewritten |
| `resumePresent` | ITTI `endDate` |

Canonical string values: [contracts/content-catalog.md](./contracts/content-catalog.md).

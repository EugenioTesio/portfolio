# Feature Specification: Flutter 3.47 Upgrade

**Feature Branch**: `001-flutter-347-upgrade`

**Created**: 2026-08-30

**Status**: Draft

**Input**: User description: "I want to update the proyect to work with flutter 3.47, updating the dependencies to the latest version asswell"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Build and run on Flutter 3.47 (Priority: P1)

A maintainer opens the portfolio project on a machine using Flutter 3.47 (latest stable patch of that line) and can resolve dependencies, analyze the project, run the automated test suite, and launch the site locally without toolchain or dependency conflicts.

**Why this priority**: Nothing else in this upgrade has value if the project cannot be built and run on the target runtime. This is the minimum viable outcome.

**Independent Test**: On Flutter 3.47, install dependencies, run static analysis and tests, and launch the local app. Success is a clean analysis result, passing tests, and a usable local site.

**Acceptance Scenarios**:

1. **Given** the project is checked out on Flutter 3.47, **When** a maintainer installs dependencies, **Then** installation completes with no unresolved version conflicts.
2. **Given** dependencies are installed on Flutter 3.47, **When** a maintainer runs static analysis, **Then** analysis completes with no errors.
3. **Given** dependencies are installed on Flutter 3.47, **When** a maintainer runs the automated test suite, **Then** all tests pass.
4. **Given** the project runs locally on Flutter 3.47, **When** a maintainer opens the portfolio in a browser, **Then** the home experience loads and primary navigation works.

---

### User Story 2 - Keep third-party libraries current (Priority: P1)

A maintainer uses the latest published version of every existing third-party library that is compatible with Flutter 3.47, so the project is not left on stale, unsupported, or insecure package versions after the runtime upgrade.

**Why this priority**: The request explicitly includes updating dependencies to their latest versions. Remaining on old libraries after a major runtime jump recreates the same maintenance debt.

**Independent Test**: Compare each declared dependency to the latest version that works with Flutter 3.47. Success is that every package is on that latest compatible version and the project still builds, analyzes, and tests cleanly.

**Acceptance Scenarios**:

1. **Given** the current dependency list, **When** the upgrade is complete, **Then** each remaining third-party library is at the latest published version compatible with Flutter 3.47.
2. **Given** a library’s latest version includes breaking changes, **When** the project adopts that version, **Then** the portfolio still compiles, analyzes cleanly, and preserves existing visitor-facing behavior.
3. **Given** a library has no version compatible with Flutter 3.47, **When** maintainers evaluate options, **Then** they replace or remove it only as required to restore a working build, and document that exception.

---

### User Story 3 - Automated checks and published site stay healthy (Priority: P2)

A visitor continues to use the deployed portfolio as before. Automated quality checks (format, analysis, tests) and the production web build run on Flutter 3.47 so merges and publishes do not silently use the old runtime.

**Why this priority**: Local success is not enough; the public site and merge gates must use the same upgraded toolchain. Visitor-facing regressions would make the upgrade a failure even if builds succeed.

**Independent Test**: Trigger the usual quality checks and a production web build on Flutter 3.47, then walk primary visitor journeys on the built site. Success is passing checks, a successful web build, and no lost existing features.

**Acceptance Scenarios**:

1. **Given** a change is submitted after the upgrade, **When** automated quality checks run, **Then** they use Flutter 3.47 and pass format, analysis, and tests.
2. **Given** the upgraded project, **When** a production web build is produced, **Then** the build completes without runtime or dependency errors.
3. **Given** the upgraded web build, **When** a visitor uses home, project browsing, theme and language switching, and outbound links, **Then** those journeys work as they did before the upgrade.

---

### Edge Cases

- A third-party library has no published version that supports Flutter 3.47: replace or remove it only if required for a working build; do not add unrelated libraries.
- The latest version of a library changes visual appearance or interaction in a user-visible way: restore the previous visitor-facing behavior unless the change is an unavoidable platform default.
- Code-generated sources become stale after library upgrades: regenerate them so analysis and tests pass without manual edits to generated files.
- Automated checks still pin an older Flutter version: they must be updated so they cannot pass on the old runtime while local work uses 3.47.
- Project documentation that states the supported runtime still describes the previous version: it must be updated so maintainers are not instructed to use the old toolchain.
- A latest library version requires a Dart language level newer than the project currently declares: the declared language range must be raised enough for Flutter 3.47 and those libraries, without jumping to a future Dart 4.x.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: The project MUST build, analyze, and run on Flutter 3.47 (latest stable patch of the 3.47 line).
- **FR-002**: The declared Dart language range MUST be compatible with the Dart SDK bundled with Flutter 3.47.
- **FR-003**: Every third-party library currently used MUST be updated to the latest published version that is compatible with Flutter 3.47, including major version upgrades when those are the current latest.
- **FR-004**: Development-only libraries (linters, test drivers, code generation, icon/splash helpers) MUST also be updated to their latest Flutter 3.47-compatible versions.
- **FR-005**: After upgrades, static analysis MUST complete with no errors, and existing analysis rules MUST remain enforced (violations resolved, not silently disabled, unless a rule is removed by its upstream package).
- **FR-006**: The existing automated test suite MUST pass on Flutter 3.47. Tests that fail only because of upgrade-related API or matcher changes MUST be updated; tests MUST NOT be deleted to hide upgrade breakage.
- **FR-007**: Automated quality checks used for merge readiness MUST run on Flutter 3.47, not the previous pinned runtime.
- **FR-008**: A production web build MUST succeed on Flutter 3.47.
- **FR-009**: Existing visitor-facing capabilities MUST be preserved: home/landing, project listing and detail, theme switching, language switching, contact/outbound links, and responsive layout across mobile, tablet, and desktop.
- **FR-010**: User-visible copy MUST remain localized (no new hard-coded strings introduced to fix upgrade breakage). Theme values MUST continue to come from the shared theme, not ad-hoc colors added during the upgrade.
- **FR-011**: Feature boundaries and state-management approach MUST be preserved. The upgrade MUST NOT introduce cross-feature shortcuts or global mutable singletons outside the existing state system.
- **FR-012**: Generated sources that depend on upgraded libraries MUST be regenerated and kept in source control when they change.
- **FR-013**: Documented runtime constraints (including the project constitution’s technical constraints) MUST be updated so they match Flutter 3.47 and the new Dart language range.
- **FR-014**: If a library cannot be upgraded to a Flutter 3.47-compatible latest version, the project MUST either replace it with a maintained equivalent that preserves behavior, or remove it if the capability is unused. Such exceptions MUST be recorded in the feature plan.

### Key Entities

- **Runtime toolchain**: The Flutter 3.47 stable line and its bundled Dart SDK; this is the single supported development and CI runtime after the upgrade.
- **Third-party dependency**: A declared library (runtime or development) that must move to its latest Flutter 3.47-compatible version.
- **Quality gate**: The format, analysis, and test checks that must pass on the new runtime before merge.
- **Published portfolio**: The public web experience visitors use; it must remain functionally equivalent after the upgrade.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: A maintainer using Flutter 3.47 can go from a clean checkout to a running local portfolio in under 10 minutes (excluding first-time toolchain install), with no unresolved dependency or SDK errors.
- **SC-002**: 100% of automated tests that existed before the upgrade still run and pass on Flutter 3.47 (updated in place if APIs changed; none dropped solely to make the upgrade pass).
- **SC-003**: Automated merge checks report a clean format, analysis, and test result on Flutter 3.47 on the first post-upgrade verification run.
- **SC-004**: A production web build completes successfully on Flutter 3.47 without dependency or toolchain failures.
- **SC-005**: In a structured walkthrough of primary visitor journeys (home, projects, theme switch, language switch, outbound links) on mobile, tablet, and desktop widths, 100% of those journeys complete with the same outcomes as before the upgrade.
- **SC-006**: 100% of declared third-party libraries are on the latest published version compatible with Flutter 3.47, except any exception documented under FR-014.
- **SC-007**: A new maintainer reading project runtime documentation identifies Flutter 3.47 (not the previous 3.10 line) as the required version, with no contradictory older version statements left in constitution or README toolchain badges.

## Assumptions

- Flutter 3.47 means the latest stable patch of that line (for example 3.47.2 if that is current), not an exact 3.47.0 pin when a newer 3.47.x hotfix exists.
- “Latest version” of dependencies means the newest published version that works with Flutter 3.47, including major (breaking) upgrades. Stay-on-current-major is not the goal.
- The public product surface remains the web portfolio hosted as today; this upgrade does not add new visitor features or new platforms.
- Existing libraries are kept unless a latest-compatible version does not exist or cannot be made to work; replacements are in scope only to restore a working, equivalent experience.
- Visual and interaction regressions caused by upgraded libraries are treated as defects and must be fixed as part of this feature.
- Dart stays on the 3.x line required by Flutter 3.47; moving to Dart 4 is out of scope.
- Constitution principle V (verified quality gates) continues to apply: format, analysis, and tests must pass before merge.
- No interactive clarification was required: the target runtime and “latest dependencies” intent were explicit; patch-vs-exact and major-upgrade defaults above are the informed choices.

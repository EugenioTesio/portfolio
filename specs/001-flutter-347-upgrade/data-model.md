# Data Model: Flutter 3.47 Upgrade

This feature does not introduce product entities. It upgrades the **toolchain and dependency inventory** that the existing portfolio already uses. The records below are planning artifacts for FR-014 tracking and quality gates.

## RuntimeToolchain

The single supported SDK pair after the upgrade.

| Field | Type | Rules |
|-------|------|--------|
| flutterVersion | string (semver) | Must be latest 3.47.x stable. Planned: `3.47.2`. |
| dartSdk | string (semver) | Bundled with Flutter. Planned: `3.13.2`. |
| pubspecSdkConstraint | string | Must accept the bundled Dart SDK and reject Dart 4. Planned: `^3.13.0`. |
| ciPin | string | GitHub Actions `flutter-version` must equal `flutterVersion`. |
| docsPin | string | Constitution Technical Constraints and README badges must match `flutterVersion` / Dart 3.13. |

**Relationships**: One toolchain applies to local development, PR checks, and production web builds.

**State**: `legacy (3.10.2)` → `upgraded (3.47.2)`. No rollback entity; reverting is a separate change.

## ThirdPartyDependency

A package listed in `pubspec.yaml` (runtime or dev).

| Field | Type | Rules |
|-------|------|--------|
| name | string | Pub package name. |
| role | enum | `runtime` \| `dev` \| `sdk`. |
| currentConstraint | string | Constraint before upgrade. |
| targetConstraint | string | Latest Flutter 3.47-compatible version. |
| disposition | enum | `upgrade` \| `replace` \| `remove` \| `keep-latest`. |
| replacement | string? | Required when disposition is `replace`. |
| exceptionReason | string? | Required for FR-014 (`replace` or `remove`, or `keep-latest` when not the theoretical newest line). |

**Relationships**: Many dependencies belong to one RuntimeToolchain (solver must resolve against that SDK).

**Validation**: After `flutter pub get`, every remaining declared package is at its target (or documented exception). Unused packages (`envied`) are removed rather than upgraded.

## QualityGate

An automated check that must pass on the new toolchain.

| Field | Type | Rules |
|-------|------|--------|
| name | enum | `format` \| `analyze` \| `test` \| `codegen` \| `web-build`. |
| command | string | Exact maintainer/CI command (see contracts/quality-gates.md). |
| requiredOnPr | boolean | `true` for format, analyze, test; codegen enabled after Riverpod upgrade; web-build on hosting workflows. |
| passCriteria | string | Exit code 0; no dropped tests solely to hide upgrade breakage. |

**Relationships**: QualityGate runs against the upgraded RuntimeToolchain and the resolved ThirdPartyDependency set.

## PublishedPortfolio

The visitor-facing web experience that must stay equivalent.

| Field | Type | Rules |
|-------|------|--------|
| journeys | list | home/landing, project listing/detail, theme switch, language switch, contact/outbound links. |
| breakpoints | list | mobile, tablet, desktop (existing `Responsive` thresholds). |
| copySource | enum | ARB / generated l10n only — no new hard-coded strings. |
| themeSource | path | `lib/src/constants/theme.dart` via FlexColorScheme. |

**State**: Behavior is **preserved**. Visual diffs from FCS 8 / Material 3 defaults are defects unless they are unavoidable platform defaults (spec edge case).

## Contact (existing domain — type change)

Not a new entity. `Contact.icon` changes from Flutter `IconData` to Font Awesome `FaIconData` so Font Awesome 11 can compile. Fields `tooltip` and `url` are unchanged. Presentation must use `FaIcon`, not `Icon`.

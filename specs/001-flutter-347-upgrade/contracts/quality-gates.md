# Contract: Quality gates

Merge readiness (constitution V) on Flutter 3.47.2:

| Gate | Command | Pass |
|------|---------|------|
| Format | `dart format --line-length=80 --set-exit-if-changed .` | No files rewritten |
| Codegen (after Riverpod/l10n changes) | `dart run build_runner build --delete-conflicting-outputs` then `flutter gen-l10n` | Succeeds; generated files committed |
| Analyze | `flutter analyze` | No issues (existing rules kept; new `flutter_lints` 6 findings fixed, not ignored without rationale) |
| Tests | `flutter test` | 100% of previously existing tests still run and pass (updated in place if APIs changed) |
| Web production build | `flutter build web` | Exit 0 |

PR checks today omit codegen (commented). After this upgrade they MUST run codegen or equivalent so stale `*.g.dart` cannot merge.

**Out of contract**: Deleting tests to make the upgrade pass (FR-006). Silencing analyzer rules wholesale (FR-005).

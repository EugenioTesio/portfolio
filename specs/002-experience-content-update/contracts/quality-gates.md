# Contract: Quality gates

After implementation, these commands MUST exit 0 from the repo root.

| Gate | Command | Pass criteria |
|------|---------|----------------|
| Format | `dart format --line-length=80 --set-exit-if-changed .` | No diffs |
| Analyze | `flutter analyze` | No issues |
| Test | `flutter test` | All tests pass, including new experience coverage |
| L10n | `flutter gen-l10n` | Generated files match committed ARB; no missing keys vs `app_en.arb` |

## Test obligations (constitution V)

- Existing Patrol width-variant test in `test/src/app_test.dart` MUST remain.
- Add coverage that fails if ITTI is missing or not first.
- Add coverage that descriptions include `<strong>` highlight markup.
- Add coverage that Spanish locale shows `Actual` (or the Spanish title) for the current role.

Do not delete tests to hide copy or theme breakage.

## Generated files

- Commit `lib/src/localization/app_localizations.dart`, `app_localizations_en.dart`, and `app_localizations_es.dart` after ARB changes.
- Do not hand-edit generated l10n Dart; edit ARB only.
- `experience_repository.g.dart` is unchanged unless the `@riverpod` signature changes.

# Contract: Dependency inventory (FR-014)

Target versions as of 2026-08-31 (pub.dev latest compatible with Flutter 3.47.2). Implementation must re-check pub.dev at upgrade time and take a newer patch if one exists.

## Keep and upgrade

| Package | From | To (planned) | Notes |
|---------|------|----------------|-------|
| flutter / flutter_localizations / flutter_test | SDK | SDK 3.47.2 | |
| flutter_web_plugins | — | SDK | Replaces `url_strategy` |
| animated_glitch | ^2.0.0+2 | 2.0.0+2 | Already latest |
| collection | ^1.17.1 | ^1.19.1 | Direct imports exist |
| firebase_core | ^2.14.0 | ^4.14.0 | |
| flex_color_scheme | ^7.1.2 | ^8.4.0 | Theme tokens stay in `theme.dart` |
| flutter_html | ^3.0.0-beta.2 | ^3.0.0 | Stable |
| flutter_riverpod | ^2.3.6 | ^3.4.2 | With annotation/generator/lint set |
| riverpod_annotation | ^2.1.1 | ^4.0.6 | |
| font_awesome_flutter | ^10.4.0 | ^11.0.0 | `FaIcon` / `FaIconData` |
| google_fonts | ^5.1.0 | ^8.2.1 | |
| intl | ^0.18.0 | ^0.20.2 (lock 0.20.3) | Matches `flutter_localizations` on 3.47.2 |
| seo | ^0.0.4 | ^0.0.10 | |
| url_launcher | ^6.1.11 | ^6.3.2 | |
| build_runner | ^2.4.5 | ^2.16.0 | Move to **dev_dependencies** |
| flutter_launcher_icons | ^0.13.1 | ^0.14.4 | Move to **dev_dependencies** |
| flutter_native_splash | ^2.3.1 | ^2.4.8 | Move to **dev_dependencies** |
| flutter_lints | ^2.0.1 | ^6.0.0 | |
| patrol | ^2.2.0 | ^4.9.0 | Keep widget test in `test/` via `patrol_finders` |
| patrol_finders | — | ^3.6.0 | Direct dep for Patrol 4 widget tests (`patrolWidgetTest`) |
| riverpod_generator | ^2.2.3 | ^4.0.8 | |
| riverpod_lint | ^1.3.2 | ^3.1.8 | |

## Replace (FR-014)

| Package | Replacement | Reason |
|---------|-------------|--------|
| url_strategy ^0.2.0 | `flutter_web_plugins` `usePathUrlStrategy()` | Official SDK equivalent |
| auto_size_text ^3.0.0 | auto_size_text_plus ^3.0.2 | Original latest declares Dart SDK `<3.0.0`; not 3.47-compatible |

## Remove (FR-014)

| Package | Reason |
|---------|--------|
| envied ^0.3.0+3 | Unused (no imports, no generator) |
| custom_lint ^0.8.1 | `riverpod_lint` 3.1.4+ uses `analysis_server_plugin` and is incompatible with `custom_lint` 0.8.1 (`analyzer_plugin` 0.14 vs 0.13). Removed; register `plugins: riverpod_lint` in `analysis_options.yaml`. |

## Conditional exception

| Package | Policy |
|---------|--------|
| animated_glitch 2.0.0+2 | Keep if it compiles on 3.47. If analysis/compile fails, replace or isolate only as needed and record the exception here. |
| flutter_html ^3.0.0 | Latest line. Transitive `html` 0.15.6+ removed `qs.matches`; pin `html: 0.15.5+1` via `dependency_overrides` in `pubspec.yaml` so tests compile. |

No other new third-party packages are in scope.

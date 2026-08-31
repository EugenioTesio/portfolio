# Research: Flutter 3.47 Upgrade

**Feature**: `001-flutter-347-upgrade`  
**Date**: 2026-08-31

## 1. Target runtime

- **Decision**: Pin development and CI to Flutter **3.47.2** (stable, 2026-08-27) with bundled Dart **3.13.2**. Declare `environment.sdk: ^3.13.0` in `pubspec.yaml`.
- **Rationale**: Spec requires the latest 3.47.x patch, not a hard 3.47.0 pin. Several latest packages (`flutter_riverpod` 3.4.2, `riverpod_annotation` 4.0.6, `google_fonts` 8.2.1, `flex_color_scheme` 8.4.0) require Dart ≥3.10–3.12 and Flutter ≥3.27–3.38; 3.47.2 satisfies all of them. `^3.13.0` stays on Dart 3.x (Dart 4 is out of scope).
- **Alternatives considered**: Float on `channel: stable` without a version pin (hosting workflows do this today) — rejected for merge checks because a future 3.50 line could pass CI while local work still targets 3.47. Exact 3.47.0 pin — rejected by spec assumptions.

## 2. Dependency upgrade policy

- **Decision**: Move every remaining third-party package to the latest pub.dev version compatible with Flutter 3.47.2, including major upgrades. Resolve the graph with `flutter pub upgrade --major-versions` then lock with `flutter pub get`.
- **Rationale**: Spec FR-003/FR-004. Mixing 2.x and 3.x Riverpod packages will not resolve; majors must move together.
- **Alternatives considered**: Stay on current majors — rejected by spec.

## 3. Riverpod 2.x → 3.x / annotation 4.x

- **Decision**: Upgrade as a set: `flutter_riverpod: ^3.4.2`, `riverpod_annotation: ^4.0.6`, `riverpod_generator: ^4.0.8`, `riverpod_lint: ^3.1.8`, `custom_lint: ^0.8.1`. Run `dart run custom_lint` / `dart fix` using riverpod_lint, then `dart run build_runner build --delete-conflicting-outputs`. Commit regenerated `*.g.dart`.
- **Rationale**: Latest compatible set (annotation 4.0.6 depends on `riverpod` 3.4.2). Codegen is already used (`@riverpod` on repositories and `DarkMode`). Riverpod 3 simplifies `*Ref` subtypes to `Ref`, retries failing providers, filters updates with `==`, and moves `StateProvider`/`StateNotifierProvider` behind `legacy.dart` (this app uses generated Notifiers, so legacy import is likely unused). Constitution II still holds: state stays in Riverpod, providers stay next to features.
- **Alternatives considered**: Stay on Riverpod 2.x latest — not the latest line; fails FR-003.

## 4. Localization synthetic package removal

- **Decision**: Set `synthetic-package: false` in `l10n.yaml` (output into `lib/src/localization/` via existing `arb-dir`). Replace all `package:flutter_gen/gen_l10n/app_localizations.dart` imports with `package:portfolio/src/localization/app_localizations.dart`. Keep `generate: true`. Commit generated l10n Dart files.
- **Rationale**: `package:flutter_gen` was deprecated in 3.29, default-off in 3.32, and removed from the tool in later stables. Flutter 3.47 will not provide the synthetic package. Copy stays in ARB files (constitution IV).
- **Alternatives considered**: Keep `flutter_gen` imports — will not compile on 3.47.

## 5. URL strategy

- **Decision**: Remove `url_strategy`. Add SDK dependency `flutter_web_plugins` and call `usePathUrlStrategy()` from `package:flutter_web_plugins/url_strategy.dart` in `lib/main.dart`.
- **Rationale**: Official Flutter equivalent; `url_strategy` is a third-party wrapper. FR-014 replacement, not a new capability.
- **Alternatives considered**: Upgrade `url_strategy` to 0.3.0 — works but keeps a redundant package.

## 6. Unused `envied`

- **Decision**: Remove `envied` from `pubspec.yaml`. Do not add `envied_generator`.
- **Rationale**: Declared but never imported. FR-014 allows removal of unused capability. Firebase options remain in `lib/firebase_options.dart` (public web keys). Secrets stay out of source (constitution hosting constraint).
- **Alternatives considered**: Upgrade to envied 1.3.8 “just in case” — YAGNI.

## 7. `auto_size_text` replacement

- **Decision**: Replace `auto_size_text` 3.0.0 with `auto_size_text_plus` ^3.0.2. Keep `AutoSizeText` usage in `lib/src/common_widgets/app_text.dart`.
- **Rationale**: Original package’s latest (and only) 3.0.0 declares `sdk: >=2.12.0 <3.0.0` and has not been published in four years — not Flutter 3.47 compatible. `auto_size_text_plus` 3.0.2 is an API-compatible fork with `sdk: >=3.3.0 <4.0.0`. FR-014 replacement to preserve autosize behavior.
- **Alternatives considered**: Drop autosize and use `Text` — changes visitor typography. `font_fit` — different API, less drop-in.

## 8. Font Awesome 11

- **Decision**: Upgrade to `font_awesome_flutter` ^11.0.0. Change `Contact.icon` from `IconData` to `FaIconData`. Replace `Icon(FontAwesomeIcons…)` / `Icon(contact.icon)` with `FaIcon(...)`. Adjust equality checks (e.g. discord padding) to compare `FaIconData`.
- **Rationale**: 11.0.0 is required for Flutter’s upcoming final `IconData`. `FaIconData` no longer implements `IconData`; `Icon` cannot render FA glyphs. Used in introduction contacts, app bar, project GitHub icon, magic/favorite icons, resume button.
- **Alternatives considered**: Stay on 10.x — not latest; may break when `IconData` is final.

## 9. Theming: FlexColorScheme 8 + Google Fonts 8

- **Decision**: Upgrade `flex_color_scheme` to ^8.4.0 and `google_fonts` to ^8.2.1. Keep all color/typography tokens in `lib/src/constants/theme.dart`. After upgrade, visually compare light/dark themes; re-enable FCS v8 defaults only where needed to match current appearance (`interactionEffects` / `tintedDisabledControls` now default false — already explicit false in this file). Preserve Nunito via `GoogleFonts.nunito()` and existing `assets/fonts/nunito/` entries.
- **Rationale**: FCS 8 is the latest line and requires Flutter ≥3.38. Constitution IV: no ad-hoc colors in feature widgets during the fix-up.
- **Alternatives considered**: Stay on FCS 7.x — not latest; may fail to resolve against Flutter 3.47 Material APIs.

## 10. Firebase, HTML, SEO, launchers

- **Decision**: `firebase_core` ^4.14.0; keep `Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)` unless the 4.x API requires a trivial signature update. `flutter_html` ^3.0.0 (stable, leaving beta.2). `seo` ^0.0.10. `url_launcher` ^6.3.2. `flutter_native_splash` ^2.4.8 and `flutter_launcher_icons` ^0.14.4 as **dev_dependencies**. Move `build_runner` to **dev_dependencies**.
- **Rationale**: Latest compatible versions. Splash/icon/codegen tools are not runtime dependencies. `flutter_html` 3.0.0 keeps `Html(data:, style:)`.
- **Alternatives considered**: Drop Firebase on web-only init — out of scope; site already initializes it.

## 11. Analysis, tests, Patrol

- **Decision**: `flutter_lints` ^6.0.0; keep `analysis_options.yaml` includes and resolve new findings (do not disable rules to hide upgrade noise). `patrol` ^4.1+ (latest 4.9.0). Keep `test/src/app_test.dart` as a widget `patrolTest` under `flutter test` (do not move to `patrol_test/` unless Patrol 4 refuses `test/`). Update finders/APIs in place; do not delete tests.
- **Rationale**: Constitution V and spec FR-005/FR-006. Patrol 4’s default `patrol_test/` directory applies to `patrol test` integration runs; this repo’s only Patrol usage is a widget test in `test/`.
- **Alternatives considered**: Drop Patrol and use only `flutter_test` — weaker than constitution guidance.

## 12. CI and docs

- **Decision**: Pin `subosito/flutter-action@v2` to `flutter-version: "3.47.2"` and `channel: stable` in `.github/workflows/all-pr-checks.yml`, `firebase-hosting-merge.yml`, and `firebase-hosting-pull-request.yml`. After codegen upgrades, run `dart run build_runner build --delete-conflicting-outputs` in PR checks (currently commented out). Update README badges to Flutter 3.47 / Dart 3.13. Amend constitution Technical Constraints (PATCH) to Flutter 3.47.x and Dart `^3.13.0`.
- **Rationale**: FR-007, FR-008, FR-013. Hosting workflows currently float on latest stable, so they could diverge from PR checks.
- **Alternatives considered**: Only change PR checks — deploy could still use a different Flutter.

## 13. Packages already at latest or likely compile-only risk

- **Decision**: Keep `animated_glitch` 2.0.0+2 (already latest; last published for Flutter ≥3.10). If 3.47 analysis/compile fails, treat as FR-014 and replace only if required. Keep direct `collection` ^1.19.1 (imported in project/experience/resume dialogs). `intl` must satisfy `flutter_localizations` from the 3.47 SDK — prefer the SDK-aligned version if 0.20.3 conflicts.
- **Rationale**: Spec: replace only when no compatible latest exists or it cannot be made to work.
- **Alternatives considered**: Proactively replace `animated_glitch` — unjustified until it fails.

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/main/presentation/main_section.dart';
import 'package:portfolio/src/features/main/presentation/provider/dark_mode_controller.dart';
import 'package:portfolio/src/localization/localization_provider.dart';
import 'package:seo/seo.dart';

import 'constants/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SeoController(
      tree: WidgetTree(context: context),
      child: MaterialApp(
        title: "Eugenio Tesio",
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: ref.watch(localizationProvider),
        theme: lightTheme,
        darkTheme: dartTheme,
        // If you do not have a themeMode switch, uncomment this line
        // to let the device system mode control the theme mode:
        // themeMode: ThemeMode.system,
        themeMode:
            ref.watch(darkModeProvider) ? ThemeMode.dark : ThemeMode.light,
        home: const MainSection(),
      ),
    );
  }
}

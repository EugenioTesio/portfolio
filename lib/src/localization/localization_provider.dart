import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:portfolio/src/localization/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization_provider.g.dart';

@riverpod
class Localization extends _$Localization {
  @override
  Locale build() {
    return basicLocaleListResolution([
      PlatformDispatcher.instance.locale,
    ], AppLocalizations.supportedLocales);
  }

  //locale getter
  Locale get locale => state;

  //locale setter
  set locale(Locale locale) => state = locale;
}

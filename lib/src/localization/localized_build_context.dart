import 'package:flutter/widgets.dart';
import 'package:portfolio/src/localization/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get localized => AppLocalizations.of(this);
}

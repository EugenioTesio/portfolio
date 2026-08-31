import 'package:portfolio/src/localization/app_localizations.dart';
import 'package:portfolio/src/localization/localization_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_localizations_provider.g.dart';

@riverpod
AppLocalizations appLocalizations(Ref ref) {
  final currentLocale = ref.watch(localizationProvider);
  return lookupAppLocalizations(currentLocale);
}

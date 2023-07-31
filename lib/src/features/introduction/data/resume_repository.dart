import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/features/introduction/domain/resume.dart';
import 'package:portfolio/src/localization/app_localizations_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resume_repository.g.dart';

@riverpod
ResumeRepository resumeRepository(ResumeRepositoryRef ref) {
  final appLocalizations = ref.watch(appLocalizationsProvider);
  return ResumeRepository(appLocalizations);
}

class ResumeRepository {
  ResumeRepository(this._appLocalizations);

  final AppLocalizations _appLocalizations;

  List<Resume> fetchLocalizedResumes() {
    return [
      Resume(
        language: _appLocalizations.englishLanguage,
        url:
            'https://drive.google.com/file/d/119WqZ5NPGDS1YipAd1qoME_mQlD5lFiU/view?usp=sharing',
      ),
    ];
  }
}

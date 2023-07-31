import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/features/project/domain/project.dart';
import 'package:portfolio/src/localization/app_localizations_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_repository.g.dart';

@riverpod
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  final appLocalizations = ref.watch(appLocalizationsProvider);
  return ProjectRepository(appLocalizations);
}

class ProjectRepository {
  ProjectRepository(this._appLocalizations);

  final AppLocalizations _appLocalizations;

  List<Project> fetchProjects() {
    return [
      Project(
        title: 'Portfolio',
        description: _appLocalizations.portfolioDescription,
        technologies: [
          'Flutter',
          'Dart',
        ],
        url: 'https://github.com/EugenioTesio/portfolio#readme',
        asset: 'assets/projects/portfolio.png',
      ),
      Project(
        title: 'Vulletic Electrical Vehicle Charger Solution',
        description: _appLocalizations.vulleticProjectDescription,
        technologies: [
          'Flutter',
          'GetX',
          'Python',
          'FastApi',
          'Nuxt',
          'Firebase Auth',
          'Firestore',
          'Firebase Emulators',
          'Crashlytics',
          'Google Cloud Engine',
          'Google Cloud Build',
          'Git',
        ],
        url: 'https://vulletic.com.ar/software-app/',
        asset: 'assets/projects/vulletic.png',
      ),
      Project(
        title: 'Collect.io',
        description: _appLocalizations.collectioProjectDescriptionHtml,
        technologies: [
          'Flutter',
          'GetX',
          'Firebase Auth',
          'Firestore',
          'Firebase Emulators',
          'Crashlytics',
          'Git',
        ],
        url:
            'https://play.google.com/store/apps/details?id=ar.com.zetus.collectio',
        asset: 'assets/projects/collectio.png',
      ),
    ];
  }
}

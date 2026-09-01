import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:portfolio/src/localization/app_localizations.dart';
import 'package:portfolio/src/localization/app_localizations_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experience_repository.g.dart';

@riverpod
ExperienceRepository experienceRepository(Ref ref) {
  final appLocalizations = ref.watch(appLocalizationsProvider);
  return ExperienceRepository(appLocalizations);
}

class ExperienceRepository {
  ExperienceRepository(this._appLocalizations);

  final AppLocalizations _appLocalizations;

  List<Experience> fetchExperiences() {
    return [
      Experience(
        startDate: 'Sep. 2023',
        endDate: _appLocalizations.resumePresent,
        job: _appLocalizations.ittiDevJobTitle,
        company: 'ITTI S.A.E.C.A.',
        companyContext: 'ueno bank',
        description: _appLocalizations.ittiDevJobDescription,
        technologies: [
          'Flutter',
          'Dart',
          'BLoC',
          'Riverpod',
          'Micro-Apps',
          'App Shell Architecture',
          'Multi-Agent AI (Cursor, Copilot)',
          'Codemagic',
          'GitHub Actions',
          'CI/CD',
          'Sonar',
          'Checkmarx',
          'Node.js',
          'Fastify',
          'NullPlatform',
          'RASP',
          'Mobile Security',
          'New Relic',
          'Instabug',
          'App Store Connect',
          'Google Play Console',
          'Huawei AppGallery',
          'Spec-Driven Development',
        ],
      ),
      Experience(
        startDate: 'Jun. 2022',
        endDate: 'May. 2023',
        job: _appLocalizations.pairtreeDevJobTitle,
        company: 'PairTree',
        description: _appLocalizations.pairtreeDevJobDescription,
        technologies: [
          'Flutter',
          'Dart',
          'BloC',
          'Beamer',
          'GitHub Actions',
          'CI/CD',
          'FastApi',
          'Python',
          'PostgreSQL',
          'SqlAlchemy',
          'Alembic',
          'Docker',
          'Sentry',
        ],
      ),
      Experience(
        startDate: 'Feb. 2022',
        endDate: 'May. 2023',
        job: _appLocalizations.tandamosDevJobTitle,
        company: 'Tandamos',
        description: _appLocalizations.tandamosDevJobDescription,
        technologies: [
          'Flutter',
          'Dart',
          'Riverpod',
          'Nest.js',
          'TypeScript',
          'TypeORM',
          'MySQL',
          'Docker',
          'Firebase',
        ],
      ),
      Experience(
        startDate: 'Sep. 2021',
        endDate: 'Feb. 2022',
        job: _appLocalizations.valtechDevJobTitle,
        company: 'Valtech',
        description: _appLocalizations.valtechDevJobDescription,
        technologies: [
          'Spring Boot',
          'Oracle Responsys',
          'Google App Engine',
          'Google Pub/Sub',
          'Google Logging',
          'Google DialogFlow',
          'Express',
          'Twilio',
          'Resilence4j',
          'Thymeleaf',
        ],
      ),
      Experience(
        startDate: 'Apr. 2011',
        endDate: 'Aug. 2021',
        job: _appLocalizations.freelanceDevJobTitle,
        company: 'Freelance',
        description: _appLocalizations.freelanceDevJobDescription,
        technologies: [
          'Flutter',
          'Dart',
          'Riverpod',
          'Android Native',
          'Spring Boot',
          'Python',
          'FastApi',
          'WebSockets',
          'Angular',
          'Google App Engine',
          'Google Pub/Sub',
          'Google Logging',
          'MySQL',
          'Docker',
          'Firebase',
          'Sentry',
        ],
      ),
    ];
  }
}

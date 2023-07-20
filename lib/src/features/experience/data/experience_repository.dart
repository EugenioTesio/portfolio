import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:portfolio/src/localization/app_localizations_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experience_repository.g.dart';

@riverpod
ExperienceRepository experienceRepository(ExperienceRepositoryRef ref) {
  final appLocalizations = ref.watch(appLocalizationsProvider);
  return ExperienceRepository(appLocalizations);
}

class ExperienceRepository {
  ExperienceRepository(this._appLocalizations);

  final AppLocalizations _appLocalizations;

  List<Experience> fetchExperiences() {
    return [
      Experience(
        startDate: "Jun. 2022",
        endDate: "May. 2023",
        job: _appLocalizations.pairtreeDevJobTitle,
        company: "PairTree",
        description: _appLocalizations.pairtreeDevJobDescription,
        technologies: [
          "Flutter",
          "Dart",
          "BloC",
          "Beamer",
          "GitHub Actions",
          "CI/CD",
          "FastApi",
          "Python",
          "PostgreSQL",
          "SqlAlchemy",
          "Docker"
        ],
      ),
      Experience(
        startDate: "Feb. 2022",
        endDate: "May. 2023",
        job: _appLocalizations.tandamosDevJobTitle,
        company: "Tandamos",
        description: _appLocalizations.tandamosDevJobDescription,
        technologies: [
          "Flutter",
          "Dart",
          "Riverpod",
          "Nest.js",
          "TypeScript",
          "TypeORM",
          "MySQL",
          "Docker"
        ],
      ),
      Experience(
        startDate: "Sep. 2021",
        endDate: "Feb. 2022",
        job: _appLocalizations.valtechDevJobTitle,
        company: "Tandamos",
        description: _appLocalizations.valtechDevJobDescription,
        technologies: [
          "Spring Boot",
          "Oracle Responsys",
          "Google App Engine",
          "Google Pub/Sub",
          "Google Logging",
          "Google DialogFlow",
          "Express",
          "Twilio",
          "Resilence4j",
          "Thymeleaf",
        ],
      ),
      Experience(
        startDate: "Apr. 2011",
        endDate: "Aug. 2021",
        job: _appLocalizations.freelanceDevJobTitle,
        company: "Tandamos",
        description: _appLocalizations.freelanceDevJobDescription,
        technologies: [
          "Flutter",
          "Dart",
          "Riverpod",
          "Android Native",
          "Spring Boot",
          "Python",
          "FastApi",
          "WebSockets",
          "Angular",
          "Google App Engine",
          "Google Pub/Sub",
          "Google Logging",
          "MySQL",
          "Docker"
        ],
      ),
    ];
  }
}

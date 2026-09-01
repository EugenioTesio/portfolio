import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/src/features/experience/data/experience_repository.dart';
import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:portfolio/src/localization/app_localizations.dart';

void main() {
  Future<ExperienceRepository> repositoryFor(Locale locale) async {
    final localizations = await AppLocalizations.delegate.load(locale);
    return ExperienceRepository(localizations);
  }

  List<String> listItems(String html) {
    return RegExp(
      '<li>(.*?)</li>',
      dotAll: true,
    ).allMatches(html).map((match) => match.group(1)!).toList();
  }

  void expectStrongInEveryListItem(String html) {
    final items = listItems(html);
    expect(items, isNotEmpty);
    for (final item in items) {
      expect(item, contains('<strong>'));
    }
  }

  group('English experiences', () {
    late List<Experience> experiences;

    setUp(() async {
      final repository = await repositoryFor(const Locale('en'));
      experiences = repository.fetchExperiences();
    });

    test('lists ITTI first among five roles', () {
      expect(experiences, hasLength(5));
      final first = experiences.first;
      expect(first.company, 'ITTI S.A.E.C.A.');
      expect(first.companyContext, 'ueno bank');
      expect(first.job, 'Mobile Expert');
      expect(first.endDate, 'Present');
      expect(first.startDate, 'Sep. 2023');
    });

    test('wraps a strong highlight in every ITTI bullet', () {
      expectStrongInEveryListItem(experiences.first.description);
    });

    test('keeps historical metadata and impact-driven markup', () {
      expect(experiences[1].company, 'PairTree');
      expect(experiences[1].startDate, 'Jun. 2022');
      expect(experiences[1].endDate, 'May. 2023');
      expect(experiences[2].company, 'Tandamos');
      expect(experiences[2].startDate, 'Feb. 2022');
      expect(experiences[2].endDate, 'May. 2023');
      expect(experiences[3].company, 'Valtech');
      expect(experiences[3].startDate, 'Sep. 2021');
      expect(experiences[3].endDate, 'Feb. 2022');
      expect(experiences[4].company, 'Freelance');
      expect(experiences[4].startDate, 'Apr. 2011');
      expect(experiences[4].endDate, 'Aug. 2021');

      for (final experience in experiences.skip(1)) {
        expectStrongInEveryListItem(experience.description);
      }
    });
  });

  test('Spanish locale uses Experto Mobile and Actual', () async {
    final repository = await repositoryFor(const Locale('es'));
    final first = repository.fetchExperiences().first;
    expect(first.job, 'Experto Mobile');
    expect(first.endDate, 'Actual');
    expectStrongInEveryListItem(first.description);
  });
}

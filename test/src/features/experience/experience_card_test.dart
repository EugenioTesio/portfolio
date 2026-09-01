import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/src/constants/theme.dart';
import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:portfolio/src/features/experience/presentation/widgets/experience_card.dart';

void main() {
  const itti = Experience(
    startDate: 'Sep. 2023',
    endDate: 'Present',
    job: 'Mobile Expert',
    company: 'ITTI S.A.E.C.A.',
    companyContext: 'ueno bank',
    description:
        '<ul><li><strong>Architecture:</strong> Micro-App for '
        '<strong>50+ Flutter engineers</strong>.</li></ul>',
    technologies: ['Flutter', 'Codemagic', 'GitHub Actions'],
  );

  Future<void> pumpCard(WidgetTester tester, {required Size size}) async {
    await tester.binding.setSurfaceSize(size);
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: lightTheme,
          darkTheme: dartTheme,
          home: const Scaffold(
            body: SingleChildScrollView(
              child: ExperienceCard(experience: itti),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('shows ITTI role, context, and chips on desktop', (tester) async {
    await pumpCard(tester, size: const Size(1280, 900));
    expect(find.text('Mobile Expert'), findsOneWidget);
    expect(find.textContaining('ITTI S.A.E.C.A.'), findsOneWidget);
    expect(find.textContaining('ueno bank'), findsOneWidget);
    expect(find.text('Codemagic'), findsOneWidget);
    expect(find.textContaining('50+ Flutter engineers'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('renders without overflow on a mobile width', (tester) async {
    await pumpCard(tester, size: const Size(390, 844));
    expect(find.text('Mobile Expert'), findsOneWidget);
    expect(find.textContaining('Present'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

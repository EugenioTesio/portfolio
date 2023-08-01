import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common_widgets/app_text.dart';
import 'package:portfolio/src/common_widgets/technology_chip.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/project/domain/project.dart';

class ProjectDescription extends ConsumerWidget {
  const ProjectDescription({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: AppText(
                '${project.title} ',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Icon(Icons.open_in_new),
          ],
        ),
        gapH8,
        Row(
          children: [
            Expanded(
              child: AppText(
                project.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        gapH16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: project.technologies!.map((technology) {
            return TechnologyChip(name: technology);
          }).toList(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common_widgets/app_text.dart';
import 'package:portfolio/src/features/main/presentation/provider/dark_mode_controller.dart';

class TechnologyChip extends ConsumerWidget {
  const TechnologyChip({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IgnorePointer(
        child: Chip(
          label: AppText(
            name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ),
          backgroundColor: isDark ? Colors.black : Colors.grey[300],
          side: BorderSide.none,
        ),
      ),
    );
  }
}

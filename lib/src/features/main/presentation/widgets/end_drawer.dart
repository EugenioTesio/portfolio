import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common_widgets/responsive.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/main/presentation/provider/dark_mode_controller.dart';
import 'package:portfolio/src/features/main/presentation/provider/section_key_provider.dart';
import 'package:portfolio/src/features/main/presentation/widgets/dark_mode_switch.dart';
import 'package:portfolio/src/features/main/presentation/widgets/drawer_button.dart';
import 'package:portfolio/src/features/main/presentation/widgets/locale_button.dart';
import 'package:portfolio/src/localization/localized_build_context.dart';

class EndDrawer extends ConsumerWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);
    if (Responsive.isDesktop(context)) return const SizedBox.shrink();
    return Drawer(
      backgroundColor:
          isDark ? Colors.black.withAlpha(220) : Colors.white.withAlpha(220),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ),
          ),
          Divider(
            height: 8,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    gapH40,
                    const DarkModeSwitch(),
                    gapH80,
                    MyDrawerButton(
                      title: context.localized.homeSectionTitle,
                      sectionKey: ref.watch(homeSectionKeyProvider),
                    ),
                    gapH40,
                    MyDrawerButton(
                      title: context.localized.aboutSectionTitle,
                      sectionKey: ref.watch(aboutSectionKeyProvider),
                    ),
                    gapH40,
                    MyDrawerButton(
                      title: context.localized.experienceSectionTitle,
                      sectionKey: ref.watch(experienceSectionKeyProvider),
                    ),
                    gapH40,
                    MyDrawerButton(
                      title: context.localized.projectsSectionTitle,
                      sectionKey: ref.watch(projectSectionKeyProvider),
                    ),
                    gapH80,
                    const LocaleButton(),
                    gapH40,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

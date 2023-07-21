import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/introduction/data/contact_repository.dart';
import 'package:portfolio/src/features/introduction/data/resume_repository.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/contact_bar.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/favorite_icon.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/magic_icon.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/profile_image.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/resume_button.dart';
import 'package:portfolio/src/localization/localized_build_context.dart';

class IntroductionDesktop extends ConsumerWidget {
  const IntroductionDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.read(contactRepositoryProvider).fetchContacts();
    final resumes = ref.watch(resumeRepositoryProvider).fetchLocalizedResumes();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            ProfileImage(
              asset: 'assets/images/profile-image-2-without-bg.png',
              size: 340,
            ),
          ],
        ),
        gapH4,
        Text(
          context.localized.name,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        gapH4,
        Wrap(
          children: [
            Text(
              "${context.localized.description} ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const MagicIcon(),
          ],
        ),
        gapH8,
        Wrap(
          children: [
            Text(
              "${context.localized.subDescription} ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const FavoriteIcon(),
          ],
        ),
        resumes.isEmpty
            ? const SizedBox.shrink()
            : const Column(
                children: [
                  gapH40,
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: ResumeButton(),
                  ),
                ],
              ),
        gapH8,
        ContactBar(contacts: contacts),
      ],
    );
  }
}

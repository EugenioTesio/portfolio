import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common_widgets/app_text.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/introduction/data/contact_repository.dart';
import 'package:portfolio/src/features/introduction/data/resume_repository.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/contact_bar.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/favorite_icon.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/magic_icon.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/profile_image.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/resume_button.dart';
import 'package:portfolio/src/localization/localized_build_context.dart';

class IntroductionMobile extends ConsumerWidget {
  const IntroductionMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.read(contactRepositoryProvider).fetchContacts();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Wrap(
          children: [
            ProfileImage(
              asset: 'assets/images/profile-image-2-without-bg.png',
              size: 340,
            ),
          ],
        ),
        AppText(
          context.localized.name,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        gapH4,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: AppText(
                '${context.localized.description} ',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 20),
              ),
            ),
            const MagicIcon(),
          ],
        ),
        gapH8,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: AppText(
                '${context.localized.subDescription} ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const FavoriteIcon(),
          ],
        ),
        _buildResumeButton(ref),
        gapH8,
        ContactBar(contacts: contacts),
      ],
    );
  }

  Widget _buildResumeButton(WidgetRef ref) {
    final resumes = ref.watch(resumeRepositoryProvider).fetchLocalizedResumes();
    if (resumes.isEmpty) return const SizedBox.shrink();
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 28),
      child: ResumeButton(),
    );
  }
}

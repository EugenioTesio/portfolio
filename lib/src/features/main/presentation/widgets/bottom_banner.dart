import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common_widgets/app_text.dart';
import 'package:portfolio/src/common_widgets/link.dart';
import 'package:portfolio/src/localization/localized_build_context.dart';

class BottomBanner extends ConsumerWidget {
  const BottomBanner({super.key, this.bannerHeight = 48});

  final double bannerHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: double.maxFinite,
      height: bannerHeight,
      color: Theme.of(context).colorScheme.tertiary.withAlpha(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            '${context.localized.credit} ',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyLarge!,
            child: Link(
              url: 'https://brittanychiang.com',
              displayLink: 'Brittany Chiang',
              underlined: true,
              hoverColor: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/main/presentation/main_section_desktop.dart';
import 'package:portfolio/src/features/main/presentation/main_section_tablet.dart';
import 'package:portfolio/src/features/main/presentation/provider/dark_mode_controller.dart';
import 'package:portfolio/src/features/main/presentation/widgets/bottom_banner.dart';
import 'package:portfolio/src/features/main/presentation/widgets/end_drawer.dart';
import 'package:portfolio/src/features/main/presentation/provider/scroll_controller.dart';
import 'package:portfolio/src/common_widgets/responsive.dart';

class MainSection extends ConsumerStatefulWidget {
  const MainSection({super.key});

  @override
  ConsumerState<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends ConsumerState<MainSection> {
  double _bottomBannerHeight = 0;

  void _checkEndOfScroll() {
    if (ref.watch(scrollControllerProvider.notifier).checkEndOfScroll()) {
      setState(() => _bottomBannerHeight = 48);
    } else {
      setState(() => _bottomBannerHeight = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(scrollControllerProvider).addListener(_checkEndOfScroll);
    final darkMode = ref.watch(darkModeProvider);

    return Scaffold(
      endDrawer: const SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: EndDrawer(),
      ),
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(darkMode
                  ? 'assets/images/background-dark.png'
                  : 'assets/images/background-light.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              const Responsive(
                desktop: MainDesktop(),
                tablet: MainTablet(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomBanner(bannerHeight: _bottomBannerHeight),
              )
            ],
          ),
        ),
      ),
    );
  }
}

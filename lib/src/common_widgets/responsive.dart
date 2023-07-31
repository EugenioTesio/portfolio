import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Responsive extends ConsumerWidget {
  const Responsive({
    required this.desktop,
    super.key,
    this.tablet,
    this.mobile,
  });
  final Widget desktop;
  final Widget? tablet;
  final Widget? mobile;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1024;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1024 &&
      MediaQuery.sizeOf(context).width >= 640;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 640;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxWidth = MediaQuery.sizeOf(context).width;
    final maxHeight = MediaQuery.sizeOf(context).height;
    if ((maxWidth < 640 || maxHeight < 915) && mobile != null) {
      return mobile!;
    } else if (maxWidth < 1024 && tablet != null) {
      return tablet!;
    } else {
      return desktop;
    }
  }
}

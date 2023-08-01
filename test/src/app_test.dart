import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:portfolio/src/app.dart';
import 'package:portfolio/src/common_widgets/responsive.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MyApp', () {
    final widthVariant = ValueVariant<double>({
      Responsive.desktopBreakpoint + 1,
      Responsive.desktopBreakpoint - 1,
      Responsive.mobileBreackpoint - 1,
    });

    patrolTest(
      'renders correctly for all screen widths',
      ($) async {
        await $.tester.binding
            .setSurfaceSize(Size(widthVariant.currentValue ?? 800, 600));
        await $.pumpWidgetAndSettle(
          const ProviderScope(child: MyApp()),
        );
      },
      variant: widthVariant,
    );
  });
}

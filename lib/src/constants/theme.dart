import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Made for FlexColorScheme version 7.0.0. Make sure you
// use same or higher package version, but still same major version.
// If you use a lower version, some properties may not be supported.
// In that case remove them after copying this theme to your app.

final lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xffbfd7ed),
    primaryContainer: Color(0xff0074b7),
    secondary: Color(0xff60a3d9),
    secondaryContainer: Color(0xff003b73),
    tertiary: Color(0xff8a9cbb),
    tertiaryContainer: Color(0xff000000),
    appBarColor: Color(0xff003b73),
    error: Color(0xffb00020),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 57),
    displayMedium: TextStyle(fontSize: 45),
    displaySmall: TextStyle(fontSize: 36),
    headlineLarge: TextStyle(fontSize: 32),
    headlineMedium: TextStyle(fontSize: 28),
    headlineSmall: TextStyle(fontSize: 26),
    titleLarge: TextStyle(fontSize: 24),
    titleMedium: TextStyle(fontSize: 18),
    titleSmall: TextStyle(fontSize: 16),
    bodyLarge: TextStyle(fontSize: 18),
    bodyMedium: TextStyle(fontSize: 16),
    bodySmall: TextStyle(fontSize: 14),
  ),
  subThemesData: const FlexSubThemesData(
    interactionEffects: false,
    tintedDisabledControls: false,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    inputDecoratorUnfocusedBorderIsColored: false,
    chipRadius: 20.0,
    tooltipRadius: 4.0,
    tooltipSchemeColor: SchemeColor.inverseSurface,
    tooltipOpacity: 0.9,
    snackBarElevation: 6.0,
    snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationBarIndicatorOpacity: 1.00,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailLabelType: NavigationRailLabelType.none,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    keepPrimary: true,
    keepSecondary: true,
    keepTertiary: true,
    keepPrimaryContainer: true,
    keepSecondaryContainer: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
  fontFamily: GoogleFonts.nunito().fontFamily,
);

final dartTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xff274472),
    primaryContainer: Color(0xff41729f),
    secondary: Color(0xff122035),
    secondaryContainer: Color(0xffff8000),
    tertiary: Color(0xff8a9cbb),
    tertiaryContainer: Color(0xff000000),
    appBarColor: Color(0xffc3e0e5),
    error: Color(0xffcf6679),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 57),
    displayMedium: TextStyle(fontSize: 45),
    displaySmall: TextStyle(fontSize: 36),
    headlineLarge: TextStyle(fontSize: 32),
    headlineMedium: TextStyle(fontSize: 28),
    headlineSmall: TextStyle(fontSize: 26),
    titleLarge: TextStyle(fontSize: 24),
    titleMedium: TextStyle(fontSize: 18),
    titleSmall: TextStyle(fontSize: 16),
    bodyLarge: TextStyle(fontSize: 18),
    bodyMedium: TextStyle(fontSize: 16),
    bodySmall: TextStyle(fontSize: 14),
  ),
  subThemesData: const FlexSubThemesData(
    interactionEffects: false,
    tintedDisabledControls: false,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    inputDecoratorUnfocusedBorderIsColored: false,
    chipRadius: 20.0,
    tooltipRadius: 4.0,
    tooltipSchemeColor: SchemeColor.inverseSurface,
    tooltipOpacity: 0.9,
    snackBarElevation: 6.0,
    snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationBarIndicatorOpacity: 1.00,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailLabelType: NavigationRailLabelType.none,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    keepPrimary: true,
    keepSecondary: true,
    keepTertiary: true,
    keepPrimaryContainer: true,
    keepSecondaryContainer: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
  fontFamily: GoogleFonts.nunito().fontFamily,
);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/values/values.dart';

class AppTheme {
  static const _lightFillColor = Colors.black;

  static final Color _lightFocusColor = Colors.black12;

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: AppColors.white),
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      hintColor: colorScheme.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      focusColor: AppColors.primaryColor,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    surface: Color(0xFFFAFBFB),
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  // static const _superBold = FontWeight.w900;
  static const _bold = FontWeight.w700;
  // static const _semiBold = FontWeight.w600;
  // static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.gloriaHallelujah(
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    displayMedium: GoogleFonts.ibmPlexMono(
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: GoogleFonts.ibmPlexMono(
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineLarge: GoogleFonts.ibmPlexMono(
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: GoogleFonts.ibmPlexMono(
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: GoogleFonts.ibmPlexMono(
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: GoogleFonts.ibmPlexMono(
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: GoogleFonts.ibmPlexMono(
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: GoogleFonts.ibmPlexMono(
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: GoogleFonts.lato(
      color: AppColors.primaryText2,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: GoogleFonts.lato(
      color: AppColors.primaryText2,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: GoogleFonts.lato(
      color: AppColors.primaryText1,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: GoogleFonts.lato(
      color: AppColors.black,
      fontStyle: FontStyle.normal,
      fontWeight: _regular,
    ),
    labelMedium: GoogleFonts.ibmPlexMono(
      color: AppColors.black,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    labelSmall: GoogleFonts.ibmPlexMono(
      color: AppColors.primaryText1,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
  );
}

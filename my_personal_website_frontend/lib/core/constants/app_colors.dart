import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  static final GlobalColors colors = GlobalColors();
  static final DarkTheme dark = DarkTheme();
}

class GlobalColors {
  // Global colors
  final Color white = const Color(0xFFFFFFFF);
  final Color black = const Color(0xFF000000);
  final Color darkVoid = const Color(0xFF141516);
  final Color desertedPath = const Color(0xFFD38F11);
  final Color pimentoRed = const Color(0xFFFF6944);
  final Color blueDiamond = const Color(0xFF0A66C2);
  final Color amalfitanAzure = const Color(0xFF003A9B);
  final Color minstrelOfTheWoods = const Color(0xFF108A00);
}

abstract class BaseTheme {
  Color get primary;
  Color get backgroundPrimary;
  Color get linkedIn;
  Color get indeed;
  Color get github;
  Color get upwork;
  Color get error;
}

class DarkTheme extends BaseTheme {
  @override
  final Color primary = AppColors.colors.desertedPath;
  @override
  final Color backgroundPrimary = AppColors.colors.darkVoid;
  @override
  final Color linkedIn = AppColors.colors.blueDiamond;
  @override
  final Color indeed = AppColors.colors.amalfitanAzure;
  @override
  final Color github = AppColors.colors.white;
  @override
  final Color upwork = AppColors.colors.minstrelOfTheWoods;
  @override
  final Color error = AppColors.colors.pimentoRed;
}

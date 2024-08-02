import 'package:flutter/material.dart';

class AppColors {
  // global colors
  static const Color blackSatinDeep = Color(0xFF0E0C18);
  static const Color whiteSolid = Color(0xFFFFFFFF);
  static const Color whiteTitanium = Color(0xFFCBCBDD);
  static const Color yellowColombianGold = Color(0xFFA2A360);
  static const Color greenCalliste = Color(0xFF5B574B);
  static LightTheme get light => LightTheme();
  static DarkTheme get dark => DarkTheme();
}

class LightTheme {
  final Color primaryColor1 = AppColors.greenCalliste;
  final Color primaryColor2 = AppColors.yellowColombianGold;
  final Color primaryColor3 = AppColors.whiteTitanium;
  final Color primaryColor4 = AppColors.whiteSolid;
}

class DarkTheme {
  final Color appBackground = AppColors.blackSatinDeep;
  final Color headlineText = AppColors.whiteSolid;
  final Color bodyText = AppColors.whiteTitanium;
  final Color primaryColor1 = AppColors.greenCalliste;
  final Color primaryColor2 = AppColors.yellowColombianGold;
  final Color primaryColor3 = AppColors.whiteTitanium;
  final Color primaryColor4 = AppColors.whiteSolid;
}

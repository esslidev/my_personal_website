import 'package:flutter/material.dart';

class AppColors {
  // global colors
  static const Color blackSatinDeep = Color(0xFF1C1C20);
  static const Color whiteSolid = Color(0xFFFFFFFF);
  static const Color whiteTitanium = Color(0xFFE3E3E4);
  static const Color yellowColombianGold = Color(0xFF97985D);
  static const Color greenCalliste = Color(0xFF5B574B);
  static LightTheme get light => LightTheme();
  static DarkTheme get dark => DarkTheme();
}

class LightTheme {
  final Color primaryColor1 = AppColors.greenCalliste;
  final Color primaryColor2 = AppColors.yellowColombianGold;
  final Color primaryColor3 = AppColors.whiteTitanium;
}

class DarkTheme {
  final Color appBackground = AppColors.blackSatinDeep;
  final Color headlineText = AppColors.whiteSolid;
  final Color bodyText = AppColors.whiteTitanium;
  final Color primaryColor1 = AppColors.greenCalliste;
  final Color primaryColor2 = AppColors.yellowColombianGold;
  final Color primaryColor3 = AppColors.whiteTitanium;
}

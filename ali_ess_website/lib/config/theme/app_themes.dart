import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AppThemes {
  // Add more text styles as needed...
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black, // Set your primary color
    fontFamily: 'barlow-condensed',
    scaffoldBackgroundColor: AppColors.dark.appBackground,
  );

  static const TextStyle headline = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.whiteSolid,
  );
  static TextStyle secondaryHeadline = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.dark.bodyText,
  );

  static TextStyle bodyText =
      TextStyle(color: AppColors.dark.bodyText, fontWeight: FontWeight.w400);
}

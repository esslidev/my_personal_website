import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AppTheme {
  // Add more text styles as needed...
  static ThemeData themeData = ThemeData(
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.colors.black, // Background color of the tooltip
        borderRadius: BorderRadius.circular(2), // Optional: rounded corners
      ),
      textStyle: TextStyle(
        color: AppColors.colors.white, // Text color inside the tooltip
        fontSize: 14, // Optional: font size
      ),
    ),
    brightness: Brightness.dark,
    fontFamily: 'public_sans',
    scaffoldBackgroundColor: AppColors.dark.backgroundPrimary,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColors.dark.primary.withValues(alpha: 0.4),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(
        AppColors.dark.primary.withValues(alpha: 0.6),
      ),
    ),
  );

  static TextStyle headline = TextStyle(
    fontFamily: 'dm_serif_display',
    fontWeight: FontWeight.w500,
    color: AppColors.colors.white,
  );

  static TextStyle bodyText = TextStyle(
    color: AppColors.colors.white,
    fontWeight: FontWeight.w400,
  );
}

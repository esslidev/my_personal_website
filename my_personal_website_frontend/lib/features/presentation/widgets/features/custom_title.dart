import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../common/custom_field.dart';
import '../common/custom_line.dart';
import '../common/custom_text.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final bool? isSubTitle;
  const CustomTitle({super.key, required this.title, this.isSubTitle = false});

  Widget _buildCustomText(BuildContext context, {bool? isMobileScreen}) {
    ResponsiveSizeAdapter r = ResponsiveSizeAdapter(context);
    return CustomField(
      maxWidth: isMobileScreen == true ? r.size(300) : null,
      crossAxisAlignment: CrossAxisAlignment.center,
      gap: r.size(8),
      arrangement: FieldArrangement.row,
      children: [
        if (isSubTitle != true)
          CustomLine(
            color: AppColors.colors.white.withValues(alpha: .6),
            thickness: r.size(.4),
            size: r.size(18),
          ),
        Expanded(
          flex: isMobileScreen == true ? 1 : 0,
          child: CustomText(
            text: title.toUpperCase(),
            fontSize: isSubTitle == true ? r.size(8) : r.size(9),
            letterSpacing: r.size(4),
            color: isSubTitle == true ? null : AppColors.dark.primary,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      fallbackScreen: _buildCustomText(context),
      screenMobile: _buildCustomText(context, isMobileScreen: true),
    );
  }
}

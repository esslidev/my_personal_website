import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_text.dart';
import '../../../widgets/common/custom_field.dart';

class FooterComponent extends StatefulWidget {
  const FooterComponent({super.key});

  @override
  State<FooterComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<FooterComponent> {
  late ResponsiveSizeAdapter R;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);

    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return CustomField(
        arrangement: FieldArrangement.column,
        width: double.infinity,
        backgroundColor: AppColors.dark.primaryColor1.withOpacity(0.1),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.symmetric(vertical: R.size(80)),
        gap: R.size(20),
        children: [
          IntrinsicWidth(
            child: CustomText(
              text: 'SOCIAL PRESENCE',
              fontSize: R.size(80),
              letterSpacing: R.size(6),
              fontWeight: FontWeight.w700,
              color: AppColors.dark.primaryColor2.withOpacity(0.6),
            ),
          ),
          IntrinsicWidth(
            child: CustomField(
                arrangement: FieldArrangement.row,
                gap: R.size(60),
                children: [
                  CustomButton(
                    svgIconPath: AppPaths.vectors.githubIcon,
                    iconColor: AppColors.light.primaryColor3,
                    backgroundColor: AppColors.light.primaryColor1,
                    width: R.size(60),
                    height: R.size(60),
                    iconWidth: R.size(36),
                  ),
                  CustomButton(
                    svgIconPath: AppPaths.vectors.linkedinIcon,
                    iconColor: AppColors.light.primaryColor3,
                    backgroundColor: AppColors.light.primaryColor1,
                    width: R.size(60),
                    height: R.size(60),
                    iconWidth: R.size(30),
                  ),
                  CustomButton(
                    svgIconPath: AppPaths.vectors.upworkIcon,
                    iconColor: AppColors.light.primaryColor3,
                    backgroundColor: AppColors.light.primaryColor1,
                    width: R.size(60),
                    height: R.size(60),
                    iconWidth: R.size(36),
                  )
                ]),
          )
        ]);
  }
}

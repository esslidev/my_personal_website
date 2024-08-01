import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_field.dart';

class NavigatorComponent extends StatefulWidget {
  const NavigatorComponent({super.key});

  @override
  State<NavigatorComponent> createState() => _NavigatorComponentState();
}

class _NavigatorComponentState extends State<NavigatorComponent> {
  late ResponsiveSizeAdapter R;

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
        arrangement: FieldArrangement.row,
        mainAxisAlignment: MainAxisAlignment.start,
        gap: R.size(60),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'Dashboard',
            textSize: R.size(16),
            fontWeight: FontWeight.w400,
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'About me',
            textSize: R.size(16),
            fontWeight: FontWeight.w400,
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'My portfolio',
            textSize: R.size(16),
            fontWeight: FontWeight.w400,
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'My blog',
            textSize: R.size(16),
            fontWeight: FontWeight.w400,
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'Contact me',
            textSize: R.size(16),
            fontWeight: FontWeight.w400,
          ),
        ]);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_text.dart';
import '../../../widgets/common/custom_field.dart';

class EducationComponent extends StatefulWidget {
  const EducationComponent({super.key});

  @override
  State<EducationComponent> createState() => _EducationComponentState();
}

class _EducationComponentState extends State<EducationComponent> {
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
          CustomText(
            text: 'EDUCATION',
            fontSize: R.size(80),
            letterSpacing: R.size(6),
            fontWeight: FontWeight.w700,
            color: AppColors.dark.primaryColor2.withOpacity(0.6),
          ),
          CustomField(
              arrangement: FieldArrangement.row, gap: R.size(60), children: [])
        ]);
  }
}

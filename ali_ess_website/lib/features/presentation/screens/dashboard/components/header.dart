import 'package:ali_ess_website/features/presentation/screens/dashboard/components/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/resources/custom_dropdown_menu_item.dart';
import '../../../../../core/resources/drop_down_style.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_text_field.dart';
import '../../../widgets/common/custom_field.dart';

class HeaderComponent extends StatefulWidget {
  const HeaderComponent({super.key});

  @override
  State<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppPaths.vectors.logo,
            height: R.size(50),
          ),
          const NavigatorComponent()
        ]);
  }
}

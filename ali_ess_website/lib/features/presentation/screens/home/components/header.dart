import 'package:ali_ess_website/features/presentation/screens/home/components/navigator.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/events_util.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_display.dart';
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
        padding:
            EdgeInsets.symmetric(vertical: R.size(50), horizontal: R.size(150)),
        children: [
          CustomDisplay(
            assetPath: AppPaths.vectors.logo,
            isSvg: true,
            height: R.size(50),
            onTap: () {
              EventsUtil.routeEvents
                  .updatePath(context, AppPaths.routes.dashboardScreen);
              Beamer.of(context).beamToNamed(AppPaths.routes.dashboardScreen);
            },
          ),
          const NavigatorComponent()
        ]);
  }
}

import 'package:ali_ess_website/core/constants/app_colors.dart';
import 'package:ali_ess_website/core/constants/app_paths.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/events_util.dart';
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
            textSize: R.size(18),
            textColor: AppColors.dark.primaryColor3,
            fontWeight: FontWeight.w400,
            onHoverStyle: CustomButtonStyle(
              textColor: AppColors.dark.primaryColor4,
            ),
            onPressed: () {
              EventsUtil.routeEvents
                  .updatePath(context, AppPaths.routes.dashboardScreen);
              Beamer.of(context).beamToNamed(AppPaths.routes.dashboardScreen);
            },
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'About me',
            textSize: R.size(18),
            fontWeight: FontWeight.w400,
            textColor: AppColors.dark.primaryColor3,
            onHoverStyle: CustomButtonStyle(
              textColor: AppColors.dark.primaryColor4,
            ),
            onPressed: () {
              EventsUtil.routeEvents
                  .updatePath(context, AppPaths.routes.aboutMeScreen);
              Beamer.of(context).beamToNamed(AppPaths.routes.aboutMeScreen);
            },
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'My portfolio',
            textSize: R.size(18),
            fontWeight: FontWeight.w400,
            textColor: AppColors.dark.primaryColor3,
            onHoverStyle: CustomButtonStyle(
              textColor: AppColors.dark.primaryColor4,
            ),
            onPressed: () {
              EventsUtil.routeEvents
                  .updatePath(context, AppPaths.routes.myPortfolioScreen);
              Beamer.of(context).beamToNamed(AppPaths.routes.myPortfolioScreen);
            },
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'My blog',
            textSize: R.size(16),
            fontWeight: FontWeight.w400,
            textColor: AppColors.dark.primaryColor3,
            onHoverStyle: CustomButtonStyle(
              textColor: AppColors.dark.primaryColor4,
            ),
            onPressed: () {
              EventsUtil.routeEvents
                  .updatePath(context, AppPaths.routes.myBlogScreen);
              Beamer.of(context).beamToNamed(AppPaths.routes.myBlogScreen);
            },
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'Contact me',
            textSize: R.size(16),
            fontWeight: FontWeight.w400,
            textColor: AppColors.dark.primaryColor3,
            onHoverStyle: CustomButtonStyle(
              textColor: AppColors.dark.primaryColor4,
            ),
            onPressed: () {
              EventsUtil.routeEvents
                  .updatePath(context, AppPaths.routes.contactMeScreen);
              Beamer.of(context).beamToNamed(AppPaths.routes.contactMeScreen);
            },
          ),
        ]);
  }
}

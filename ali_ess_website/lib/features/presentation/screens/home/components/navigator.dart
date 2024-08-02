import 'package:ali_ess_website/core/constants/app_colors.dart';
import 'package:ali_ess_website/core/constants/app_paths.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/events_util.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../../../core/util/route_path_service.dart';
import '../../../../../locator.dart';
import '../../../bloc/app_blocs/route/route_bloc.dart';
import '../../../bloc/app_blocs/route/route_state.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_field.dart';

class NavigatorComponent extends StatefulWidget {
  const NavigatorComponent({super.key});

  @override
  State<NavigatorComponent> createState() => _NavigatorComponentState();
}

class _NavigatorComponentState extends State<NavigatorComponent> {
  late ResponsiveSizeAdapter R;
  final RoutePathService routePathService = locator<RoutePathService>();

  int _selectedIndex = 0;
  final List<double> _rectanglePositions = [
    16,
    142,
    264,
    396,
    500
  ]; // Example positions
  final List<double> _rectangleWidths = [70, 64, 74, 50, 66]; // Example widths

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);

    return BlocListener<AppRouteBloc, AppRouteState>(
      listener: (context, state) {
        if (state is AppRoutePathUpdated) {
          setState(() {
            if (routePathService.currentPath == AppPaths.routes.aboutMeScreen) {
              _selectedIndex = 1;
            } else if (routePathService.currentPath ==
                AppPaths.routes.myPortfolioScreen) {
              _selectedIndex = 2;
            } else if (routePathService.currentPath ==
                AppPaths.routes.myBlogScreen) {
              _selectedIndex = 3;
            } else if (routePathService.currentPath ==
                AppPaths.routes.contactMeScreen) {
              _selectedIndex = 4;
            } else {
              _selectedIndex = 0;
            }
          });
        }
      },
      child: ResponsiveScreenAdapter(
        defaultScreen: _buildDesktop(context),
        screenDesktop: _buildDesktop(context),
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Stack(
      children: [
        // Rectangle behind buttons
        AnimatedPositioned(
          left: R.size(_rectanglePositions[_selectedIndex]),
          duration: 400.ms,
          curve: Curves.decelerate,
          child: AnimatedContainer(
            duration: 400.ms,
            curve: Curves.decelerate,
            width: R.size(_rectangleWidths[_selectedIndex]),
            height: R.size(80),
            color: AppColors.dark.primaryColor1.withOpacity(0.6),
          ),
        ),
        CustomField(
          arrangement: FieldArrangement.row,
          mainAxisAlignment: MainAxisAlignment.start,
          gap: R.size(60),
          crossAxisAlignment: CrossAxisAlignment.center,
          padding: EdgeInsets.symmetric(horizontal: R.size(10)),
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
                Beamer.of(context)
                    .beamToNamed(AppPaths.routes.myPortfolioScreen);
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
          ],
        ),
      ],
    );
  }
}

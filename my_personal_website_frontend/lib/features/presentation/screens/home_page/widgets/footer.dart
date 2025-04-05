import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/util/app_util.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_field.dart';
import '../../../widgets/common/custom_line.dart';
import '../../../widgets/common/custom_text.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  late ResponsiveSizeAdapter r;

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
  }

  Widget _buildToTopButton() {
    return CustomButton(
      svgIconPath: AppPaths.vectors.arrowTopIcon,
      iconHeight: r.size(9),
      iconColor: AppColors.colors.white,
      width: r.size(26),
      height: r.size(26),
      border: Border.all(color: AppColors.colors.white, width: r.size(.2)),
      animationDuration: 200.ms,
      onHoverStyle: CustomButtonStyle(
        iconColor: AppColors.dark.backgroundPrimary,
        backgroundColor: AppColors.colors.white,
      ),
      onPressed: (position, size) {
        AppUtil.scrollToTop(context);
      },
    );
  }

  Widget _buildFooter(BuildContext context, {bool? isDesktopTabletScreen}) {
    return CustomField(
      gap: r.size(4),
      padding: r.only(
        bottom: 60,
        left: isDesktopTabletScreen == true ? 40 : 160,
        right: isDesktopTabletScreen == true ? 40 : 160,
      ),
      children: [
        CustomLine(size: double.infinity, thickness: r.size(.2)),
        CustomField(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          arrangement: FieldArrangement.row,
          children: [
            CustomField(
              gap: r.size(6),
              crossAxisAlignment: CrossAxisAlignment.center,
              arrangement: FieldArrangement.row,
              children: [
                CustomText(
                  text: 'Copyright © 2025',
                  fontSize: r.size(8),
                  fontWeight: FontWeight.w200,
                  color: AppColors.colors.white.withValues(alpha: .4),
                ),
                CustomLine(
                  size: r.size(8),
                  thickness: r.size(.2),
                  isVertical: true,
                ),
                CustomField(
                  arrangement: FieldArrangement.row,
                  children: [
                    CustomText(
                      text: 'Designed and developed by ',
                      fontSize: r.size(8),
                      fontWeight: FontWeight.w200,
                      color: AppColors.colors.white.withValues(alpha: .4),
                    ),
                    CustomText(
                      text: 'Ali Salem Essouiah',
                      fontSize: r.size(8),
                      fontWeight: FontWeight.w300,
                      color: AppColors.dark.primary.withValues(alpha: .8),
                    ),
                  ],
                ),
              ],
            ),
            _buildToTopButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterOnMobileScreen(BuildContext context) {
    return CustomField(
      gap: r.size(4),
      padding: r.only(bottom: 30, left: 20, right: 20),
      children: [
        CustomLine(size: double.infinity, thickness: r.size(.2)),
        CustomField(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          arrangement: FieldArrangement.row,
          children: [
            CustomField(
              crossAxisAlignment: CrossAxisAlignment.start,
              arrangement: FieldArrangement.column,
              children: [
                CustomText(
                  text: 'Copyright © 2025',
                  fontSize: r.size(8),
                  fontWeight: FontWeight.w200,
                  color: AppColors.colors.white.withValues(alpha: .4),
                ),
                CustomText(
                  text: 'Designed and developed by ',
                  fontSize: r.size(8),
                  fontWeight: FontWeight.w200,
                  color: AppColors.colors.white.withValues(alpha: .4),
                ),
                CustomText(
                  text: 'Ali Salem Essouiah',
                  fontSize: r.size(8),
                  fontWeight: FontWeight.w300,
                  color: AppColors.dark.primary.withValues(alpha: .8),
                ),
              ],
            ),
            _buildToTopButton(),
          ],
        ),
      ],
    );
  }

  //----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      fallbackScreen: _buildFooter(context),
      screenDesktop: _buildFooter(context, isDesktopTabletScreen: true),
      screenTablet: _buildFooter(context, isDesktopTabletScreen: true),
      screenMobile: _buildFooterOnMobileScreen(context),
    );
  }
}

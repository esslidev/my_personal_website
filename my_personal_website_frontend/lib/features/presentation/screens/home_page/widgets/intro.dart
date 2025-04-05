import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/util/app_util.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_field.dart';
import '../../../widgets/common/custom_text.dart';
import '../../../widgets/features/custom_title.dart';
import 'solar_system.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  late ResponsiveSizeAdapter r;

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
  }

  Widget _buildIntroText({double? fontSize, double? maxWidth}) {
    return CustomText(
      maxWidth: maxWidth ?? r.size(450),
      text:
          'I am Ali Salem, a Systems Architect & full-stack developer working remotely from anywhere.',
      fontFamily: 'dm_serif_display',
      fontSize: fontSize ?? r.size(46),
    );
  }

  Widget _buildSocialButton({
    required String name,
    required String path,
    required Color color,
    bool isHorizontal = false,
  }) {
    return RotatedBox(
      quarterTurns: isHorizontal == true ? 0 : 3,
      child: CustomButton(
        text: name.toUpperCase(),
        fontSize: isHorizontal == true ? r.size(9) : r.size(6),
        letterSpacing: r.size(2),
        textColor: AppColors.colors.white.withValues(alpha: .3),
        animationDuration: 200.ms,
        onHoverStyle: CustomButtonStyle(textColor: color),
        onPressed: (position, size) {
          AppUtil.launchURL(path);
        },
      ),
    );
  }

  Widget _buildSocialButtons({bool? isCompact}) {
    return CustomField(
      gap: r.size(12),
      isWrap: isCompact == true,
      wrapVerticalSpacing: isCompact == true ? r.size(12) : 0,
      wrapHorizontalSpacing: isCompact == true ? r.size(12) : 0,
      arrangement:
          isCompact == true ? FieldArrangement.row : FieldArrangement.column,
      children: [
        _buildSocialButton(
          name: 'github',
          path: githubPath,
          color: AppColors.dark.github,
          isHorizontal: isCompact == true,
        ),
        _buildSocialButton(
          name: 'indeed',
          path: indeedPath,
          color: AppColors.dark.indeed,
          isHorizontal: isCompact == true,
        ),
        _buildSocialButton(
          name: 'linkedin',
          path: linkedInPath,
          color: AppColors.dark.linkedIn,
          isHorizontal: isCompact == true,
        ),
        _buildSocialButton(
          name: 'upwork',
          path: upworkPath,
          color: AppColors.dark.upwork,
          isHorizontal: isCompact == true,
        ),
      ],
    );
  }

  Widget _buildIntro(
    BuildContext context, {
    bool? isDesktopScreen,
    bool? isTabletScreen,
    bool? isMobileScreen,
  }) {
    return Stack(
      children: [
        Positioned(
          right:
              isTabletScreen == true || isMobileScreen == true
                  ? -r.size(240)
                  : -r.size(200),
          top: r.size(40),
          child: SolarSystem(
            size:
                isTabletScreen == true || isMobileScreen == true
                    ? r.screenHeight / 1.2
                    : r.screenHeight - r.size(90),
          ),
        ),
        CustomField(
          minHeight:
              isTabletScreen == true || isMobileScreen == true
                  ? r.screenHeight - r.size(30)
                  : r.screenHeight - r.size(60),
          gap: r.size(12),
          padding: r.only(
            top: 90,
            left:
                isDesktopScreen == true
                    ? 40
                    : isTabletScreen == true || isMobileScreen == true
                    ? 20
                    : 100,
            right: 20,
            bottom: 60,
          ),
          mainAxisAlignment:
              isTabletScreen == true || isMobileScreen == true
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
              isTabletScreen == true || isMobileScreen == true
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
          arrangement:
              isTabletScreen == true || isMobileScreen == true
                  ? FieldArrangement.column
                  : FieldArrangement.row,
          children: [
            CustomField(
              children: [
                CustomTitle(title: 'Hello World'),
                _buildIntroText(
                  fontSize:
                      isDesktopScreen == true
                          ? r.size(36)
                          : isTabletScreen == true
                          ? r.size(38)
                          : isMobileScreen == true
                          ? r.size(26)
                          : null,
                  maxWidth:
                      isDesktopScreen == true
                          ? r.size(400)
                          : isTabletScreen == true
                          ? r.size(350)
                          : null,
                ),
              ],
            ),
            _buildSocialButtons(
              isCompact: isTabletScreen == true || isMobileScreen == true,
            ),
          ],
        ),
      ],
    );
  }

  //----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      fallbackScreen: _buildIntro(context),
      screenDesktop: _buildIntro(context, isDesktopScreen: true),
      screenTablet: _buildIntro(context, isTabletScreen: true),
      screenMobile: _buildIntro(context, isMobileScreen: true),
    );
  }
}

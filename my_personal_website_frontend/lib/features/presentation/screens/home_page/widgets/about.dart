import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/util/app_util.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_display.dart';
import '../../../widgets/common/custom_field.dart';
import '../../../widgets/common/custom_text.dart';
import '../../../widgets/features/custom_title.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  late ResponsiveSizeAdapter r;

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
  }

  Widget _buildText({double? fontSize}) {
    return CustomText(
      text:
          "I'm Ali Salem Essouiah, a full-stack developer specializing in Flutter and the MERN stack, with over 4 years of experience. I excel in web and mobile development, and software architecture, using clean architecture and modern frameworks.\nPassionate about innovation and problem-solving, I integrate AI, optimize backend systems, and build scalable applications. Whether it’s crafting React.js interfaces or architecting Flutter apps with BLoC, I deliver efficient, high-quality solutions.",
      fontSize: fontSize ?? r.size(11),
      fontWeight: FontWeight.w100,
      lineHeight: r.size(1),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildButton({required String text, required String urlPath}) {
    return CustomButton(
      text: text.toUpperCase(),
      fontSize: r.size(7),
      fontWeight: FontWeight.w500,
      textColor: AppColors.dark.primary,
      letterSpacing: r.size(2),
      useIntrinsicWidth: false,
      backgroundColor: AppColors.colors.white.withValues(alpha: .1),
      padding: r.symmetric(vertical: 12),
      animationDuration: 200.ms,
      onHoverStyle: CustomButtonStyle(
        textColor: AppColors.dark.backgroundPrimary,
        backgroundColor: AppColors.colors.white,
      ),
      onPressed: (position, size) {
        AppUtil.launchURL(urlPath);
      },
    );
  }

  Widget _buildAbout(
    BuildContext context, {
    bool? isDesktopScreen,
    bool? isTabletScreen,
    bool? isMobileScreen,
  }) {
    return Padding(
      padding: r.only(
        top: 60,
        bottom: 30,
        left:
            isDesktopScreen == true
                ? 40
                : isTabletScreen == true || isMobileScreen == true
                ? 20
                : 140,
        right:
            isDesktopScreen == true
                ? 40
                : isTabletScreen == true || isMobileScreen == true
                ? 20
                : 140,
      ),
      child: Stack(
        children: [
          Padding(
            padding: r.only(right: 330),
            child: CustomDisplay(
              assetPath: AppPaths.images.myPersonalImage,
              height: r.size(430),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: CustomField(
              gap: r.size(16),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTitle(title: 'About'),
                CustomField(
                  gap: r.size(12),
                  maxWidth: r.size(340),
                  padding: r.only(left: 30),
                  children: [
                    _buildText(
                      fontSize: isDesktopScreen == true ? r.size(9) : null,
                    ),
                    _buildButton(text: 'Hire Me Now', urlPath: linkedInPath),
                    _buildButton(
                      text: 'Download CV',
                      urlPath: 'https://cv.aliess.me',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutOnTabletMobile(
    BuildContext context, {
    bool? isMobileScreen,
  }) {
    return CustomField(
      gap: r.size(24),
      padding: r.only(
        top: 30,
        bottom: 30,
        left: isMobileScreen == true ? 20 : 40,
        right: isMobileScreen == true ? 20 : 40,
      ),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDisplay(
          assetPath: AppPaths.images.myPersonalImage,
          width: double.infinity,
        ),
        CustomField(
          gap: r.size(16),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTitle(title: 'About'),
            _buildText(
              fontSize: isMobileScreen == true ? r.size(9) : r.size(11),
            ),
            _buildButton(text: 'Hire Me Now', urlPath: linkedInPath),
            _buildButton(text: 'Download CV', urlPath: 'https://cv.aliess.me'),
          ],
        ),
      ],
    );
  }

  //----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      fallbackScreen: _buildAbout(context),
      screenDesktop: _buildAbout(context, isDesktopScreen: true),
      screenTablet: _buildAboutOnTabletMobile(context),
      screenMobile: _buildAboutOnTabletMobile(context, isMobileScreen: true),
    );
  }
}

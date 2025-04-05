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

class GetInTouch extends StatefulWidget {
  const GetInTouch({super.key});

  @override
  State<GetInTouch> createState() => _GetInTouchState();
}

class _GetInTouchState extends State<GetInTouch> {
  late ResponsiveSizeAdapter r;

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
  }

  Widget _buildText({double? fontSize}) {
    return CustomText(
      text:
          "I’d love to hear from you! Whether it’s a project idea or just a hello, feel free to reach out. Let’s create something great together!",
      fontFamily: 'dm_serif_display',
      fontSize: fontSize ?? r.size(26),
    );
  }

  Widget _buildUrlLauncher({
    required String name,
    required String path,
    Color? hoverColor,
  }) {
    return CustomButton(
      text: name,
      fontSize: r.size(11),
      textColor: AppColors.colors.white.withValues(alpha: .3),
      fontWeight: FontWeight.w300,
      animationDuration: 200.ms,
      onHoverStyle: CustomButtonStyle(
        textColor: hoverColor ?? AppColors.dark.primary,
      ),
      onPressed: (position, size) {
        AppUtil.launchURL(path);
      },
    );
  }

  Widget _buildReachMeAt() {
    return CustomField(
      gap: r.size(8),
      children: [
        CustomText(
          text: 'Reach me at'.toUpperCase(),
          fontSize: r.size(9),
          letterSpacing: r.size(3),
        ),
        CustomField(
          gap: r.size(5),
          children: [
            _buildUrlLauncher(name: email, path: 'mailto:$email'),
            _buildUrlLauncher(
              name: AppUtil.formatPhoneNumber(telephone),
              path: 'tel:$telephone',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocial() {
    return CustomField(
      gap: r.size(8),
      children: [
        CustomText(
          text: 'Social'.toUpperCase(),
          fontSize: r.size(8),
          letterSpacing: r.size(3),
        ),
        CustomField(
          maxWidth: r.size(140),
          isWrap: true,
          wrapVerticalSpacing: r.size(5),
          wrapHorizontalSpacing: r.size(5),
          arrangement: FieldArrangement.row,
          children: [
            _buildUrlLauncher(
              name: 'Github,',
              path: githubPath,
              hoverColor: AppColors.dark.github,
            ),
            _buildUrlLauncher(
              name: 'Indeed,',
              path: indeedPath,
              hoverColor: AppColors.dark.indeed,
            ),
            _buildUrlLauncher(
              name: 'LinkedIn,',
              path: linkedInPath,
              hoverColor: AppColors.dark.linkedIn,
            ),
            _buildUrlLauncher(
              name: 'Upwork',
              path: upworkPath,
              hoverColor: AppColors.dark.upwork,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSayHelloButton() {
    return CustomButton(
      text: 'Say Hello.'.toUpperCase(),
      fontSize: r.size(7),
      fontWeight: FontWeight.w500,
      textColor: AppColors.dark.primary,
      letterSpacing: r.size(2),
      backgroundColor: AppColors.colors.white.withValues(alpha: .1),
      padding: r.symmetric(vertical: 12, horizontal: 62),
      animationDuration: 200.ms,
      onHoverStyle: CustomButtonStyle(
        textColor: AppColors.dark.backgroundPrimary,
        backgroundColor: AppColors.colors.white,
      ),
      onPressed: (position, size) {
        AppUtil.launchURL(
          'https://mail.google.com/mail/?view=cm&fs=1&to=$email&su=&cc=&bcc=&body=',
        );
      },
    );
  }

  Widget _buildGetInTouch(
    BuildContext context, {
    bool? isDesktopScreen,
    bool? isTabletScreen,
    bool? isMobileScreen,
  }) {
    return CustomField(
      gap: r.size(36),
      padding: r.only(
        top: 60,
        bottom: 90,
        left:
            isDesktopScreen == true
                ? 40
                : isTabletScreen == true || isMobileScreen == true
                ? 20
                : 180,
        right:
            isDesktopScreen == true
                ? 40
                : isTabletScreen == true || isMobileScreen == true
                ? 20
                : 180,
      ),
      children: [
        CustomField(
          gap: r.size(12),
          children: [
            CustomTitle(title: 'Get In Touch'),
            _buildText(
              fontSize:
                  isTabletScreen == true
                      ? r.size(18)
                      : isMobileScreen == true
                      ? r.size(12)
                      : null,
            ),
          ],
        ),
        CustomField(
          gap: r.size(24),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          arrangement:
              isTabletScreen == true || isMobileScreen == true
                  ? FieldArrangement.column
                  : FieldArrangement.row,
          children: [
            CustomField(
              gap: isMobileScreen == true ? r.size(24) : r.size(64),
              mainAxisSize: MainAxisSize.min,
              arrangement:
                  isMobileScreen == true
                      ? FieldArrangement.column
                      : FieldArrangement.row,
              children: [_buildReachMeAt(), _buildSocial()],
            ),
            _buildSayHelloButton(),
          ],
        ),
      ],
    );
  }

  //----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      fallbackScreen: _buildGetInTouch(context),
      screenDesktop: _buildGetInTouch(context, isDesktopScreen: true),
      screenTablet: _buildGetInTouch(context, isTabletScreen: true),
      screenMobile: _buildGetInTouch(context, isMobileScreen: true),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_personal_website_frontend/core/util/app_util.dart';
import 'package:my_personal_website_frontend/features/presentation/widgets/common/custom_button.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_display.dart';
import '../../../widgets/common/custom_field.dart';
import '../../../widgets/common/custom_text.dart';
import '../../../widgets/features/custom_title.dart';

class PortfolioProject {
  final String imagePath;
  final String? prjectUrl;
  final String title;
  final List<String> techs;
  final String description;
  const PortfolioProject({
    required this.imagePath,
    this.prjectUrl,
    required this.title,
    required this.techs,
    required this.description,
  });
}

class Portfolio extends StatefulWidget {
  final List<PortfolioProject> projects;
  const Portfolio({super.key, required this.projects});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  late ResponsiveSizeAdapter r;

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
  }

  Widget _buildText({double? fontSize}) {
    return CustomText(
      text: "Check out my portfolio to get a glimpse of the work I’ve done.",
      fontFamily: 'dm_serif_display',
      fontSize: fontSize ?? r.size(18),
    );
  }

  Widget _buildUsedTechContainer({required String tech}) {
    return CustomText(
      text: tech,
      fontSize: r.size(7),
      fontWeight: FontWeight.w300,
      padding: r.symmetric(vertical: 2, horizontal: 6),
      backgroundColor: AppColors.colors.white.withValues(alpha: .1),
      borderRadius: r.size(1),
    );
  }

  Widget _buildGetLinkButton({required String projectUrl}) {
    return CustomButton(
      text: 'Get Link',
      fontSize: r.size(7),
      textColor: AppColors.colors.black,
      lineHeight: 1,
      padding: r.symmetric(vertical: 4, horizontal: 9),
      borderRadius: BorderRadius.circular(r.size(1)),
      backgroundColor: AppColors.colors.white,
      animationDuration: 200.ms,
      onPressed: (position, size) {
        AppUtil.launchURL(projectUrl);
      },
    );
  }

  Widget _buildCard({required PortfolioProject project, double? maxWidth}) {
    return CustomField(
      minHeight: r.size(380),
      maxWidth: maxWidth,
      backgroundColor: AppColors.colors.white.withValues(alpha: .05),
      width: r.size(320),
      border: Border.all(
        color: AppColors.colors.white.withValues(alpha: .2),
        width: r.size(0.6),
      ),
      borderRadius: r.size(2),
      padding: r.all(9),
      gap: r.size(18),
      children: [
        Stack(
          children: [
            CustomDisplay(
              assetPath: project.imagePath,
              width: r.size(320),
              height: r.size(180),
              borderRadius: BorderRadius.circular(r.size(2)),
              fit: BoxFit.cover,
            ),
            Positioned(
              top: r.size(4),
              left: r.size(4),
              child:
                  project.prjectUrl != null
                      ? _buildGetLinkButton(projectUrl: project.prjectUrl!)
                      : SizedBox(),
            ),
          ],
        ),
        CustomField(
          gap: r.size(9),
          children: [
            CustomField(
              gap: r.size(6),
              children: [
                CustomText(
                  text: project.title,
                  fontSize: r.size(11),
                  fontWeight: FontWeight.bold,
                  lineHeight: 1,
                ),
                CustomField(
                  isWrap: true,
                  wrapHorizontalSpacing: r.size(4),
                  wrapVerticalSpacing: r.size(4),
                  arrangement: FieldArrangement.row,
                  children:
                      project.techs.map((tech) {
                        return _buildUsedTechContainer(tech: tech);
                      }).toList(),
                ),
              ],
            ),
            CustomText(
              text: project.description,
              textAlign: TextAlign.justify,
              fontSize: r.size(9),
              fontWeight: FontWeight.w300,
              color: AppColors.colors.white.withValues(alpha: .6),
              lineHeight: 1.5,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPortfolio(
    BuildContext context, {
    bool? isDesktopScreen,
    bool? isTabletScreen,
    bool? isMobileScreen,
  }) {
    return CustomField(
      gap: r.size(32),
      padding: r.symmetric(
        vertical: 30,
        horizontal:
            isDesktopScreen == true
                ? 40
                : isTabletScreen == true || isMobileScreen == true
                ? 20
                : 140,
      ),
      children: [
        CustomField(
          gap: r.size(12),
          children: [
            CustomTitle(title: 'Portfolio'),
            _buildText(
              fontSize:
                  isDesktopScreen == true || isTabletScreen == true
                      ? r.size(16)
                      : isMobileScreen == true
                      ? r.size(13)
                      : null,
            ),
          ],
        ),
        IntrinsicHeight(
          child: CustomField(
            isWrap: true,
            mainAxisAlignment: MainAxisAlignment.center,
            width: double.infinity,
            wrapHorizontalSpacing: r.size(24),
            wrapVerticalSpacing: r.size(24),
            arrangement: FieldArrangement.row,
            children: [
              ...widget.projects.map((project) {
                return _buildCard(
                  project: project,
                  maxWidth: isDesktopScreen == true ? r.size(260) : null,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      fallbackScreen: _buildPortfolio(context),
      screenDesktop: _buildPortfolio(context, isDesktopScreen: true),
      screenTablet: _buildPortfolio(context, isTabletScreen: true),
      screenMobile: _buildPortfolio(context, isMobileScreen: true),
    );
  }
}

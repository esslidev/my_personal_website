import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_display.dart';
import '../../../widgets/common/custom_field.dart';
import '../../../widgets/common/custom_text.dart';
import '../../../widgets/features/custom_title.dart';

class Skill {
  final String name;
  final String svgPath;
  const Skill({required this.name, required this.svgPath});
}

class SkillsTechnologies extends StatefulWidget {
  final List<Skill> frontendSkills;
  final List<Skill> backendSkills;
  final List<Skill> devOpsSkills;

  const SkillsTechnologies({
    super.key,
    required this.frontendSkills,
    required this.backendSkills,
    required this.devOpsSkills,
  });

  @override
  State<SkillsTechnologies> createState() => _SkillsTechnologiesState();
}

class _SkillsTechnologiesState extends State<SkillsTechnologies> {
  late ResponsiveSizeAdapter r;

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
  }

  Widget _buildText({double? fontSize}) {
    return CustomText(
      text:
          "The tools and frameworks I leverage to turn ideas into reality and build innovative solutions.",
      fontFamily: 'dm_serif_display',
      fontSize: fontSize ?? r.size(24),
    );
  }

  Widget _buildCard({required Skill skillCard}) {
    return Tooltip(
      message: skillCard.name,
      child: CustomField(
        children: [
          CustomDisplay(
            assetPath: skillCard.svgPath,
            isSvg: true,
            backgroundColor: AppColors.colors.white.withValues(alpha: .1),
            padding: r.all(12),
            borderRadius: BorderRadius.circular(r.size(2)),
            height: r.size(28),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Skill> skillCards,
  }) {
    return CustomField(
      gap: r.size(12),
      children: [
        CustomTitle(title: title, isSubTitle: true),
        CustomField(
          wrapVerticalSpacing: r.size(14),
          wrapHorizontalSpacing: r.size(14),
          isWrap: true,
          mainAxisAlignment: MainAxisAlignment.start,
          arrangement: FieldArrangement.row,
          children: [
            ...skillCards.map((skillCard) {
              return _buildCard(skillCard: skillCard);
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillsTechnologies(
    BuildContext context, {
    bool? isDesktopScreen,
    bool? isTabletScreen,
    bool? isMobileScreen,
  }) {
    return CustomField(
      gap: r.size(32),
      padding: r.only(
        top: 30,
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
        bottom: 30,
      ),
      children: [
        CustomField(
          gap: r.size(12),
          children: [
            CustomTitle(title: 'Skills & Tech'),
            _buildText(
              fontSize:
                  isTabletScreen == true
                      ? r.size(16)
                      : isMobileScreen == true
                      ? r.size(13)
                      : null,
            ),
          ],
        ),

        CustomField(
          gap: r.size(32),
          padding: r.symmetric(
            horizontal:
                isMobileScreen == true
                    ? 0
                    : isDesktopScreen == true || isTabletScreen == true
                    ? 24
                    : 60,
          ),
          children: [
            _buildSection(title: 'Frontend', skillCards: widget.frontendSkills),
            _buildSection(title: 'Backend', skillCards: widget.backendSkills),
            _buildSection(
              title: 'DevOps & Tools',
              skillCards: widget.devOpsSkills,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      fallbackScreen: _buildSkillsTechnologies(context),
      screenDesktop: _buildSkillsTechnologies(context, isDesktopScreen: true),
      screenTablet: _buildSkillsTechnologies(context, isTabletScreen: true),
      screenMobile: _buildSkillsTechnologies(context, isMobileScreen: true),
    );
  }
}

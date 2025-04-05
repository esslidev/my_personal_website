import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/app_util.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_field.dart';
import '../../../widgets/common/custom_line.dart';
import '../../../widgets/common/custom_text.dart';
import '../../../widgets/features/custom_title.dart';

class Experience {
  final String title;
  final String companyName;
  final DateTime startDate;
  final DateTime? endDate;
  final String description;
  Experience({
    required this.title,
    required this.companyName,
    required this.startDate,
    this.endDate,
    required this.description,
  });
}

class Education {
  final String certificateName;
  final String schoolName;
  final DateTime date;
  Education({
    required this.certificateName,
    required this.schoolName,
    required this.date,
  });
}

class ExperienceEducation extends StatefulWidget {
  final List<Experience> experiences;
  final List<Education> educations;
  const ExperienceEducation({
    super.key,
    required this.experiences,
    required this.educations,
  });

  @override
  State<ExperienceEducation> createState() => _ExperienceEducationState();
}

class _ExperienceEducationState extends State<ExperienceEducation> {
  late ResponsiveSizeAdapter r;

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
  }

  Widget _buildText({double? fontSize}) {
    return CustomText(
      text:
          "Below are my experiences and educational background, showcasing my journey and expertise in full-stack development and system design.",
      fontFamily: 'dm_serif_display',
      fontSize: fontSize ?? r.size(18),
    );
  }

  Widget _buildExperienceEducationCard({
    Experience? experience,
    Education? education,
    bool isLast = false,
    double? experienceDescriptionSize,
    double? educationDescriptionSize,
  }) {
    return IntrinsicHeight(
      child: CustomField(
        gap: r.size(12),
        arrangement: FieldArrangement.row,
        children: [
          CustomField(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: 45 * (pi / 180),
                child: Container(
                  color: AppColors.dark.primary,
                  width: r.size(4),
                  height: r.size(4),
                ),
              ),
              Expanded(
                child: CustomLine(
                  thickness: r.size(.6),
                  isVertical: true,
                  color: AppColors.colors.white.withValues(alpha: .2),
                ),
              ),
            ],
          ),
          if (experience != null)
            CustomField(
              padding: isLast == true ? null : r.only(bottom: 32),
              width: experienceDescriptionSize ?? r.size(240),
              gap: r.size(12),
              children: [
                CustomField(
                  gap: r.size(6),
                  children: [
                    CustomText(
                      text: experience.title,
                      fontSize: r.size(14),
                      fontWeight: FontWeight.bold,
                      lineHeight: 1,
                    ),
                    CustomText(
                      text: experience.companyName,
                      fontSize: r.size(11),
                      color: AppColors.colors.white.withValues(alpha: .7),
                      lineHeight: 1,
                    ),
                    CustomText(
                      text:
                          '${AppUtil.formatDateToMonthYear(experience.startDate).toUpperCase()} - ${experience.endDate != null ? AppUtil.formatDateToMonthYear(experience.startDate).toUpperCase() : 'Present'.toUpperCase()}',
                      fontSize: r.size(7),
                      color: AppColors.colors.white.withValues(alpha: .3),
                      letterSpacing: r.size(1.5),
                      fontWeight: FontWeight.w300,
                      lineHeight: 1,
                    ),
                  ],
                ),
                Expanded(
                  child: CustomText(
                    text: experience.description,
                    textAlign: TextAlign.justify,
                    fontSize: r.size(9),
                    fontWeight: FontWeight.w300,
                    color: AppColors.colors.white.withValues(alpha: .4),
                    lineHeight: 1.5,
                  ),
                ),
              ],
            ),
          if (education != null)
            CustomField(
              padding: isLast == true ? null : r.only(bottom: 32),
              width: educationDescriptionSize ?? r.size(240),
              gap: r.size(12),
              children: [
                CustomField(
                  gap: r.size(6),
                  children: [
                    CustomText(
                      text: education.certificateName,
                      fontSize: r.size(14),
                      fontWeight: FontWeight.bold,
                      lineHeight: 1,
                    ),
                    CustomText(
                      text: education.schoolName,
                      fontSize: r.size(11),
                      color: AppColors.colors.white.withValues(alpha: .7),
                      lineHeight: 1,
                    ),
                    CustomText(
                      text:
                          AppUtil.formatDateToMonthYear(
                            education.date,
                          ).toUpperCase(),
                      fontSize: r.size(7),
                      color: AppColors.colors.white.withValues(alpha: .3),
                      letterSpacing: r.size(1.5),
                      fontWeight: FontWeight.w300,
                      lineHeight: 1,
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection({
    bool? isDesktopScreen,
    bool? isTabletScreen,
    bool? isMobileScreen,
  }) {
    return CustomField(
      gap: r.size(12),
      children: [
        CustomTitle(title: 'Experience', isSubTitle: true),
        CustomField(
          children:
              widget.experiences
                  .asMap()
                  .map((index, experience) {
                    return MapEntry(
                      index,
                      _buildExperienceEducationCard(
                        experience: experience,
                        isLast: index == widget.experiences.length - 1,
                        experienceDescriptionSize:
                            isDesktopScreen == true
                                ? r.size(200)
                                : isTabletScreen == true
                                ? r.size(320)
                                : isMobileScreen == true
                                ? r.size(180)
                                : null,
                      ),
                    );
                  })
                  .values
                  .toList(),
        ),
      ],
    );
  }

  Widget _buildEducationSection({
    bool? isDesktopScreen,
    bool? isTabletScreen,
    bool? isMobileScreen,
  }) {
    return CustomField(
      gap: r.size(12),
      children: [
        CustomTitle(title: 'Education', isSubTitle: true),
        CustomField(
          children:
              widget.educations
                  .asMap()
                  .map((index, education) {
                    return MapEntry(
                      index,
                      _buildExperienceEducationCard(
                        education: education,
                        isLast: index == widget.experiences.length - 1,
                        educationDescriptionSize:
                            isDesktopScreen == true
                                ? r.size(190)
                                : isTabletScreen == true
                                ? r.size(320)
                                : isMobileScreen == true
                                ? r.size(180)
                                : null,
                      ),
                    );
                  })
                  .values
                  .toList(),
        ),
      ],
    );
  }

  Widget _buildExperienceEducation(
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
            CustomTitle(title: 'Experience & Education'),
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
        CustomField(
          padding: r.symmetric(
            horizontal:
                isMobileScreen == true
                    ? 0
                    : isDesktopScreen == true || isTabletScreen == true
                    ? 12
                    : 40,
          ),
          gap: r.size(32),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          arrangement:
              isTabletScreen == true || isMobileScreen == true
                  ? FieldArrangement.column
                  : FieldArrangement.row,
          children: [
            Expanded(
              flex: isTabletScreen == true || isMobileScreen == true ? 0 : 1,
              child: _buildExperienceSection(
                isDesktopScreen: isDesktopScreen,
                isTabletScreen: isTabletScreen,
                isMobileScreen: isMobileScreen,
              ),
            ),
            Expanded(
              flex: isTabletScreen == true || isMobileScreen == true ? 0 : 1,
              child: _buildEducationSection(
                isDesktopScreen: isDesktopScreen,
                isTabletScreen: isTabletScreen,
                isMobileScreen: isMobileScreen,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      fallbackScreen: _buildExperienceEducation(context),
      screenDesktop: _buildExperienceEducation(context, isDesktopScreen: true),
      screenTablet: _buildExperienceEducation(context, isTabletScreen: true),
      screenMobile: _buildExperienceEducation(context, isMobileScreen: true),
    );
  }
}

import 'dart:async';

import 'package:ali_ess_website/features/presentation/widgets/common/custom_display.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/app_util.dart';
import '../../../../../core/util/events_util.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_field.dart';
import '../../../widgets/common/custom_text.dart';

class IntroductionComponent extends StatefulWidget {
  const IntroductionComponent({super.key});

  @override
  State<IntroductionComponent> createState() => _IntroductionComponentState();
}

class _IntroductionComponentState extends State<IntroductionComponent> {
  late ResponsiveSizeAdapter R;

  int currentIndex = 0;
  late Timer timer;
  List<String> introductionTitles = [
    'PROFESSIONAL FLUTTER DEVELOPER',
    'EXPERIENCED MERN DEVELOPER',
    'INFORMATION SYSTEMS ENGINEER',
    'UI/UX GENERALIST',
  ];

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
    // Set up the timer to change text every 4000 ms
    timer = Timer.periodic(4000.ms, (Timer t) {
      setState(() {
        if (currentIndex < 3) {
          currentIndex = (currentIndex + 1);
        } else {
          currentIndex = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer to prevent memory leaks
    timer.cancel();
    currentIndex = 0;
    super.dispose();
  }

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
        width: double.infinity,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.symmetric(vertical: R.size(0)),
        gap: R.size(0),
        children: [
          CustomField(
              arrangement: FieldArrangement.row,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              gap: R.size(150),
              children: [
                CustomDisplay(
                  assetPath: AppPaths.images.profilePicture,
                  width: R.size(400),
                  height: R.size(650),
                  fit: BoxFit.cover,
                  isSvg: false,
                  borderWidth: R.size(3),
                  borderColor: AppColors.dark.primaryColor2,
                  borderPadding: EdgeInsets.only(
                      top: R.size(12), left: R.size(12), bottom: -R.size(8)),
                  inFront: true,
                ),
                CustomField(
                    arrangement: FieldArrangement.column,
                    width: R.size(800),
                    gap: R.size(20),
                    children: [
                      AnimatedSwitcher(
                        duration: 300.ms,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                              sizeFactor: animation,
                              axis: Axis.vertical,
                              child: child,
                            ),
                          );
                        },
                        child: CustomText(
                          key: ValueKey<String>(
                              introductionTitles[currentIndex]),
                          text: introductionTitles[currentIndex],
                          selectable: true,
                          fontSize: R.size(60),
                          letterSpacing: R.size(6),
                          fontWeight: FontWeight.w800,
                          color: AppColors.dark.primaryColor2,
                        ),
                      ),
                      CustomText(
                        text:
                            'Crafting innovative solutions with expertise in Flutter, the MERN stack, backend development, and system development. Let’s connect and explore new opportunities!',
                        selectable: true,
                        fontSize: R.size(24),
                        fontWeight: FontWeight.w400,
                        color: AppColors.dark.primaryColor3,
                      ),
                      CustomText(
                        text: 'Mr.Ali Salem Essouiah',
                        selectable: true,
                        fontSize: R.size(20),
                        fontWeight: FontWeight.w300,
                        color: AppColors.dark.primaryColor3.withOpacity(0.6),
                      ),
                      CustomField(
                          arrangement: FieldArrangement.row,
                          gap: R.size(30),
                          margin: EdgeInsets.only(top: R.size(30)),
                          children: [
                            CustomButton(
                              text: 'Get in touch',
                              textSize: R.size(24),
                              fontWeight: FontWeight.w500,
                              padding: EdgeInsets.symmetric(
                                  vertical: R.size(10), horizontal: R.size(20)),
                              backgroundColor: AppColors.dark.primaryColor1,
                              textColor: AppColors.dark.primaryColor3,
                              iconWidth: R.size(36),
                              onHoverStyle: CustomButtonStyle(
                                backgroundColor: AppColors.dark.primaryColor2,
                                textColor: AppColors.blackSatinDeep,
                              ),
                              onPressed: () {
                                EventsUtil.routeEvents.updatePath(
                                    context, AppPaths.routes.contactMeScreen);
                                Beamer.of(context).beamToNamed(
                                    AppPaths.routes.contactMeScreen);
                              },
                            )
                                .animate(
                                    onPlay: (controller) => controller.repeat())
                                .shimmer(
                                  color: AppColors.dark.primaryColor2,
                                  duration: 500.ms,
                                  delay: 3000.ms,
                                ),
                            CustomButton(
                              text: 'Download My Resume',
                              textSize: R.size(24),
                              fontWeight: FontWeight.w400,
                              padding: EdgeInsets.symmetric(
                                  vertical: R.size(10), horizontal: R.size(20)),
                              iconWidth: R.size(36),
                              textColor: AppColors.dark.primaryColor3,
                              onHoverStyle: CustomButtonStyle(
                                textColor: AppColors.dark.primaryColor4,
                              ),
                              onPressed: () async {
                                AppUtil.launchURL(
                                    'https://drive.google.com/file/d/1RV5Ynod9Fgb3G0Rwp8Sa4TmeTUUg5bm8/view?usp=sharing');
                              },
                            )
                                .animate(
                                    onPlay: (controller) => controller.repeat())
                                .shimmer(
                                  color: AppColors.dark.primaryColor4,
                                  duration: 500.ms,
                                  delay: 3000.ms,
                                ),
                          ])
                    ])
              ])
        ]);
  }
}

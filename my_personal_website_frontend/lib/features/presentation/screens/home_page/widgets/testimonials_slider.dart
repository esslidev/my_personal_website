import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_display.dart';
import '../../../widgets/common/custom_field.dart';
import '../../../widgets/common/custom_text.dart';

class Testimonial {
  final String imagePath;
  final String customerName;
  final String professionTitle;
  final String testimonial;

  const Testimonial({
    required this.imagePath,
    required this.customerName,
    required this.professionTitle,
    required this.testimonial,
  });
}

class TestimonialsSlider extends StatefulWidget {
  final List<Testimonial> testimonials;
  const TestimonialsSlider({super.key, required this.testimonials});

  @override
  State<TestimonialsSlider> createState() => _TestimonialsSliderState();
}

class _TestimonialsSliderState extends State<TestimonialsSlider> {
  late ResponsiveSizeAdapter r;

  int _currentCarouselIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
  }

  Widget _buildTestimonialCard({required Testimonial testimonial}) {
    ValueNotifier<bool> isHoveredNotifier = ValueNotifier(false);
    return ValueListenableBuilder(
      valueListenable: isHoveredNotifier,
      builder: (BuildContext context, bool isHovered, Widget? child) {
        return MouseRegion(
          onEnter: (event) {
            isHoveredNotifier.value = true;
          },
          onExit: (event) {
            isHoveredNotifier.value = false;
          },
          child: CustomField(
            padding: r.symmetric(horizontal: 12),
            gap: r.size(12),
            children: [
              CustomField(
                gap: r.size(12),
                crossAxisAlignment: CrossAxisAlignment.center,
                arrangement: FieldArrangement.row,
                children: [
                  TweenAnimationBuilder<double>(
                    duration: 300.ms,
                    tween: Tween<double>(begin: 0, end: isHovered ? 1 : 0),
                    curve: Curves.easeInOut,
                    builder: (context, value, child) {
                      return ColorFiltered(
                        colorFilter: ColorFilter.matrix([
                          lerpDouble(0.2126, 1.0, value) ?? 0,
                          lerpDouble(0.7152, 0, value) ?? 0,
                          lerpDouble(0.0722, 0, value) ?? 0,
                          0,
                          0, // Red
                          lerpDouble(0.2126, 0, value) ?? 0,
                          lerpDouble(0.7152, 1.0, value) ?? 0,
                          lerpDouble(0.0722, 0, value) ?? 0,
                          0,
                          0, // Green
                          lerpDouble(0.2126, 0, value) ?? 0,
                          lerpDouble(0.7152, 0, value) ?? 0,
                          lerpDouble(0.0722, 1.0, value) ?? 0,
                          0,
                          0, // Blue
                          0, 0, 0, 1, 0, // Alpha (unchanged)
                        ]),
                        child: child,
                      );
                    },
                    child: CustomDisplay(
                      assetPath: testimonial.imagePath,
                      fit: BoxFit.cover,
                      width: r.size(32),
                      height: r.size(32),
                      borderRadius: BorderRadius.circular(r.size(16)),
                    ),
                  ),
                  CustomField(
                    gap: r.size(2),
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: 300.ms,
                        curve: Curves.easeInOut,
                        style: TextStyle(
                          fontSize: r.size(10),
                          fontFamily: 'public_sans',
                          fontWeight: FontWeight.bold,
                          color:
                              isHovered ? AppColors.dark.primary : Colors.white,
                        ),
                        child: Text(testimonial.customerName),
                      ),
                      AnimatedDefaultTextStyle(
                        duration: 300.ms,
                        curve: Curves.easeInOut,
                        style: TextStyle(
                          fontSize: r.size(8),
                          fontWeight: FontWeight.w300,
                          fontFamily: 'public_sans',
                          color:
                              isHovered
                                  ? AppColors.colors.white
                                  : AppColors.colors.white.withValues(
                                    alpha: .3,
                                  ),
                        ),
                        child: Text(testimonial.professionTitle),
                      ),
                    ],
                  ),
                ],
              ),
              CustomText(
                text: testimonial.testimonial,
                textAlign: TextAlign.justify,
                fontSize: r.size(9),
                fontWeight: FontWeight.w300,
                color: AppColors.colors.white.withValues(alpha: .4),
                lineHeight: 1.5,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSliderIndicator({
    required int index,
    required int length,
    required Function(int index) onPressed,
  }) {
    return CustomField(
      gap: r.size(9),
      arrangement: FieldArrangement.row,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        length,
        (i) => MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              onPressed(i);
            },
            child: Transform.rotate(
              angle: 45 * (pi / 180),
              child: AnimatedContainer(
                duration: 300.ms,
                width: r.size(4),
                height: r.size(4),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    width: r.size(0.6),
                    color: AppColors.dark.primary,
                  ),
                  color:
                      i == index
                          ? AppColors.dark.primary
                          : Colors.transparent, // Highlight active dot
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTestimonialsSlider(
    BuildContext context, {
    bool? isDesktopScreen,
    bool? isTabletScreen,
    bool? isMobileScreen,
  }) {
    return CustomField(
      gap: r.size(12),
      padding: r.symmetric(
        vertical: 30,
        horizontal:
            isDesktopScreen == true
                ? 40
                : isTabletScreen == true
                ? 20
                : isMobileScreen == true
                ? 0
                : 140,
      ),
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height:
                isDesktopScreen == true
                    ? r.size(160)
                    : isTabletScreen == true
                    ? r.size(120)
                    : isMobileScreen == true
                    ? r.size(170)
                    : r.size(130),
            aspectRatio: 0,
            autoPlay: true,
            disableCenter: true,
            padEnds: false,
            autoPlayInterval: 10.seconds,
            autoPlayAnimationDuration: 1.seconds,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            viewportFraction:
                isTabletScreen == true || isMobileScreen == true ? 1 : 1 / 2,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentCarouselIndex = index;
              });
            },
          ),
          items:
              widget.testimonials.map((testimonial) {
                return _buildTestimonialCard(testimonial: testimonial);
              }).toList(),
        ),
        _buildSliderIndicator(
          index: _currentCarouselIndex,
          length: widget.testimonials.length,
          onPressed: (index) {
            _carouselController.animateToPage(index);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      fallbackScreen: _buildTestimonialsSlider(context),
      screenDesktop: _buildTestimonialsSlider(context, isDesktopScreen: true),
      screenTablet: _buildTestimonialsSlider(context, isTabletScreen: true),
      screenMobile: _buildTestimonialsSlider(context, isMobileScreen: true),
    );
  }
}

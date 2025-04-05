import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_display.dart';
import '../../../widgets/common/custom_field.dart';

class Certificate {
  final String name;
  final String imagePath;

  const Certificate({required this.name, required this.imagePath});
}

class CertificatesSlider extends StatefulWidget {
  final List<Certificate> certificates;
  const CertificatesSlider({super.key, required this.certificates});

  @override
  State<CertificatesSlider> createState() => _CertificatesSliderState();
}

class _CertificatesSliderState extends State<CertificatesSlider> {
  late ResponsiveSizeAdapter r;

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
  }

  Widget _buildCertificateImage({
    required Certificate certificate,
    double? height,
  }) {
    return Tooltip(
      message: certificate.name,
      child: CustomDisplay(
        assetPath: certificate.imagePath,
        height: height ?? r.size(160),
      ),
    );
  }

  Widget _buildCertificates(
    BuildContext context, {
    bool? isDesktopScreen,
    bool? isTabletScreen,
    bool? isMobileScreen,
  }) {
    return CustomField(
      backgroundColor: AppColors.colors.white.withValues(alpha: .05),
      width: double.infinity,
      margin: r.symmetric(vertical: 30),
      padding: r.symmetric(vertical: 24),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      isWrap: true,
      wrapHorizontalSpacing: r.size(12),
      wrapVerticalSpacing: r.size(12),
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height:
                isDesktopScreen == true
                    ? r.size(140)
                    : isTabletScreen == true
                    ? r.size(140)
                    : r.size(160),
            autoPlay: true,
            autoPlayInterval: 4.seconds,
            autoPlayAnimationDuration: 16.seconds,
            autoPlayCurve: Curves.linear,
            enlargeCenterPage: false,
            viewportFraction:
                isDesktopScreen == true
                    ? 1 / 3
                    : isTabletScreen == true
                    ? 1 / 2
                    : isMobileScreen == true
                    ? 1 / 1
                    : 1 / 4,
            enableInfiniteScroll: true,
          ),
          items:
              widget.certificates.map((certificate) {
                return _buildCertificateImage(
                  certificate: certificate,
                  height:
                      isDesktopScreen == true
                          ? r.size(140)
                          : isTabletScreen == true
                          ? r.size(140)
                          : null,
                );
              }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      fallbackScreen: _buildCertificates(context),
      screenDesktop: _buildCertificates(context, isDesktopScreen: true),
      screenTablet: _buildCertificates(context, isTabletScreen: true),
      screenMobile: _buildCertificates(context, isMobileScreen: true),
    );
  }
}

import 'package:flutter/material.dart';

class ResponsiveScreenAdapter extends StatelessWidget {
  final Widget? defaultScreen;
  final Widget? screenMobile;
  final Widget? screenTablet;
  final Widget? screenDesktop;
  final Widget? screenMobileTablet;
  final Widget? screenTabletDesktop;

  const ResponsiveScreenAdapter({
    super.key,
    this.defaultScreen,
    this.screenMobile,
    this.screenTablet,
    this.screenDesktop,
    this.screenMobileTablet,
    this.screenTabletDesktop,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    if (screenMobile != null && width < 768) {
      return screenMobile!;
    } else if (screenMobileTablet != null && width < 1200 && width >= 768) {
      return screenMobileTablet!;
    } else if (screenTablet != null && width < 992 && width >= 768) {
      return screenTablet!;
    } else if (screenTabletDesktop != null && width < 1200 && width >= 992) {
      return screenTabletDesktop!;
    } else if (screenDesktop != null && width >= 1200) {
      return screenDesktop!;
    } else if (defaultScreen != null) {
      return defaultScreen!;
    } else {
      // Fallback widget if no screen is provided
      return const Center(child: Text('No screen available'));
    }
  }
}

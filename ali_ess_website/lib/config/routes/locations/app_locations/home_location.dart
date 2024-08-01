import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_paths.dart';
import '../../../../features/presentation/screens/home/home.dart';

class HomeLocation extends BeamLocation {
  @override
  List<Pattern> get pathPatterns => ['${AppPaths.routes.homeScreen}/*'];

  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('home'), title: 'Ali Ess | Home', child: HomeScreen()),
    ];
    return pages;
  }
}

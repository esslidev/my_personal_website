import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_paths.dart';

class AboutMeLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.aboutMeScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('about-me'), title: 'about-me', child: AboutMeScreen()),
    ];
    return pages;
  }
}

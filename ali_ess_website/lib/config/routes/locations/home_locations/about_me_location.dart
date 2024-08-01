import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_paths.dart';
import '../../../../features/presentation/screens/about_me/about_me.dart';

class AboutMeLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.aboutMeScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('about-me'),
          title: 'Ali Ess | About me',
          child: AboutMeScreen()),
    ];
    return pages;
  }
}

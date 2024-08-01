import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_paths.dart';
import '../../../../features/presentation/screens/my_portfolio/my_portfolio.dart';

class MyPortfolioLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.myPortfolioScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('my-portfolio'),
          title: 'Ali Ess | My portfolio',
          child: MyPortfolioScreen()),
    ];
    return pages;
  }
}

import 'package:beamer/beamer.dart';

import '../../core/constants/app_paths.dart';
import 'locations/home_locations/about_me_location.dart';
import 'locations/home_locations/contact_me_location.dart';
import 'locations/home_locations/dashboard_location.dart';
import 'locations/home_locations/my_blog_location.dart';
import 'locations/home_locations/my_portfolio_location.dart';

class HomeRoutes {
  static final List<BeamLocation> _beamLocations = [
    DashboardLocation(),
    AboutMeLocation(),
    MyPortfolioLocation(),
    MyBlogLocation(),
    ContactMeLocation(),
  ];

  static final homeBeamerDelegate = BeamerDelegate(
      initialPath: AppPaths.routes.dashboardScreen,
      transitionDelegate: const NoAnimationTransitionDelegate(),
      locationBuilder:
          BeamerLocationBuilder(beamLocations: _beamLocations).call,
      notFoundRedirectNamed: AppPaths.routes.badRoutingScreen);
}

import 'package:beamer/beamer.dart';

import '../../../core/constants/app_paths.dart';
import 'app_locations/bad_routing_location.dart';
import 'app_locations/home_page_location.dart';
import 'app_locations/maintenance_location.dart';

class AppRoutes {
  static final List<BeamLocation> _beamLocations = [
    HomePageLocation(),
    BadRoutingLocation(),
    MaintenanceLocation(),
  ];

  static final appBeamerDelegate = BeamerDelegate(
    initialPath: AppPaths.routes.homePageScreen,
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: BeamerLocationBuilder(beamLocations: _beamLocations).call,
    notFoundRedirectNamed: AppPaths.routes.badRoutingScreen,
  );
}

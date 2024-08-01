import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../../../../config/routes/home_routes.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/util/route_path_service.dart';
import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../../../locator.dart';
import '../../widgets/common/field.dart';
import 'components/footer.dart';
import 'components/header.dart';
import 'components/header_tape.dart';
import 'components/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ResponsiveSizeAdapter R;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  Widget build(BuildContext context) {
    // Update route path in RoutePathService
    locator<RoutePathService>().updatePath(
      Beamer.of(context).currentBeamLocation.state.routeInformation.uri.path,
    );

    return Scaffold(
        body: ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    ));
  }

  Widget _buildDesktop(BuildContext context) {
    return SingleChildScrollView(
      child: CustomField(arrangement: FieldArrangement.column, children: [
        const HeaderTapeComponent(),
        const HeaderComponent(),
        const NavigationBarComponent(),
        Beamer(
          routerDelegate: HomeRoutes.homeBeamerDelegate,
          backButtonDispatcher: BeamerBackButtonDispatcher(
              delegate: HomeRoutes.homeBeamerDelegate),
        ),
        const FooterComponent(),
      ]),
    );
  }
}

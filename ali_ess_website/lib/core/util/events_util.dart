import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/presentation/bloc/app_blocs/route/route_bloc.dart';
import '../../features/presentation/bloc/app_blocs/route/route_event.dart';

class EventsUtil {
  static RouteEvents get routeEvents => RouteEvents();
}

class RouteEvents {
  void updatePath(BuildContext context, String newPath) {
    context.read<AppRouteBloc>().add(UpdatePath(newPath));
  }
}

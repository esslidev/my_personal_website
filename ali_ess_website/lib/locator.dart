import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/util/route_path_service.dart';
import 'core/util/localization_service.dart';
import 'features/presentation/bloc/app_blocs/route/route_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register RoutePathService
  locator.registerSingleton<RoutePathService>(RoutePathService());

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  // LocalizationService
  Locale systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
  LocalizationService localizationService =
      await LocalizationService.load(systemLocale);
  locator.registerSingleton<LocalizationService>(localizationService);

  // Dio
  locator.registerSingleton<Dio>(Dio());

  //Blocs
  locator.registerFactory<AppRouteBloc>(() => AppRouteBloc(locator()));

  // Dependencies

  //UseCases
}

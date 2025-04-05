import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/resources/persisted_space_background_controller.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  //App Blocs

  // Dependencies

  //UseCases

  // Controllers
  locator.registerLazySingleton<PersistedSpaceBackgroundController>(
    () => PersistedSpaceBackgroundController(),
  );
}

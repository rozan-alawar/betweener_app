import 'package:betweener_app/app/app_preferences.dart';
import 'package:betweener_app/core/providers/auth_provider.dart';
import 'package:betweener_app/core/repository/auth_repo.dart';
import 'package:betweener_app/core/services/api_base_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'router/navigation_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => DioHelper());

  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //-------------------- services --------------------------

  locator.registerLazySingleton(() => NavigationService());

//-------------------- repository  --------------------------

  locator.registerLazySingleton(() => AuthRepository());

//-------------------- provider --------------------------

  locator.registerLazySingleton(() => AuthProvider());
}

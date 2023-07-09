import 'package:get_it/get_it.dart';

import 'router/navigation.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
 
//-------------------- services --------------------------

  locator.registerLazySingleton(() => NavigationService());

}

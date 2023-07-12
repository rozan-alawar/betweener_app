import 'package:betweener_app/core/providers/auth_provider.dart';
import 'package:betweener_app/core/services/api_base_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/app_preferences.dart';
import 'app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  DioHelper.init();
  await setupLocator();
  locator.registerLazySingleton<AppPreferences>(
    () => AppPreferences(
      locator<SharedPreferences>(),
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => locator<AuthProvider>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

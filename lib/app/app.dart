import 'package:betweener_app/app/router/navigation_service.dart';
import 'package:betweener_app/app/router/route_constants.dart';
import 'package:betweener_app/app/router/router.dart';
import 'package:betweener_app/app/util/resources/strings_manager.dart';
import 'package:betweener_app/app/util/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'locator.dart';
import 'util/resources/values_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(AppWidthSize.w375, AppHeightSize.h812),
      minTextAdapt: true,
      builder: (context, child) => SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appNameText,
          theme: getApplicationTheme(),
          initialRoute: RouteConstants.intro,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
        ),
      ),
    );
  }
}

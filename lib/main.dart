import 'app/router/navigation_service.dart';
import 'app/router/router.dart';
import 'app/router/route_constants.dart';
import 'app/util/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => SafeArea(
        child: 
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Betweener',
          theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: ColorManager.kPrimaryColor,
              appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.kPrimaryColor),
              ),
              scaffoldBackgroundColor: ColorManager.kScaffoldColor),
          initialRoute: RouteConstants.intro,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
        ),
      ),
    );
  }
}

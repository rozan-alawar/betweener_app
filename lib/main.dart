import 'package:betweener_app/router/navigation.dart';
import 'package:betweener_app/router/router.dart';
import 'package:betweener_app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/util/constants.dart';
import 'locator.dart';


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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => SafeArea(
        child: MaterialApp(
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
          initialRoute: RoutesConstant.intro,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
        ),
      ),
    
    );
  }
}

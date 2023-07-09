import 'package:flutter/material.dart';
import 'core/util/constants.dart';
import 'features/active_share/profile_friend.dart';
import 'features/active_share/receive_view.dart';
import 'features/auth/login_view.dart';
import 'features/auth/register_view.dart';
import 'features/home/home_view.dart';
import 'features/main_app/main_app_view.dart';
import 'features/onbording/onbording_view.dart';
import 'features/profile/profile_view.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Betweener',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: kPrimaryColor,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
          scaffoldBackgroundColor: kScaffoldColor),
      home: const OnBoardingView(),
      routes: {
        LoginView.id: (context) => LoginView(),
        RegisterView.id: (context) => RegisterView(),
        HomeView.id: (context) => const HomeView(),
        MainAppView.id: (context) => const MainAppView(),
        ProfileView.id: (context) => const ProfileView(),
        ReceiveView.id: (context) => const ReceiveView(),
        FriendProfileView.id: (context) => const FriendProfileView(),
      },
    );
  }
}

import 'package:betweener_app/features/auth/login_view.dart';
import 'package:betweener_app/features/auth/register_view.dart';
import 'package:betweener_app/features/main_app/main_app_view.dart';
import 'package:betweener_app/features/onbording/onbording_view.dart';
import 'package:betweener_app/features/profile/add_link.dart';
import 'package:betweener_app/features/profile/edit_link.dart';
import 'package:betweener_app/features/profile/edit_profile_view.dart';
import 'package:betweener_app/features/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ------------- LOGIN SCREEN -----------------

      case RoutesConstant.login:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );

      // ------------- SIGNUP FIRST SCREEN -----------------

      case RoutesConstant.register:
        return MaterialPageRoute(
          builder: (_) => RegisterView(),
        );

      // ------------- ONBOARDING SCREEN -----------------

      case RoutesConstant.intro:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );

      // ------------- HOME SCREEN -----------------

      case RoutesConstant.home:
        return MaterialPageRoute(
          builder: (_) => const MainAppView(),
        );

      // ------------- EDIT PROFILE SCREEN -----------------

      case RoutesConstant.editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfileView(),
        );

      // ------------- PROFILE SCREEN -----------------

      case RoutesConstant.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileView(),
        );

      // ------------- EDIT LINK SCREEN -----------------

      case RoutesConstant.editLink:
        return MaterialPageRoute(
          builder: (_) => const EditLinkView(),
        );

      // ------------- ADD LINK SCREEN -----------------

      case RoutesConstant.addLink:
        return MaterialPageRoute(
          builder: (_) => const AddLinkView(),
        );

      // ------------- Default Route ---------------

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

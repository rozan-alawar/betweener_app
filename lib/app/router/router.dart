import 'package:betweener_app/ui/view/active_share/profile_friend.dart';

import '../../ui/view/auth/login_view.dart';
import '../../ui/view/auth/register_view.dart';
import '../../ui/view/main_app/main_app_view.dart';
import '../../ui/view/onbording/onbording_view.dart';
import '../../ui/view/profile/add_link.dart';
import '../../ui/view/profile/edit_link.dart';
import '../../ui/view/profile/edit_profile_view.dart';
import '../../ui/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'route_constants.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ------------- LOGIN SCREEN -----------------

      case RouteConstants.login:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );

      // ------------- SIGNUP FIRST SCREEN -----------------

      case RouteConstants.register:
        return MaterialPageRoute(
          builder: (_) => RegisterView(),
        );

      // ------------- ONBOARDING SCREEN -----------------

      case RouteConstants.intro:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );

      // ------------- HOME SCREEN -----------------

      case RouteConstants.home:
        return MaterialPageRoute(
          builder: (_) => const MainAppView(),
        );

      // ------------- EDIT PROFILE SCREEN -----------------

      case RouteConstants.editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfileView(),
        );

      // ------------- PROFILE SCREEN -----------------

      case RouteConstants.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileView(),
        );

      // ------------- EDIT LINK SCREEN -----------------

      case RouteConstants.editLink:
        return MaterialPageRoute(
          builder: (_) => const EditLinkView(),
        );

      // ------------- ADD LINK SCREEN -----------------

      case RouteConstants.addLink:
        return MaterialPageRoute(
          builder: (_) => const AddLinkView(),
        );

 // ------------- Friend Profile SCREEN -----------------

      case RouteConstants.friendProfile:
        return MaterialPageRoute(
          builder: (_) => const FriendProfileView(),
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

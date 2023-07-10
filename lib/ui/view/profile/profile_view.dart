import 'package:flutter/material.dart';
import '../../../app/locator.dart';
import '../../../app/router/navigation_service.dart';
import '../../../app/router/route_constants.dart';
import '../../../app/util/color_manager.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          //------------------------- EDIT PROFILE -------------------------

          IconButton(
            icon: const Icon(
              Icons.edit,
            ),
            onPressed: () {
              locator<NavigationService>()
                  .navigateTo(RouteConstants.editProfile);
            },
          ),
          //------------------------- EDIT LINK -------------------------

          IconButton(
            icon: const Icon(
              Icons.edit_document,
            ),
            onPressed: () {
              locator<NavigationService>().navigateTo(RouteConstants.editLink);
            },
          ),
          //------------------------- ADD NEW LINK -------------------------
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: ColorManager.kPrimaryColor,
              onPressed: () {
                locator<NavigationService>().navigateTo(RouteConstants.addLink);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Text(
                '+',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

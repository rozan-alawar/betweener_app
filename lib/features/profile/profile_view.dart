import 'package:flutter/material.dart';

import '../../core/util/constants.dart';
import '../../locator.dart';
import '../../router/navigation.dart';
import '../../router/routes.dart';

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
                  .navigateTo(RoutesConstant.editProfile);
            },
          ),
          //------------------------- EDIT LINK -------------------------

          IconButton(
            icon: const Icon(
              Icons.edit_document,
            ),
            onPressed: () {
              locator<NavigationService>().navigateTo(RoutesConstant.editLink);
            },
          ),
          //------------------------- ADD NEW LINK -------------------------
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: ColorManager.kPrimaryColor,
              onPressed: () {
                locator<NavigationService>().navigateTo(RoutesConstant.addLink);
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

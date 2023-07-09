import 'package:betweener_app/core/util/constants.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../router/navigation.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.kLightPrimaryColor,
      leading: GestureDetector(
        onTap: () {
          locator<NavigationService>().pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: ColorManager.kPrimaryColor,
        ),
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

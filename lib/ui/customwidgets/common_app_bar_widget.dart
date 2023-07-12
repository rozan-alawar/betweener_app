import 'package:flutter/material.dart';

import '../../app/locator.dart';
import '../../app/router/navigation_service.dart';
import '../../app/util/resources/color_manager.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.withLeading = true,
  });
  final String title;
  final bool centerTitle;
  final bool withLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: ColorManager.kLightPrimaryColor,
      leading: withLeading
          ? GestureDetector(
              onTap: () {
                locator<NavigationService>().pop();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorManager.kPrimaryColor,
              ),
            )
          : const SizedBox.shrink(),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

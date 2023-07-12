import 'package:betweener_app/app/router/route_constants.dart';
import 'package:betweener_app/ui/customwidgets/sizedbox_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/locator.dart';
import '../../app/router/navigation_service.dart';
import '../../app/util/resources/color_manager.dart';
import '../../app/util/resources/style_manager.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 79,
      padding: const EdgeInsets.only(top: 10, left: 10),
      decoration: BoxDecoration(
        color: index == 2
            ? ColorManager.kLightPrimaryColor
            : ColorManager.kLightSecondaryColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: index == 2
          ? InkWell(
              onTap: () {
                locator<NavigationService>().navigateTo(RouteConstants.addLink);
              },
              child: Column(
                children: [
                  const Icon(Icons.add),
                  const CustomSizedBox(height: 10),
                  Text(
                    'ADD MORE ',
                    style: getMediumStyle(color: Colors.black),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Text(
                  'FACEBOOK',
                  style: getMediumStyle(
                    color: ColorManager.kOnSecondaryColor,
                  ),
                ),
                const CustomSizedBox(height: 10),
                const Text('@oalshokri'),
              ],
            ),
    );
  }
}

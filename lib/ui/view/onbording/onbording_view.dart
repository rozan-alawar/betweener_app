import 'package:betweener_app/app/util/resources/font_manager.dart';
import 'package:betweener_app/app/util/resources/strings_manager.dart';

import '../../../app/app_preferences.dart';
import '../../../app/locator.dart';
import '../../../app/router/navigation_service.dart';
import '../../../app/router/route_constants.dart';
import '../../../app/util/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app/util/resources/color_manager.dart';
import '../../../app/util/resources/values_manager.dart';
import '../../customwidgets/secondary_button_widget.dart';

class OnBoardingView extends StatelessWidget {
  static String id = '/onBoardingView';

  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            SvgPicture.asset(ImagePath.onBoardingImage),
            const Text(
              AppStrings.onBoardingDescText,
              style: TextStyle(
                fontSize: FontSize.s16,
                color: ColorManager.kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            SecondaryButtonWidget(
              text: AppStrings.onBoardingButtonText,
              width: double.infinity,
              onTap: () {
                locator<AppPreferences>().isUserLoggedIn()
                    ? locator<NavigationService>()
                        .navigateToAndRemove(RouteConstants.home)
                    : locator<NavigationService>()
                        .navigateToAndRemove(RouteConstants.login);
              },
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

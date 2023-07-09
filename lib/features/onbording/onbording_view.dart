import 'package:betweener_app/locator.dart';
import 'package:betweener_app/router/navigation.dart';
import 'package:betweener_app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/util/assets.dart';
import '../../core/util/constants.dart';
import '../../core/widgets/secondary_button_widget.dart';

class OnBoardingView extends StatelessWidget {
  static String id = '/onBoardingView';

  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            SvgPicture.asset(AssetsData.onBoardingImage),
            const Text(
              'Just one Scan for everything',
              style: TextStyle(
                fontSize: 16,
                color: ColorManager.kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            SecondaryButtonWidget(
              text: 'Get Started',
              width: double.infinity,
              onTap: () {
                locator<NavigationService>()
                    .navigateToAndRemove(RoutesConstant.login);
              },
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

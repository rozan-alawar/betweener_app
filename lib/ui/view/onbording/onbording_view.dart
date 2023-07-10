import '../../../app/locator.dart';
import '../../../app/router/navigation_service.dart';
import '../../../app/router/route_constants.dart';
import '../../../app/util/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app/util/color_manager.dart';
import '../../customwidgets/secondary_button_widget.dart';

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
            SvgPicture.asset(ImagePath.onBoardingImage),
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

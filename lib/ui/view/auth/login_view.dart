import '../../../app/util/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../customwidgets/custom_labeled_textfield_widget.dart';
import '../../customwidgets/primary_outlined_button_widget.dart';
import '../../customwidgets/secondary_button_widget.dart';
import '../../../app/locator.dart';
import '../../../app/router/navigation_service.dart';
import '../../../app/router/route_constants.dart';
import 'widgets/google_button_widget.dart';

class LoginView extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
 final  TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Hero(
                        tag: 'authImage',
                        child: SvgPicture.asset(ImagePath.authImage))),
                const Spacer(),
                PrimaryLabeledTextFieldWidget(
                  controller: emailController,
                  hint: 'example@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  label: 'Email',
                ),
                const SizedBox(
                  height: 14,
                ),
                PrimaryLabeledTextFieldWidget(
                  controller: passwordController,
                  hint: 'Enter password',
                  label: 'password',
                  password: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                SecondaryButtonWidget(
                    onTap: () {
                      locator<NavigationService>()
                          .navigateToAndRemove(RouteConstants.home);
                    },
                    text: 'LOGIN'),
                const SizedBox(
                  height: 24,
                ),
                PrimaryOutlinedButtonWidget(
                  onTap: () {
                    locator<NavigationService>()
                        .navigateTo(RouteConstants.register);
                  },
                  text: 'REGISTER',
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  '-  or  -',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GoogleButtonWidget(onTap: () {}),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

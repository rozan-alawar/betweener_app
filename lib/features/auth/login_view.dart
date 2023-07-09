import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/util/assets.dart';
import '../../core/widgets/custom_labeled_textfield_widget.dart';
import '../../core/widgets/primary_outlined_button_widget.dart';
import '../../core/widgets/secondary_button_widget.dart';
import '../../locator.dart';
import '../../router/navigation.dart';
import '../../router/routes.dart';
import 'widgets/google_button_widget.dart';

class LoginView extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                        child: SvgPicture.asset(AssetsData.authImage))),
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
                          .navigateToAndRemove(RoutesConstant.home);
                    },
                    text: 'LOGIN'),
                const SizedBox(
                  height: 24,
                ),
                PrimaryOutlinedButtonWidget(
                  onTap: () {
                    locator<NavigationService>()
                        .navigateTo(RoutesConstant.register);
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

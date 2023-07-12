import 'package:betweener_app/app/util/extensions/validation_ext.dart';
import 'package:betweener_app/app/util/resources/color_manager.dart';
import 'package:betweener_app/app/util/resources/style_manager.dart';
import 'package:betweener_app/core/providers/auth_provider.dart';
import 'package:betweener_app/ui/customwidgets/sizedbox_custom.dart';
import 'package:provider/provider.dart';

import '../../../app/util/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../customwidgets/custom_labeled_textfield_widget.dart';
import '../../customwidgets/primary_outlined_button_widget.dart';
import '../../customwidgets/secondary_button_widget.dart';
import '../../../app/locator.dart';
import '../../../app/router/navigation_service.dart';
import '../../../app/router/route_constants.dart';
import 'widgets/google_button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: 'rozan@gmail.com');
    passwordController = TextEditingController(text: 'Rozan@2002#');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          print(provider.isLoading);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Form(
                key: formKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      const Spacer(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                        child: Hero(
                          tag: 'authImage',
                          child: SvgPicture.asset(ImagePath.authImage),
                        ),
                      ),
                      const Spacer(),
                      PrimaryLabeledTextFieldWidget(
                        controller: emailController,
                        validator: (text) => text!.isValidEmail,
                        hint: 'example@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        label: 'Email',
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      PrimaryLabeledTextFieldWidget(
                        controller: passwordController,
                        validator: (text) => text!.isValidPassword,
                        hint: 'Enter password',
                        label: 'password',
                        password: true,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Visibility(
                        visible: provider.errorMessage.isNotEmpty,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.warning_rounded,
                              color: ColorManager.kDangerColor,
                            ),
                            const CustomSizedBox(width: 10),
                            Text(
                              provider.errorMessage,
                              style: getHintTextStyle(
                                  color: ColorManager.kDangerColor),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SecondaryButtonWidget(
                        onTap: () async {
                          debugPrint(
                            ' -------------------------- befor login --------------------------',
                          );
                          await locator<AuthProvider>().login(
                            formKey: formKey,
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          debugPrint(
                            ' -------------------------- after login--------------------------',
                          );
                        },
                        text: 'LOGIN',
                        isLoading: provider.isLoading,
                      ),
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
        },
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

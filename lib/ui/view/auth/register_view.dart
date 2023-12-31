import 'package:provider/provider.dart';

import '../../../app/locator.dart';
import '../../../app/util/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/providers/auth_provider.dart';
import '../../customwidgets/custom_labeled_textfield_widget.dart';
import '../../customwidgets/secondary_button_widget.dart';
import 'widgets/google_button_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController nameController;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: 'ss');
    emailController = TextEditingController(text: 'ss@ss.com');
    passwordController = TextEditingController(text: '123');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height,
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                      child: Hero(
                          tag: 'authImage',
                          child: SvgPicture.asset(ImagePath.authImage))),
                  const SizedBox(
                    height: 24,
                  ),
                  PrimaryLabeledTextFieldWidget(
                    controller: nameController,
                    hint: 'John Doe',
                    label: 'Name',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  PrimaryLabeledTextFieldWidget(
                    controller: emailController,
                    hint: 'example@gmail.com',
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
                    isLoading: provider.isLoading,
                    onTap: () async {
                      await locator<AuthProvider>().register(
                        formKey: formKey,
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
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
                        fontWeight: FontWeight.w300),
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
      ),
    );
  }
}

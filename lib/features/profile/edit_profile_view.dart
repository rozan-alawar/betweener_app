import 'package:betweener_app/core/util/assets.dart';
import 'package:betweener_app/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/app_config.dart';
import '../../core/widgets/common_app_bar_widget.dart';
import '../../core/widgets/secondary_button_widget.dart';
import '../../locator.dart';
import '../../router/navigation.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: 'Rozan');
    emailController = TextEditingController(text: 'Rozan@gmail.com');
    phoneController = TextEditingController(text: '123456789');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Edit User Info'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          child: Column(
            children: [
              const CustomSizedBox(40, 0),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(AssetsData.userImage),
              ),
              const CustomSizedBox(23, 0),
              PrimaryLabeledTextFieldWidget(
                label: 'Name',
                controller: nameController,
              ),
              const CustomSizedBox(19, 0),
              PrimaryLabeledTextFieldWidget(
                label: 'Email',
                controller: emailController,
              ),
              const CustomSizedBox(19, 0),
              PrimaryLabeledTextFieldWidget(
                label: 'Phone',
                controller: phoneController,
              ),
              const CustomSizedBox(40, 0),
              SecondaryButtonWidget(
                onTap: () {
                  locator<NavigationService>().pop();
                },
                text: 'SAVE',
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}

import '../../customwidgets/custom_labeled_textfield_widget.dart';
import '../../../app/util/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../customwidgets/sizedbox_custom.dart';
import '../../customwidgets/common_app_bar_widget.dart';
import '../../customwidgets/secondary_button_widget.dart';
import '../../../app/locator.dart';
import '../../../app/router/navigation_service.dart';

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
              const CustomSizedBox(height:40),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(ImagePath.userImage),
              ),
              const CustomSizedBox(height:23),
              PrimaryLabeledTextFieldWidget(
                label: 'Name',
                controller: nameController,
              ),
              const CustomSizedBox(height:19),
              PrimaryLabeledTextFieldWidget(
                label: 'Email',
                controller: emailController,
              ),
              const CustomSizedBox(height:19),
              PrimaryLabeledTextFieldWidget(
                label: 'Phone',
                controller: phoneController,
              ),
              const CustomSizedBox(height:40),
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

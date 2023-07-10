import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../customwidgets/sizedbox_custom.dart';
import '../../customwidgets/common_app_bar_widget.dart';
import '../../customwidgets/custom_labeled_textfield_widget.dart';
import '../../customwidgets/secondary_button_widget.dart';
import '../../../app/locator.dart';
import '../../../app/router/navigation_service.dart';
import 'package:flutter/material.dart';

class AddLinkView extends StatefulWidget {
  const AddLinkView({super.key});

  @override
  State<AddLinkView> createState() => _AddLinkViewState();
}

class _AddLinkViewState extends State<AddLinkView> {
  late TextEditingController titleController;
  late TextEditingController linkController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    linkController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Add Link'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          child: Column(
            children: [
              const CustomSizedBox(height:40),
              PrimaryLabeledTextFieldWidget(
                label: 'Title',
                controller: titleController,
              ),
              const CustomSizedBox(height:16),
              PrimaryLabeledTextFieldWidget(
                label: 'Link',
                controller: linkController,
              ),
              const CustomSizedBox(height:40),
              SecondaryButtonWidget(
                onTap: () {
                  locator<NavigationService>().pop();
                },
                text: 'ADD',
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    linkController.dispose();
    super.dispose();
  }
}

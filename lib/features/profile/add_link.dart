import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/app_config.dart';
import '../../core/widgets/common_app_bar_widget.dart';
import '../../core/widgets/custom_labeled_textfield_widget.dart';
import '../../core/widgets/secondary_button_widget.dart';
import '../../locator.dart';
import '../../router/navigation.dart';
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
              const CustomSizedBox(40, 0),
              PrimaryLabeledTextFieldWidget(
                label: 'Title',
                controller: titleController,
              ),
              const CustomSizedBox(16, 0),
              PrimaryLabeledTextFieldWidget(
                label: 'Link',
                controller: linkController,
              ),
              const CustomSizedBox(40, 0),
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

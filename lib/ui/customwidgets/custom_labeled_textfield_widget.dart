import 'package:betweener_app/ui/customwidgets/sizedbox_custom.dart';
import 'package:flutter/material.dart';

import '../../app/util/resources/style_manager.dart';
import '../../app/util/resources/values_manager.dart';

class PrimaryLabeledTextFieldWidget extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final bool password;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const PrimaryLabeledTextFieldWidget({
    super.key,
    required this.label,
    this.controller,
    this.hint,
    this.password = false,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getMediumStyle(),
        ),
        CustomSizedBox(
          height: AppHeightSize.h12,
        ),
        TextFormField(
          validator: validator,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: password,
          enableSuggestions: password == true ? false : true,
          autocorrect: password == true ? false : true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppWidthSize.w12,
              vertical: AppHeightSize.h12,
            ),
            hintText: hint,
          ),
        ),
      ],
    );
  }
}

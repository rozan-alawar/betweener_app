import 'package:betweener_app/app/util/resources/font_manager.dart';
import 'package:flutter/material.dart';
import '../../app/util/resources/color_manager.dart';
import '../../app/util/resources/values_manager.dart';

class PrimaryOutlinedButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final double? width;
  final String text;

  const PrimaryOutlinedButtonWidget(
      {super.key,
      required this.onTap,
      this.width = double.infinity,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadiusSize.r12),
          side: BorderSide(
              color: ColorManager.kPrimaryColor, width: AppWidthSize.w2)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadiusSize.r12),
        child: SizedBox(
          width: width,
          height: AppHeightSize.h50,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: ColorManager.kPrimaryColor,
                  fontSize: FontSize.s14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

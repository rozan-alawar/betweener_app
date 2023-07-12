import 'package:betweener_app/app/util/resources/font_manager.dart';
import 'package:flutter/material.dart';
import '../../app/util/resources/color_manager.dart';
import '../../app/util/resources/values_manager.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final double? width;
  final String text;
  final bool isLoading;

  const SecondaryButtonWidget({
    super.key,
    required this.onTap,
    this.width = double.infinity,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(AppRadiusSize.r12),
      color:
          isLoading ? ColorManager.hintTextColor : ColorManager.kSecondaryColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadiusSize.r12),
        child: SizedBox(
          width: width,
          height: AppHeightSize.h50,
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(
                    text,
                    style: const TextStyle(
                      color: ColorManager.kOnSecondaryColor,
                      fontSize: FontSize.s14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

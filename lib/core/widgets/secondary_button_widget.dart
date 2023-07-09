import 'package:flutter/material.dart';

import '../util/constants.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final double? width;
  final String text;

  const SecondaryButtonWidget(
      {super.key,
      required this.onTap,
      this.width = double.infinity,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: ColorManager.kSecondaryColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: width,
          height: 50,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: ColorManager.kOnSecondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

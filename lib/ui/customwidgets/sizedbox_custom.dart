import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const CustomSizedBox(
      {this.height = 0.0,
      this.width = 0.0,
      this.child = const SizedBox.shrink(),
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h, width: width.w, child: child);
  }
}

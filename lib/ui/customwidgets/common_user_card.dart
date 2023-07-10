import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 21.h),
      decoration: const BoxDecoration(
        color: Color(0xFF2D2B4E),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: child,
    );
  }
}

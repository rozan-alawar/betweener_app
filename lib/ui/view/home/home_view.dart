import 'package:flutter/material.dart';
import '../../../app/util/color_manager.dart';

class HomeView extends StatelessWidget {
  static String id = '/homeView';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.kDangerColor,
    );
  }
}

import 'package:betweener_app/app/util/assets_manager.dart';
import 'package:betweener_app/app/util/color_manager.dart';
import 'package:betweener_app/app/util/style_manager.dart';
import 'package:betweener_app/ui/customwidgets/sizedbox_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../customwidgets/social_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 13.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(IconPath.search),
                  const CustomSizedBox(width: 12),
                  SvgPicture.asset(IconPath.scann),
                ],
              ),
            ),
            const CustomSizedBox(height: 46),
            Text(
              'Hello, Ahmed!',
              style: getMediumStyle(
                size: 28,
                color: ColorManager.kPrimaryColor,
              ),
            ),
            const CustomSizedBox(height: 30),
            Center(
              child: Image.asset(ImagePath.QRCode),
            ),
            const CustomSizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 198.w,
                child: const Divider(
                  color: ColorManager.kPrimaryColor,
                  thickness: 2,
                ),
              ),
            ),
            const CustomSizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SocialCard(index: index),
                separatorBuilder: (context, index) =>
                    const CustomSizedBox(width: 10),
                itemCount: 3,
              ),
            ),
            const CustomSizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

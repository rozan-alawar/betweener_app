import 'package:betweener_app/ui/customwidgets/common_app_bar_widget.dart';
import 'package:betweener_app/ui/customwidgets/sizedbox_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/util/resources/assets_manager.dart';
import '../../../app/util/resources/constants_manager.dart';
import '../../customwidgets/common_user_card.dart';

class FriendProfileView extends StatefulWidget {
  const FriendProfileView({super.key});

  @override
  State<FriendProfileView> createState() => _FriendProfileViewState();
}

class _FriendProfileViewState extends State<FriendProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Ahmed Ali', centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 16.h),
        child: Column(
          children: [
            const CustomSizedBox(height: 30),
            UserCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(ImagePath.userImage),
                    maxRadius: 40,
                  ),
                  const CustomSizedBox(width: 18),
                  SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'John Doe',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      const Text(
                        'example@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 66,
                        height: 24,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFFD465),
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: const Center(
                          child: Text(
                            'follow',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF2D2B4E)),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            const CustomSizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const CustomSizedBox(height: 24),
                itemCount: AppConstants.links.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Colors.redAccent.shade100
                          : const Color.fromARGB(255, 204, 199, 232),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${AppConstants.links[index]['name']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${AppConstants.links[index]['link']}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

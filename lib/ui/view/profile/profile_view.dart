import 'package:betweener_app/ui/customwidgets/common_app_bar_widget.dart';
import 'package:betweener_app/ui/customwidgets/common_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../app/locator.dart';
import '../../../app/router/navigation_service.dart';
import '../../../app/router/route_constants.dart';
import '../../../app/util/resources/assets_manager.dart';
import '../../../app/util/resources/color_manager.dart';
import '../../../app/util/resources/constants_manager.dart';
import '../../customwidgets/sizedbox_custom.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CommonAppBar(
        title: 'Profile',
        centerTitle: true,
        withLeading: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 16.h),
            child: Column(
              children: [
                const CustomSizedBox(height: 30),
                Stack(
                  children: [
                    const UserCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(ImagePath.userImage),
                            maxRadius: 40,
                          ),
                          CustomSizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                'John Doe',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              Text(
                                'example@gmail.com',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '+9700000000',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          locator<NavigationService>()
                              .navigateTo(RouteConstants.editProfile);
                        },
                      ),
                    ),
                  ],
                ),
                const CustomSizedBox(height: 30),

                //------------------------- EDIT LINK -------------------------
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const CustomSizedBox(height: 24),
                    itemCount: AppConstants.links.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        key: UniqueKey(),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            const CustomSizedBox(width: 16),
                            InkWell(
                              onTap: () {
                                locator<NavigationService>()
                                    .navigateTo(RouteConstants.editLink);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 15.h,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorManager.kSecondaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const CustomSizedBox(width: 12),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 15.h,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorManager.kDangerColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 13.h),
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100.h,
            right: 20.w,
            child: FloatingActionButton(
              backgroundColor: ColorManager.kPrimaryColor,
              onPressed: () {
                locator<NavigationService>().navigateTo(RouteConstants.addLink);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

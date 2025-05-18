import 'package:equina_task/app/profile_cycle/widgets/custom_profile_item.dart';
import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Container(
        height: AppDimentions().availableheightNoAppBar,
        width: AppDimentions().availableWidth,
        color: backgroundGrey,

        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(height: 10.h),
            SizedBox(
              height: 70.h,
              width: 80.w,
              child: Image.asset(
                "assets/images/profile.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 5.h),

            Text(
              'mariam',
              textAlign: TextAlign.center,
              style: TextManager.regular(fontSize: 18),
            ),
            SizedBox(height: 10.h),

            Container(
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: greyBorder),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Column(
                children: [
                  CustomProfileItem(
                    title: 'Edit Profile',
                    imgPath: 'assets/images/edit_profile.png',
                  ),
                  CustomProfileItem(
                    title: 'My Points',
                    imgPath: 'assets/images/points.png',
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 10.w,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5.w),
                        SizedBox(
                          width: 25.w,
                          height: 23.h,
                          child: Container(
                            decoration: BoxDecoration(
                              color: mainPurble,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                            ),

                            child: Icon(Icons.notifications, color: white),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "My Notifications",
                          style: TextManager.regular(fontSize: 16),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 13.dm),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),

                  CustomProfileItem(
                    title: 'Manage Family',
                    imgPath: 'assets/images/family.png',
                  ),
                  CustomProfileItem(
                    title: 'Livery Settings',
                    imgPath: 'assets/images/book.png',
                  ),
                  CustomProfileItem(
                    title: 'Fill Medical Report',
                    imgPath: 'assets/images/medical_report.png',
                  ),
                  CustomProfileItem(
                    title: 'Fill Club Application',
                    imgPath: 'assets/images/clipboard.png',
                  ),
                  CustomProfileItem(
                    title: 'Billing Details',
                    imgPath: 'assets/images/bill.png',
                  ),
                  CustomProfileItem(
                    title: 'Tutorial Guides',
                    imgPath: 'assets/images/idea.png',
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 10.w,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5.w),
                        SizedBox(
                          width: 25.w,
                          height: 23.h,
                          child: Container(
                            decoration: BoxDecoration(
                              color: mainPurble,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                            ),

                            child: Icon(Icons.info, color: white),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "Information",
                          style: TextManager.regular(fontSize: 16),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        // Icon(Icons.arrow_forward_ios, size: 13.dm),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 10.w,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5.w),
                        SizedBox(
                          width: 25.w,
                          height: 23.h,
                          child: Container(
                            decoration: BoxDecoration(
                              color: mainPurble,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                            ),

                            child: Image.asset(
                              "assets/images/contact-us.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "Contact US",
                          style: TextManager.regular(fontSize: 16),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        // Icon(Icons.arrow_forward_ios, size: 13.dm),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),

                  Divider(color: greyBorder, indent: 20.w, endIndent: 20.w),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 10.w,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5.w),
                        SizedBox(
                          width: 25.w,
                          height: 23.h,
                          child: Container(
                            decoration: BoxDecoration(
                              color: mainPurble,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                            ),

                            child: Image.asset(
                              "assets/images/logout.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "Log Out",
                          style: TextManager.regular(fontSize: 16),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        // Icon(Icons.arrow_forward_ios, size: 13.dm),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

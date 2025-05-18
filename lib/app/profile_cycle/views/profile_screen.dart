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
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: mainPurble,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),

                      child: Icon(Icons.person, size: 17.dm, color: white),
                    ),
                    title: Text("profile"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.dm),
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: mainPurble,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),

                      child: Icon(
                        Icons.stars_outlined,
                        size: 17.dm,
                        color: white,
                      ),
                    ),
                    title: Text("My Points"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.dm),
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: mainPurble,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),

                      child: Icon(
                        Icons.notifications,
                        size: 17.dm,
                        color: white,
                      ),
                    ),
                    title: Text("My Notifications"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.dm),
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: mainPurble,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),

                      child: Icon(
                        Icons.groups_2,
                        size: 17.dm,
                        color: white,
                      ),
                    ),
                    title: Text("Manage Family"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.dm),
                  ),
                
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: mainPurble,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),

                      child: Icon(Icons.ac_unit_rounded, size: 17.dm, color: white),
                    ),
                    title: Text("Livery Settings"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.dm),
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: mainPurble,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),

                      child: Icon(
                        Icons.stars_outlined,
                        size: 17.dm,
                        color: white,
                      ),
                    ),
                    title: Text("My Points"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.dm),
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: mainPurble,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),

                      child: Icon(
                        Icons.notifications,
                        size: 17.dm,
                        color: white,
                      ),
                    ),
                    title: Text("My Notifications"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.dm),
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: mainPurble,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),

                      child: Icon(
                        Icons.groups_2,
                        size: 17.dm,
                        color: white,
                      ),
                    ),
                    title: Text("Manage Family"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15.dm),
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

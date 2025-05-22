import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileItem extends StatelessWidget {
  final String imgPath;
  final String title;
  final VoidCallback? onTap;

  const CustomProfileItem({
    super.key,
    required this.title,
    required this.imgPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
                      top: 5.h,
                      bottom: 5.h,
                      left: 10.w,
                      right: 15.w
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
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                ),
      
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(imgPath, fit: BoxFit.fill,color: white,),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(title, style: TextManager.regular(fontSize: 16)),
            Spacer(),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}

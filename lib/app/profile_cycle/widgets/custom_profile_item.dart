import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileItem extends StatelessWidget {
  final String imgPath;
  final String title;

  const CustomProfileItem({
    super.key,
    required this.title,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
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
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),
          // Icon(Icons.arrow_forward_ios, size: 13.dm),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}

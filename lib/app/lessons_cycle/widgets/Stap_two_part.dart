import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StapTwoPart extends StatefulWidget {
  const StapTwoPart({super.key});

  @override
  State<StapTwoPart> createState() => _StapTwoPartState();
}

class _StapTwoPartState extends State<StapTwoPart> {
  int numClasses = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimentions().availableWidth,
      color: white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Number of Classes:",
                style: TextManager.regular(
                  fontSize: 15,
                ).copyWith(color: black, decoration: TextDecoration.none),
              ),
              Spacer(),

              Container(
                decoration: BoxDecoration(
                  color: mainBlue,
                  borderRadius: BorderRadius.circular(3.r),
                ),
                width: 25.w,
                height: 20.h,
                // negative
                child: Icon(Icons.remove,size: 30 ,color: white),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  numClasses.toString(),
                  style: TextManager.regular(
                    fontSize: 20,
                  ).copyWith(color: black, decoration: TextDecoration.none),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: mainBlue,
                  borderRadius: BorderRadius.circular(3.r),
                ),
                width: 25.w,
                height: 20.h,
                // negative
                child: Icon(Icons.add, color: white),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                " Add Classes:",
                style: TextManager.regular(
                  fontSize: 15,
                ).copyWith(color: black, decoration: TextDecoration.none),
              ),
              SizedBox(width: 10.w),
              Container(
                decoration: BoxDecoration(
                  color: mainBlue,
                  borderRadius: BorderRadius.circular(3.r),
                ),
                width: 25.w,
                height: 20.h,
                // negative
                child: Icon(Icons.add, color: white),
              ),
              Spacer(),
              Text(
                " You Can Select Mutiple\nClasses at the Same Time.",
                style: TextManager.regular(
                  fontSize: 15,
                ).copyWith(color: redErorr.withAlpha(150), decoration: TextDecoration.none),
              ),
            ],
          ),

          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Classes Times:",
                style: TextManager.regular(
                  fontSize: 15,
                ).copyWith(color: black, decoration: TextDecoration.none),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

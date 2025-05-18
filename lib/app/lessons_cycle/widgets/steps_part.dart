import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepsPart extends StatefulWidget {
  const StepsPart({super.key});

  @override
  State<StepsPart> createState() => _StepsPartState();
}

class _StepsPartState extends State<StepsPart> {
  int stapNum = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 30.w),

      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        border: Border.all(color: greyBorder, width: 1.5.w),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Stap $stapNum/2",
            style: TextManager.regular(
              fontSize: 16,
            ).copyWith(color: greyBorder, decoration: TextDecoration.none),
          ),

          ///Pricing
          Text(
            "Pricing:",
            style: TextManager.regular(
              fontSize: 16,
            ).copyWith(color: black, decoration: TextDecoration.none),
          ),
          Row(
            children: [
              Container(
                height: 15.h,
                width: 15.h,
                decoration: BoxDecoration(
                  color: mainPurble,
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                ),
              ),
              Text(
                " lesson For",
                style: TextManager.regular(
                  // fontSize: 16,
                ).copyWith(color: black, decoration: TextDecoration.none),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8.w,bottom: 5.h),
                width: 1.w,
                height: 20.h,
                color: mainPurble,
              ),
          
            ],
          ),

          ///HOME
          Row(
            children: [
              Container(
                height: 15.h,
                width: 15.h,
                decoration: BoxDecoration(
                  color: mainPurble,
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                ),
              ),
              Text(
                " Home",
                style: TextManager.regular(
                  // fontSize: 16,
                ).copyWith(color: black, decoration: TextDecoration.none),
              ),
            ],
          ),
          Row(children: []),

          ///Lesson type"
          Row(
            children: [
              Container(
                height: 15.h,
                width: 15.h,
                decoration: BoxDecoration(
                  color: mainPurble,
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                ),
              ),
              Text(
                " Lesson Type",
                style: TextManager.regular(
                  // fontSize: 16,
                ).copyWith(color: black, decoration: TextDecoration.none),
              ),
            ],
          ),
          Row(children: []),

          ///Lesson Level"
          Row(
            children: [
              Container(
                height: 15.h,
                width: 15.h,
                decoration: BoxDecoration(
                  color: mainPurble,
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                ),
              ),
              Text(
                " Lesson Level",
                style: TextManager.regular(
                  // fontSize: 16,
                ).copyWith(color: black, decoration: TextDecoration.none),
              ),
            ],
          ),
          Row(children: []),
        ],
      ),
    );
  }
}

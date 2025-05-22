import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetelsPart extends StatelessWidget {
  final String clubName;
  final String trainingTypes;
  final String clubRating;
  final String ratingFrom;
  final String timeLesson;
  final String clubDescription;

  const DetelsPart({
    super.key,
    required this.clubName,
    required this.trainingTypes,
    required this.clubRating,
    required this.ratingFrom,
    required this.timeLesson,
    required this.clubDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),

      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        border: Border.all(color: greyBorder, width: 1.5.w),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                clubName,
                style: TextManager.regular(fontSize: 18).copyWith(
                  color: mainPurble,
                  decoration: TextDecoration.underline,
                  decorationColor: mainPurble.withAlpha(200),
                  decorationThickness: 2.h,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
              SizedBox(width: 10.w),
              Image.asset("assets/images/info.png", height: 20.w, width: 20.h),
            ],
          ),
          Text(
            trainingTypes,
            style: TextManager.regular(
              fontSize: 18,
            ).copyWith(color: black, decoration: TextDecoration.none),
          ),

          Row(
            children: [
              Icon(Icons.star, color: startclor),
              Text(
                " $clubRating ( $ratingFrom ) reviews",
                style: TextManager.regular().copyWith(
                  color: black,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(width: 30.w),
              Icon(Icons.access_time_filled, color: mainPurble),
              Text(
                " $timeLesson min",
                style: TextManager.regular().copyWith(
                  color: black,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),

          SizedBox(height: 5.h),
          Text(
            "Type",
            style: TextManager.regular(
              fontSize: 18,
            ).copyWith(color: black, decoration: TextDecoration.none),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: backgroundGrey,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            child: Text(
              maxLines: 3,
              trainingTypes,
              style: TextManager.regular().copyWith(
                color: lightGreyLabel,
                decoration: TextDecoration.none,
              ),
            ),
          ),

          SizedBox(height: 5.h),
          Text(
            "Description",
            style: TextManager.regular().copyWith(
              color: black,
              decoration: TextDecoration.none,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: backgroundGrey,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            child: Text(
              clubDescription,
              style: TextManager.regular().copyWith(
                color: lightGreyLabel,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:equina_task/app/lessons_cycle/models/lessons_list.dart';
import 'package:equina_task/helpers/application_dimentions.dart'
    show AppDimentions;
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart' show TextManager;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssessmentTinaCard extends StatelessWidget {
  final String title;
  final String clubName;
  final String? description;   
  final String type;
  final String duration;
  final int numberOfClasses;
  final String price;
  final String imagePath;
  final String? discountText;
  final List availableDays;
  final double initialRating;

  const AssessmentTinaCard({
    Key? key,
    required this.title,
    required this.clubName,
    this.description,
    required this.type,
    required this.duration,
    required this.numberOfClasses,
    required this.price,
    required this.imagePath,
    required this.availableDays,
    required this.initialRating,
    this.discountText, required Lesson lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Radius topRight = Radius.circular(20.r);
    Radius topLeft = Radius.elliptical(60, 300);
    Radius bottomRight = Radius.elliptical(60, 400);
    Radius bottomLeft = Radius.circular(20.r);

    TextStyle regular = TextManager.regular(
      fontSize: 13,
    ).copyWith(color: white);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      height: AppDimentions().availableheightWithAppBar * 0.26,
      decoration: BoxDecoration(
        color: mainBlue,
        borderRadius: BorderRadius.only(
          topRight: topRight,
          topLeft: topLeft,
          bottomRight: bottomRight,
          bottomLeft: bottomLeft,
        ),
        boxShadow: [BoxShadow(color: black.withAlpha(80), blurRadius: 15)],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextManager.bold().copyWith(color: white),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10.w),
                              width: 155.w,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Center(
                                child: Text(
                                  clubName,
                                  style: TextManager.medium().copyWith(
                                    color: mainBlue,
                                  ),
                                ),
                              ),
                            ),
                            //data api
                            SizedBox(height: 5.h),
                            if (description != null)
                              Text("Description: $description", style: regular),
                            Text("Type: $type", style: regular),
                            Text("Class Duration: $duration", style: regular),
                            Text(
                              "Number Of Classes: $numberOfClasses",
                              style: regular,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                //price
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: mainPurble,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(20, 20),
                          topLeft: Radius.circular(0.r),
                          bottomRight: Radius.circular(0.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                      ),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: TextManager.regular().copyWith(
                            fontSize: 15.sp,
                            color: lightGreyLabel,
                          ),
                          children: [
                            TextSpan(text: "Starting from\n", style: regular),
                            TextSpan(
                              text: "$price AED",
                              style: TextManager.regular().copyWith(
                                color: white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 5.w),
                    // if (availableDays != null)
                    Expanded(
                      child: SizedBox(
                        height: 20.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: availableDays.length,
                          itemBuilder: (BuildContext context, int index) {
                            dynamic day = availableDays[index];
                            return Container(
                              margin: EdgeInsets.only(left: 5.w),
                              height: 40.h,
                              width: 35.w,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Center(
                                child: Text(
                                  day.substring(
                                    0,
                                    day.length >= 3 ? 3 : day.length,
                                  ), // get first 3 letters
                                  style: TextManager.regular(
                                    fontSize: 13,
                                  ).copyWith(color: mainPurble),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //img part
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: topRight,
                    bottomRight: bottomRight,
                  ),
                  child: Image.asset(
                    imagePath,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  top: 10.h,
                  right: 5.w,
                  child: RatingBar(
                    itemSize: 30,
                    initialRating: initialRating,
                    direction: Axis.horizontal,
                    // allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Icon(
                        Icons.star_outlined,
                        color: startclor,
                        shadows: [BoxShadow(color: startclor, blurRadius: 100)],
                      ),
                      half: Icon(
                        Icons.star_half_outlined,
                        color: startclor,
                        shadows: [BoxShadow(color: startclor, blurRadius: 50)],
                      ),
                      empty: Icon(
                        Icons.star_border_outlined,
                        color: greyBorder,
                      ),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),

                //discount price
                // discountText == null
                //             ?
                Positioned(
                  bottom: 5.h,
                  right: 30.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
                    decoration: BoxDecoration(
                      color: mainPurble.withAlpha(230),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: white, width: 1.5.w),
                    ),
                    child:  RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextManager.regular().copyWith(
                            fontSize: 18.sp,
                            color: lightGreyLabel,
                          ),
                          children: [
                            TextSpan(text: "Buy and Get\n", style: regular),
                            TextSpan(
                              text: discountText!,
                              style: TextManager.medium().copyWith(
                                color: white,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                  

                    // Text(
                    //   discountText!,
                    //   style: TextManager.regular().copyWith(
                    //     color: white,
                    //     fontSize: 10.sp,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                  ),
                ),
                // :SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

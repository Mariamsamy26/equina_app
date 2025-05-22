import 'package:equina_task/app/lessons_cycle/models/lessons_list';
import 'package:equina_task/app/lessons_cycle/views/club_info_screen.dart';
import 'package:equina_task/app/lessons_cycle/views/lessons_details_screen.dart';
import 'package:equina_task/helpers/application_dimentions.dart'
    show AppDimentions;
import 'package:equina_task/helpers/navigation_helper.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart' show TextManager;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AssessmentTinaCard extends StatelessWidget {
  final String title;
  final String clubName;
  final String? description;
  final String type;
  final String duration;
  final int numberOfClasses;
  final String price;
  final String lessonCurrency;
  final String imagePath;
  final String? discountText;
  final List availableDays;
  final double initialRating;
  final Lesson lesson;

  const AssessmentTinaCard({
    Key? key,
    required this.title,
    required this.clubName,
    this.description,
    required this.type,
    required this.duration,
    required this.numberOfClasses,
    required this.price,
    required this.lessonCurrency,
    required this.imagePath,
    required this.availableDays,
    required this.initialRating,
    this.discountText,
    required this.lesson,
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

    return Slidable(
      key: ValueKey(title),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.3,
        children: [
          CustomSlidableAction(
            onPressed:
                (context) => Navigation().goToScreen(
                  context,
                  (C) => ClubInfoScreen(lesson: lesson),
                ),
            backgroundColor: Colors.transparent,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 25.h,
                decoration: BoxDecoration(
                  color: mainPurble,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text(
                    'Club Info',
                    style: TextStyle(color: white, fontSize: 12.sp),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap:
            () => Navigation().goToScreen(
              context,
              (C) => LessonsDetailsScreen(lesson: lesson),
            ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          height: AppDimentions().availableheightWithAppBar * 0.25,
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
                flex: 6,
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
                            maxLines: 1,
                            style: TextManager.bold(
                              fontSize: 20,
                            ).copyWith(color: white),
                          ),
                          SizedBox(height: 5.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5.w),
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
                                if (description != "")
                                  Text(
                                    "Description: $description",
                                    style: regular,
                                  ),
                                Text("Type: $type", style: regular),
                                Text(
                                  "Class Duration: $duration min",
                                  style: regular,
                                ),
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
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextManager.regular().copyWith(
                                fontSize: 15.sp,
                                color: lightGreyLabel,
                              ),
                              children: [
                                TextSpan(
                                  text: "Starting from\n",
                                  style: regular,
                                ),
                                TextSpan(
                                  text: "$price $lessonCurrency",
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
                        if (availableDays.isNotEmpty)
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
                      child:
                          imagePath != ""
                              ? Image.network(
                                imagePath,
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                              : Image.asset(
                                "assets/images/girl_rider.jpg",
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                    ),

                    Positioned(
                      top: 5.h,
                      right: 5.w,
                      child: RatingBar(
                        itemSize: 20.dm,
                        initialRating: initialRating,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: Icon(
                            Icons.star_outlined,
                            color: startclor,
                            shadows: [
                              BoxShadow(color: startclor, blurRadius: 100),
                            ],
                          ),
                          half: Icon(
                            Icons.star_half_outlined,
                            color: startclor,
                            shadows: [
                              BoxShadow(color: startclor, blurRadius: 50),
                            ],
                          ),
                          empty: Icon(
                            Icons.star_border_outlined,
                            color: greyBorder,
                          ),
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ),

                    //discount price
                    // discountText == null
                    //             ?
                    Positioned(
                      bottom: 5.h,
                      right: 20.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: mainPurble.withAlpha(230),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: white, width: 1.5.w),
                        ),
                        child: Center(
                          child: RichText(
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
                                  style: TextManager.medium(
                                    fontSize: 8.sp,
                                  ).copyWith(color: white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // :SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

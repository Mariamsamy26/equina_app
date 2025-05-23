import 'package:equina_task/app/lessons_cycle/widgets/custom_option_select.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StapOnePart extends StatefulWidget {
  const StapOnePart({super.key});

  @override
  State<StapOnePart> createState() => _StapOnePartState();
}

class _StapOnePartState extends State<StapOnePart> {
  String lessonFor = "Child";
  String horse = "Club";
  String lessonType = "Group";
  String lessonLevel = "Beginner";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Pricing
        Text(
          "Pricing:",
          style: TextManager.regular(
            fontSize: 16,
          ).copyWith(color: black, decoration: TextDecoration.none),
        ),

        /// Lesson For
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
              style: TextManager.regular().copyWith(
                color: black,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 8.w, bottom: 5.h),
              width: 1.w,
              height: 22.h,
              color: mainPurble,
            ),

            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  lessonFor = 'Adult';
                });
              },
              option: 'Adult',
              select: lessonFor == 'Adult',
            ),
            SizedBox(width: 0.1.sw),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  lessonFor = 'Child';
                });
              },
              option: 'Child',
              select: lessonFor == 'Child',
            ),

            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.info_outline, color: mainBlue),
            ),
            SizedBox(width: 5.w),
          ],
        ),

        /// horse
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
              " horse",
              style: TextManager.regular().copyWith(
                color: black,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 8.w, bottom: 5.h),
              width: 1.w,
              height: 22.h,
              color: mainPurble,
            ),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  horse = 'Club';
                });
              },
              option: 'Club',
              select: horse == 'Club',
            ),
            SizedBox(width: 0.1.sw),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  horse = 'Private';
                });
              },
              option: 'Private',
              select: horse == 'Private',
            ),

            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.info_outline, color: mainBlue),
            ),
            SizedBox(width: 5.w),
          ],
        ),

        /// Lesson Type
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              style: TextManager.regular().copyWith(
                color: black,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 8.w, bottom: 5.h),
              width: 1.w,
              height: 22.h,
              color: mainPurble,
            ),

            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  lessonType = 'Private';
                });
              },
              option: 'Private',
              select: lessonType == 'Private',
            ),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  lessonType = 'Semi Private';
                });
              },
              option: 'Semi Private',
              select: lessonType == 'Semi Private',
            ),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  lessonType = 'Group';
                });
              },
              option: 'Group',
              select: lessonType == 'Group',
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.info_outline, color: mainBlue),
            ),
            SizedBox(width: 5.w),
          ],
        ),

        /// Lesson Level
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
              style: TextManager.regular().copyWith(
                color: black,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 8.w, bottom: 5.h),
              width: 1.w,
              height: 22.h,
              color: mainPurble,
            ),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  lessonLevel = 'Beginner';
                });
              },
              option: 'Beginner',
              select: lessonLevel == 'Beginner',
            ),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  lessonLevel = 'Intermediate';
                });
              },
              option: 'Intermediate',
              select: lessonLevel == 'Intermediate',
            ),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  lessonLevel = 'Advanced';
                });
              },
              option: 'Advanced',
              select: lessonLevel == 'Advanced',
            ),
          ],
        ),
      ],
    );
  }
}

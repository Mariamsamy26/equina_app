import 'package:equina_task/app/lessons_cycle/providers/lesssons_provider.dart';
import 'package:equina_task/app/lessons_cycle/widgets/price%20%20part/custom_option_select.dart';
import 'package:equina_task/app/lessons_cycle/widgets/price%20%20part/lesson_type_option_widget.dart';
import 'package:equina_task/app/lessons_cycle/widgets/price%20%20part/titel_price_widget.dart';
import 'package:equina_task/main.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/navigation_helper.dart';
import '../../../../widget/ok_dialog.dart';

// ignore: must_be_immutable
class PriceStapPart extends StatefulWidget {
  int lessonid;

  PriceStapPart({super.key, required this.lessonid});

  @override
  State<PriceStapPart> createState() => _PriceStapPartState();
}

class _PriceStapPartState extends State<PriceStapPart> {
  String lessonFor = "adult";
  String horse = "ClubHorse";
  String lessonType = "Group";
  String lessonLevel = "Beginner";

  @override
  void initState() {
    super.initState();
    _loadLessonDetails();
  }

  void _loadLessonDetails() async {
    int? userId = await MyApp().userIdFuture;
    await context.read<LessonsProvider>().getPublicLessonDetails(
      lessonId: widget.lessonid,
      contactId: userId!,
    );
    context.read<LessonsProvider>().updateSelectedPriceFor(
      "$lessonFor$horse$lessonType",
    );
    print("lessonDetailsId: ${widget.lessonid},");
    print("userDetailsId: ${userId},");
  }

  @override
  Widget build(BuildContext context) {
    final lessonDetailsProviderWatch =
        context.watch<LessonsProvider>().publicLessonDetails;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pricing:",
          style: TextManager.regular(
            fontSize: 16,
          ).copyWith(color: black, decoration: TextDecoration.none),
        ),

        TitelPriceWidget(titel: " lesson For"),
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
              onPressed:
                  () => ckickPriceNotZero(
                    titleSlect: 'lessonFor',
                    valuoSlect: 'adult',
                  ),
              option: 'Adult',
              select: lessonFor == 'adult',
            ),
            SizedBox(width: 0.1.sw),
            CustomOptionSelect(
              onPressed:
                  () => ckickPriceNotZero(
                    titleSlect: 'lessonFor',
                    valuoSlect: 'child',
                  ),
              option: 'Child',
              select: lessonFor == 'child',
            ),

            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.info_outline, color: mainBlue),
            ),
            SizedBox(width: 5.w),
          ],
        ),

        TitelPriceWidget(titel: " horse"),
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
              onPressed:
                  () => ckickPriceNotZero(
                    titleSlect: 'horse',
                    valuoSlect: 'ClubHorse',
                  ),
              option: 'Club',
              select: horse == 'ClubHorse',
            ),
            SizedBox(width: 0.1.sw),
            CustomOptionSelect(
              onPressed:
                  () => ckickPriceNotZero(
                    titleSlect: 'horse',
                    valuoSlect: 'OwnHorse',
                  ),
              option: 'Own',
              select: horse == 'OwnHorse',
            ),

            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.info_outline, color: mainBlue),
            ),
            SizedBox(width: 5.w),
          ],
        ),

        TitelPriceWidget(titel: " Lesson Type"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 8.w, bottom: 5.h),
              width: 1.w,
              height: 22.h,
              color: mainPurble,
            ),

            CustomLessonTypeOption(
              label: 'Private',
              isActive:
                  lessonDetailsProviderWatch.lessonDetails?.privateActive ==
                  "True",
              isSelected: lessonType == 'Private',
              onTap: () {
                setState(() {
                  lessonType = 'Private';
                });
                context.read<LessonsProvider>().updateSelectedPriceFor(
                  "$lessonFor$horse$lessonType",
                );
              },
            ),
            CustomLessonTypeOption(
              label: 'Semi Private',
              isActive:
                  lessonDetailsProviderWatch.lessonDetails?.semiPrivateActive ==
                  "True",
              isSelected: lessonType == 'SemiPrivate',
              onTap: () {
                setState(() {
                  lessonType = 'SemiPrivate';
                });
                context.read<LessonsProvider>().updateSelectedPriceFor(
                  "$lessonFor$horse$lessonType",
                );
              },
            ),
            CustomLessonTypeOption(
              label: 'Group',
              isActive:
                  lessonDetailsProviderWatch.lessonDetails?.groupActive ==
                  "True",
              isSelected: lessonType == 'Group',
              onTap: () {
                setState(() {
                  lessonType = 'Group';
                });
                context.read<LessonsProvider>().updateSelectedPriceFor(
                  "$lessonFor$horse$lessonType",
                );
              },
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
        TitelPriceWidget(titel: " Lesson Level"),
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
                context.read<LessonsProvider>().updateSelectedPriceFor(
                  "$lessonFor$horse$lessonType",
                );
              },
              option: 'Beginner',
              select: lessonLevel == 'Beginner',
            ),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  lessonLevel = 'Intermediate';
                });
                context.read<LessonsProvider>().updateSelectedPriceFor(
                  "$lessonFor$horse$lessonType",
                );
              },
              option: 'Intermediate',
              select: lessonLevel == 'Intermediate',
            ),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  lessonLevel = 'Advanced';
                });
                context.read<LessonsProvider>().updateSelectedPriceFor(
                  "$lessonFor$horse$lessonType",
                );
              },
              option: 'Advanced',
              select: lessonLevel == 'Advanced',
            ),
          ],
        ),
      ],
    );
  }

  void ckickPriceNotZero({
    required String titleSlect,
    required String valuoSlect,
  }) {
    String tempLessonFor = lessonFor;
    String tempHorse = horse;

    if (titleSlect == 'lessonFor') {
      tempLessonFor = valuoSlect;
    } else if (titleSlect == 'horse') {
      tempHorse = valuoSlect;
    }

    String ckickPrice = "$tempLessonFor$tempHorse$lessonType";

    if (context.read<LessonsProvider>().ckickPriceNotZero(ckickPrice)) {
      if (titleSlect == 'lessonFor') {
        lessonFor = valuoSlect;
      } else if (titleSlect == 'horse') {
        horse = valuoSlect;
      }
    } else {
      showDialog(
        context: context,
        builder:
            (context) => OkDialog(
              title: 'This Select is Disabled this \n Type of Lesson!',
            ),
      );
      context.read<LessonsProvider>().updateSelectedPriceFor(
        "$lessonFor$horse$lessonType",
      );
    }
  }
}

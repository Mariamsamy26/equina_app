import 'package:equina_task/app/lessons_cycle/providers/lesssons_provider.dart';
import 'package:equina_task/app/lessons_cycle/widgets/custom_option_select.dart';
import 'package:equina_task/main.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
    print("lessonDetailsId: ${widget.lessonid},");
    print("userDetailsId: ${userId},");
  }

  @override
  Widget build(BuildContext context) {
    final lessonDetailsProviderWatch =
        context.watch<LessonsProvider>().publicLessonDetails;

    //     final  context.read<LessonsProvider>().updateSelectedPriceFor("$lessonFor$horse$lessonType"); =
    //         WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<LessonsProvider>(). context.read<LessonsProvider>().updateSelectedPriceFor("$lessonFor$horse$lessonType");("$lessonFor$horse$lessonType");
    // });
    //  final  context.read<LessonsProvider>().updateSelectedPriceFor("$lessonFor$horse$lessonType"); =

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
                  lessonFor = 'adult';
                });
                context.read<LessonsProvider>().updateSelectedPriceFor(
                  "$lessonFor$horse$lessonType",
                );
              },
              option: 'Adult',
              select: lessonFor == 'adult',
            ),
            SizedBox(width: 0.1.sw),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  lessonFor = 'child';
                });
                context.read<LessonsProvider>().updateSelectedPriceFor(
                  "$lessonFor$horse$lessonType",
                );
              },
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
                  horse = 'ClubHorse';
                });
                context.read<LessonsProvider>().updateSelectedPriceFor(
                  "$lessonFor$horse$lessonType",
                );
              },
              option: 'Club',
              select: horse == 'ClubHorse',
            ),
            SizedBox(width: 0.1.sw),
            CustomOptionSelect(
              onPressed: () {
                setState(() {
                  horse = 'OwnHorse';
                });
                context.read<LessonsProvider>().updateSelectedPriceFor(
                  "$lessonFor$horse$lessonType",
                );
              },
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

            GestureDetector(
              onTap:
                  lessonDetailsProviderWatch.lessonDetails?.privateActive ==
                          "True"
                      ? () {
                        setState(() {
                          lessonType = 'Private';
                        });
                        context.read<LessonsProvider>().updateSelectedPriceFor(
                          "$lessonFor$horse$lessonType",
                        );
                      }
                      : null,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.w, right: 3.w, top: 0.h),
                    width: 15.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            (lessonDetailsProviderWatch
                                            .lessonDetails
                                            ?.privateActive ==
                                        "True" &&
                                    lessonType == 'Private')
                                ? mainBlue
                                : black.withAlpha(100),
                        width: 1.w,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.w),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              (lessonDetailsProviderWatch
                                          .lessonDetails
                                          ?.privateActive ==
                                      "True")
                                  ? (lessonType == 'Private'
                                      ? mainBlue
                                      : lightGreyFilter)
                                  : black.withAlpha(100),
                        ),
                      ),
                    ),
                  ),

                  Text(
                    ' Private',
                    style: TextManager.medium(
                      fontSize: 12,
                    ).copyWith(color: black, decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap:
                  lessonDetailsProviderWatch.lessonDetails?.semiPrivateActive ==
                          "True"
                      ? () {
                        setState(() {
                          lessonType = 'SemiPrivate';
                        });
                        context.read<LessonsProvider>().updateSelectedPriceFor(
                          "$lessonFor$horse$lessonType",
                        );
                      }
                      : null,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.w, right: 3.w, top: 0.h),
                    width: 15.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            (lessonDetailsProviderWatch
                                            .lessonDetails
                                            ?.semiPrivateActive ==
                                        "True" &&
                                    lessonType == 'SemiPrivate')
                                ? mainBlue
                                : black.withAlpha(100),
                        width: 1.w,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.w),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          color:
                              (lessonDetailsProviderWatch
                                          .lessonDetails
                                          ?.semiPrivateActive ==
                                      "True")
                                  ? (lessonType == 'SemiPrivate'
                                      ? mainBlue
                                      : lightGreyFilter)
                                  : black.withAlpha(100),
                        ),
                      ),
                    ),
                  ),

                  Text(
                    'Semi Private',
                    style: TextManager.medium(
                      fontSize: 12,
                    ).copyWith(color: black, decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap:
                  lessonDetailsProviderWatch.lessonDetails?.groupActive ==
                          "True"
                      ? () {
                        setState(() {
                          lessonType = 'Group';
                        });
                        context.read<LessonsProvider>().updateSelectedPriceFor(
                          "$lessonFor$horse$lessonType",
                        );
                      }
                      : null,

              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.w, right: 3.w, top: 0.h),
                    width: 15.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            (lessonDetailsProviderWatch
                                            .lessonDetails
                                            ?.groupActive ==
                                        "True" &&
                                    lessonType == 'Group')
                                ? mainBlue
                                : black.withAlpha(100),
                        width: 1.w,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.w),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              (lessonDetailsProviderWatch
                                          .lessonDetails
                                          ?.groupActive ==
                                      "True")
                                  ? (lessonType == 'Group'
                                      ? mainBlue
                                      : lightGreyFilter)
                                  : black.withAlpha(100),
                        ),
                      ),
                    ),
                  ),

                  Text(
                    'Group',
                    style: TextManager.medium(
                      fontSize: 12,
                    ).copyWith(color: black, decoration: TextDecoration.none),
                  ),
                ],
              ),
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
                context.read<LessonsProvider>().updateSelectedPriceFor(
                  "$lessonFor$horse$lessonType",
                );
                ;
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
                ;
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
                ;
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

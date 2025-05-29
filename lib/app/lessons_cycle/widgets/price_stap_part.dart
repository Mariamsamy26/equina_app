import 'package:equina_task/app/lessons_cycle/providers/lesssons_provider.dart';
import 'package:equina_task/app/lessons_cycle/widgets/custom_option_select.dart';
import 'package:equina_task/app/lessons_cycle/widgets/titel_price_widget.dart';
import 'package:equina_task/main.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../helpers/navigation_helper.dart';
import '../../../widget/ok_dialog.dart';

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
              //todo
              () {
                if (context.read<LessonsProvider>().ckickPriceNotZero(
                      "adult$horse$lessonType",
                    ) ==
                    true) {
                  setState(() {
                    lessonFor = 'adult';
                  });
                } else {
                  context.read<LessonsProvider>().updateSelectedPriceFor(
                    "adult$horse$lessonType",
                  );
                  showDialog(
                    context: context,
                    builder:
                        (context) => OkDialog(
                          title:
                              'This Select is Disabled this \n Type of Lesson!',
                        ),
                  );
                }
              },
              option: 'Adult',
              select: lessonFor == 'adult',
            ),
            SizedBox(width: 0.1.sw),
            CustomOptionSelect(
              onPressed: () {
                if (context.read<LessonsProvider>().ckickPriceNotZero(
                      "child$horse$lessonType",
                    ) ==
                    true) {
                  setState(() {
                    lessonFor = 'child';
                  });
                } else {
                  showDialog(
                    context: context,
                    builder:
                        (context) => OkDialog(
                          title:
                              'This Select is Disabled this \n Type of Lesson!',
                        ),
                  );
                }
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
               onPressed: () {
                if (context.read<LessonsProvider>().ckickPriceNotZero(
                      "${lessonFor}ClubHorse$lessonType",
                    ) ==
                    true) {
                  setState(() {
                    horse = 'ClubHorse';
                  });
                } else {
                  context.read<LessonsProvider>().updateSelectedPriceFor(
                    "$lessonFor$horse$lessonType",
                  );
                  showDialog(
                    context: context,
                    builder:
                        (context) => OkDialog(
                          title:
                              'This Select is Disabled this \n Type of Lesson!',
                        ),
                  );
                }
              },
              option: 'Club',
              select: horse == 'ClubHorse',
            ),
            SizedBox(width: 0.1.sw),
            CustomOptionSelect(
              onPressed: () {
                if (context.read<LessonsProvider>().ckickPriceNotZero(
                      "${lessonFor}OwnHorse$lessonType",
                    ) ==
                    true) {
                  setState(() {
                    horse = 'OwnHorse';
                  });
                } else {
                  context.read<LessonsProvider>().updateSelectedPriceFor(
                    "$lessonFor$horse$lessonType",
                  );
                  showDialog(
                    context: context,
                    builder:
                        (context) => OkDialog(
                          title:
                              'This Select is Disabled this \n Type of Lesson!',
                        ),
                  );
                }
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

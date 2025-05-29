import 'package:equina_task/app/lessons_cycle/models/lessons_list.dart';
import 'package:equina_task/app/lessons_cycle/providers/lesssons_provider.dart';
import 'package:equina_task/app/lessons_cycle/widgets/detels_part.dart';
import 'package:equina_task/app/lessons_cycle/widgets/img_part.dart';
import 'package:equina_task/app/lessons_cycle/widgets/offer_part.dart';
import 'package:equina_task/app/lessons_cycle/widgets/price%20%20part/price_stap_part.dart';
import 'package:equina_task/app/lessons_cycle/widgets/steps_part.dart';
import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/main.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LessonsCourseDetailsScreen extends StatefulWidget {
  final Lesson lesson;

  // ignore: use_super_parameters
  const LessonsCourseDetailsScreen({Key? key, required this.lesson})
    : super(key: key);

  @override
  State<LessonsCourseDetailsScreen> createState() =>
      _LessonsDetailsScreenState();
}

class _LessonsDetailsScreenState extends State<LessonsCourseDetailsScreen> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    int? userId = await MyApp().userIdFuture;
     
    await context.read<LessonsProvider>().getPublicLessonDetails(
      lessonId: widget.lesson.id!,
      contactId: userId!,
    );

  }

  @override
  Widget build(BuildContext context) {
    final lessonDetailsProviderWatch =
        context.watch<LessonsProvider>().publicLessonDetails;
    final price = context.watch<LessonsProvider>().getSelectedPrice();
        
    return SafeArea(
      child: Container(
        color: backgroundGrey,
        height: AppDimentions().availableheightWithAppBar,
        width: AppDimentions().availableWidth,

        child: Column(
          children: [
            //img
            ImgPart(imgPath: widget.lesson.imageUrl!),

            //body
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    OfferPart(),
                    SizedBox(
                      height: AppDimentions().availableheightWithAppBar * 0.42,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          DetelsPart(
                            clubName: widget.lesson.categoryName!,
                            trainingTypes: widget.lesson.trainingTypes!,
                            clubRating:
                                (widget.lesson.clubRating!.ceil()).toString(),
                            ratingFrom:
                                (widget.lesson.rangeOfPricesFrom).toString(),
                            timeLesson:
                                (widget.lesson.classDuration!.ceil())
                                    .toString(),
                            clubDescription: widget.lesson.clubDescription!,
                          ),
                          SizedBox(height: 5.h),
                          StepsPart(lesson: widget.lesson,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //add cart buttom
            Container(
              height: AppDimentions().availableheightWithAppBar * 0.06,
              width: AppDimentions().availableWidth,
              color: backgroundGrey,

              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainPurble,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: mainPurble),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {},
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                     "Add to Cart [ ${price?.toStringAsFixed(0)} EGP ] ",
                    maxLines: 1,
                    style: TextManager.medium().copyWith(color: white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

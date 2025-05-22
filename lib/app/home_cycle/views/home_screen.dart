import 'package:equina_task/app/home_cycle/widgets/leson_item_card.dart';
import 'package:equina_task/app/lessons_cycle/providers/lesssons_provider.dart';
import 'package:equina_task/app/lessons_cycle/views/lessons_details_screen.dart';
import 'package:equina_task/app/profile_cycle/views/profile_screen.dart';
import 'package:equina_task/app/start_app_cycle/services/outh_apis.dart';
import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/helpers/navigation_helper.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:equina_task/widget/loding_gif.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<LessonsProvider>().getAllLessons(OuthApis.userId);
     print("Loaded user ID log in: ${OuthApis.userId}");
  }

  @override
  Widget build(BuildContext context) {
    final lessons = context.watch<LessonsProvider>().lessonsList.lessons;
    AppDimentions().appDimentionsInit(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 25.h,
              width: 50.w,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Image.asset("assets/images/horse.png"),
            ),
            Text("equinaCLUB"),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: lightGreyLabel.withAlpha(205),
              borderRadius: BorderRadius.circular(5.r),
            ),
            width: 30.w,
            height: 25.h,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                "assets/images/family.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(width: 10.w),

          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
              ),
              width: 30.w,
              height: 25.h,
              child: SizedBox(
                child: Image.asset(
                  "assets/images/notification.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),

          GestureDetector(
            onTap: () {
              Navigation().goToScreen(context, (c) => ProfileScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
              ),
              width: 30.w,
              height: 25.h,
              child: Image.asset(
                "assets/images/profile.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(width: 10.w),
        ],

        //  actionsData.map((action) => _buildActionIcon(action)).toList(),
      ),
      body: Container(
        color: backgroundGrey,
        height: AppDimentions().availableheightWithAppBar,
        width: AppDimentions().availableWidth,
        child: Column(
          children: [
            Container(
              height: AppDimentions().availableheightWithAppBar * 0.08,
              padding: EdgeInsets.symmetric(vertical: 0.h),
              color: white,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          hintText: "Search",
                          hintStyle: TextManager.medium(
                            fontSize: 16,
                          ).copyWith(color: greyBorder),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              width: 10.w,
                              height: 10.h,
                              fit: BoxFit.cover,
                              "assets/images/search_icon.png",
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greyBorder,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greyBorder,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greyBorder,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        // controller: widget.controller,

                        // onChanged: widget.onChanged,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      height: 42.h,
                      width: 45.w,
                      fit: BoxFit.fill,
                      "assets/images/filter.png",
                    ),
                  ),
                  SizedBox(width: 5.w),
                ],
              ),
            ),
            Expanded(
              child:
                  lessons == null
                      ? const Center(child: LodingGif())
                      : SlidableAutoCloseBehavior(
                        child: ListView.builder(
                          itemCount: lessons.length,
                          itemBuilder: (context, index) {
                            final lesson = lessons[index];
                            return AssessmentTinaCard(
                              lesson: lesson,
                              title: lesson.trainingTypes ?? " ",
                              clubName: lesson.categoryName ?? " ",
                              description: lesson.description!,
                              type: lesson.lessontype ?? " ",
                              duration: lesson.classDuration
                                  .toString()
                                  .substring(0, 2),
                              numberOfClasses:
                                  (lesson.numOfClasses ?? 0).ceil(),
                              price:
                                  lowPrice([
                                    lesson.childClubHorseGroup!,
                                    lesson.childClubHorsePrivate!,
                                    lesson.childClubHorseSemiPrivate!,
                                    lesson.childOwnHorseGroup!,
                                    lesson.childOwnHorsePrivate!,
                                    lesson.childOwnHorseSemiPrivate!,
                                                    
                                    lesson.adultClubHorseGroup!,
                                    lesson.adultClubHorsePrivate!,
                                    lesson.adultClubHorseSemiPrivate!,
                                    lesson.adultOwnHorseGroup!,
                                    lesson.adultOwnHorsePrivate!,
                                    lesson.adultOwnHorseSemiPrivate!,
                                  ]).ceil().toString(),
                              lessonCurrency: lesson.lessonCurrency ?? "",
                              imagePath: lesson.imageUrl!,
                              discountText: "-200 AED Discount",
                              availableDays: lesson.days ?? [],
                              initialRating: lesson.clubRating ?? 0,
                            );
                          },
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }

  double lowPrice(List<double> listPrice) {
    double lowPrice = listPrice[0];
    for (int i = 0; i < listPrice.length; i++) {
      if (lowPrice == 0 || listPrice[i] < lowPrice && listPrice[i] > 0) {
        lowPrice = listPrice[i];
      }
    }
    return lowPrice;
  }
}

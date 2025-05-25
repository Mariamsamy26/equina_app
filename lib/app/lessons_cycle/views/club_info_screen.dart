import 'package:equina_task/app/lessons_cycle/models/lessons_list.dart';
import 'package:equina_task/app/start_app_cycle/widgets/custom_tab_view.dart';
import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClubInfoScreen extends StatelessWidget {
  final Lesson lesson;

  const ClubInfoScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.categoryName ?? " "),
        centerTitle: true,
      ),
      body: Container(
        color: white,
        height: AppDimentions().availableheightNoAppBar,
        width: AppDimentions().availableWidth,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: AppDimentions().availableheightWithAppBar * 0.26,
                  width: 1.sw,
                  child: Stack(
                    children: [
                      ClipRRect(
                        child:
                            lesson.imageUrl! != ""
                                ? Image.network(
                                  lesson.imageUrl ?? '',
                                  height: 150.h,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                )
                                : Image.asset(
                                  "assets/images/girl_rider.jpg",
                                  height: 150.h,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                      ),
                      Positioned(
                        top: 170,
                        left: 20,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 60.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.r),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/horse.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 220,
                        left: 115,
                        child: Text(
                          lesson.categoryName ?? " ",
                          style: TextManager.medium(fontSize: 18),
                        ),
                      ),
                      Positioned(
                        top: 215,
                        right: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert_outlined, size: 22.dm),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Container(
               color: fixErorr,
                    height:AppDimentions().availableheightNoAppBar*0.6,

                    
              padding: const EdgeInsets.all(10.0),
              child: Text(
                lesson.clubDescription ?? " ",
                style: TextManager.regular(),
              ),
            ),

            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: black,
                    indicatorColor: mainBlue,
                    tabs: [
                      Tab(text: "Details"),
                      Tab(text: "Most Common Facilities"),
                    ],
                  ),
                  Container(
                    color: fixErorr,
                    height:AppDimentions().availableheightNoAppBar*0.6,
                   child: TabBarView(children: [

                   ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

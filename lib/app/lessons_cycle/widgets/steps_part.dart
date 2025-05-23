import 'package:equina_task/app/lessons_cycle/widgets/Stap_one_part.dart';
import 'package:equina_task/app/lessons_cycle/widgets/Stap_two_part.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepsPart extends StatefulWidget {
  const StepsPart({super.key});

  @override
  State<StepsPart> createState() => _StepsPartState();
}

class _StepsPartState extends State<StepsPart> {
  int stapNum = 1;
  String get stapprov => stapNum == 1 ? "Next >" : "< Prev";
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
                "Stap $stapNum/2",
                style: TextManager.medium(
                  fontSize: 15,
                ).copyWith(color: greyBorder, decoration: TextDecoration.none),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    stapNum = stapNum == 1 ? 2 : 1;
                  });
                },
                child: Text(
                  stapprov,
                  style: TextManager.medium(fontSize: 15).copyWith(
                    color: mainPurble,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
            ],
          ),

          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.linear,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            width: stapNum == 1 ? 0.40.sw : 1.sw,
            height: 5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              gradient: LinearGradient(
                stops: [0.1, 0.9],
                colors: [mainBlue, mainPurble],
              ),
            ),
          ),

          Divider(
            color: greyBorder,
          ),

          stapNum == 1 ? StapOnePart() : StapTwoPart(),
        ],
      ),
    );
  }
}

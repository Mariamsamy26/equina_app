import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LodingGif extends StatelessWidget {
  const LodingGif({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimentions().appDimentionsInit(context);
    return Container(
      color: black.withAlpha(50),
      padding:  EdgeInsets.symmetric(horizontal: 150.w,vertical: 200.h),
      child: Center(
        child: LoadingIndicator(
          indicatorType: Indicator.ballTrianglePathColoredFilled,
          colors: const [mainPurble,mainBlue,Colors.blue],
      
          strokeWidth: 2,
      
        ),
      ),
    );
  }
}

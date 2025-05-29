import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/colors.dart';

class TitelPriceWidget extends StatelessWidget {
  String titel;
  TitelPriceWidget({super.key, required this.titel});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          titel,
          style: TextManager.regular().copyWith(
            color: black,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}

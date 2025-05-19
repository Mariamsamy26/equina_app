import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOptionSelect extends StatelessWidget {
  final void Function()? onPressed;
  final String option;
  final bool select;

  const CustomOptionSelect({
    super.key,
    required this.onPressed,
    required this.option,
    required this.select,
  });

  @override
  Widget build(BuildContext context) {
    Color selectColor = select ? mainBlue : lightGreyLabel;
    Color radioColor = select ? mainBlue : lightGreyFilter;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Row(
          children: [
            SizedBox(width: 5.w),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              width: 15.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: selectColor, width: 1.w),
              ),
              child: Padding(
                padding: EdgeInsets.all(1.w),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: radioColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              option,
              style: TextManager.medium(
                fontSize: 10,
              ).copyWith(color: black, decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}

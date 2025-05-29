import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomLessonTypeOption extends StatelessWidget {
  final bool isActive;
  final bool isSelected;
  final String label;
  final VoidCallback? onTap;

  const CustomLessonTypeOption({
    super.key,
    required this.isActive,
    required this.isSelected,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.w, right: 3.w, top: 0.h),
            width: 15.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive && isSelected ? mainBlue : black.withAlpha(100),
                width: 1.w,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(1.w),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive
                      ? (isSelected ? mainBlue : lightGreyFilter)
                      : black.withAlpha(100),
                ),
              ),
            ),
          ),
          Text(
            label,
            style: TextManager.medium(fontSize: 12).copyWith(
              color: black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

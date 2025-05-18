import 'package:equina_task/helpers/navigation_helper.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/widget/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/text_mang.dart';

// ignore: must_be_immutable
class OkDialog extends StatelessWidget {
  String title;
   OkDialog({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black.withAlpha(50),
      child: AlertDialog(
        backgroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        title: Text(
          textAlign: TextAlign.center,
          title,
          style: TextManager.medium(fontSize: 15).copyWith(color: black),
        ),
        content: CustomElevatedButtom(
          text: "OK",
          height: 30,
          OnPressed: () {
            Navigation().closeDialog(context);
          },
        ),
      ),
    );
  }
}

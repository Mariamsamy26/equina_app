import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferPart extends StatefulWidget {
  const OfferPart({super.key});

  @override
  State<OfferPart> createState() => _OfferPartState();
}

class _OfferPartState extends State<OfferPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimentions().availableheightWithAppBar*0.16,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        border: Border.all(color: greyBorder, width: 1.5.w),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "270 AED",
                    style: TextManager.medium(fontSize: 17).copyWith(
                      decoration: TextDecoration.none,
                      color: black,
                    ),
                  ),
                  Text(
                    "400 AED",
                    style: TextManager.medium(fontSize: 17).copyWith(
                      color: black,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: black.withAlpha(200),
                      decorationThickness: 1.h,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 30.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: backgroundGrey,
                        backgroundColor: mainBlue,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: mainBlue),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {},
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          "Buy Now",
                          maxLines: 1,
                          style: TextManager.medium().copyWith(color: white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            height: 100.h,
            width: 2.w,
            color: greyBorder,
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "270 AED",
                    style: TextManager.medium(fontSize: 17).copyWith(
                      decoration: TextDecoration.none,
                      color: black,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 30.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: backgroundGrey,
                        backgroundColor: mainBlue,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: mainBlue),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {},
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "Redeem",
                          maxLines: 1,
                          style: TextManager.medium().copyWith(color: white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            height: 100.h,
            width: 2.w,
            color: greyBorder,
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "{jjjjjj}\n discount",
                    style: TextManager.medium(fontSize: 17).copyWith(
                      color: black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 30.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: backgroundGrey,
                        backgroundColor: mainBlue,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: mainBlue),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {},
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "Buy With Famaily",
                          maxLines: 1,
                          style: TextManager.bold(
                            fontSize: 20,
                          ).copyWith(color: white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

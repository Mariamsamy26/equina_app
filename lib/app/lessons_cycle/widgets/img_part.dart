import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImgPart extends StatefulWidget {
  String imgPath;
  ImgPart({super.key, required this.imgPath});

  @override
  State<ImgPart> createState() => _ImgPartState();
}

class _ImgPartState extends State<ImgPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppDimentions().availableheightWithAppBar * 0.3,
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.r),
              bottomLeft: Radius.circular(20.r),
            ),
          ),

          child: GestureDetector(
            onTap:
                () => showDialog(
                  context: context,
                  builder:
                      (_) => Dialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child:
                              widget.imgPath != ""
                                  ? Image.network(
                                    widget.imgPath,
                                    fit: BoxFit.cover,
                                  )
                                  : Image.asset(
                                    "assets/images/girl_rider.jpg",
                                    fit: BoxFit.contain,
                                  ),
                        ),
                      ),
                ),

            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
              ),

              child:
                  widget.imgPath != ""
                      ? Image.network(widget.imgPath, fit: BoxFit.cover)
                      : Image.asset(
                        "assets/images/girl_rider.jpg",
                        fit: BoxFit.cover,
                      ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 20,
          child: GestureDetector(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            child: Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Center(child: Icon(Icons.arrow_back, color: black)),
            ),
          ),
        ),
      ],
    );
  }
}

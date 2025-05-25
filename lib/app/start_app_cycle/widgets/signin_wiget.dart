// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:equina_task/app/home_cycle/views/home_screen.dart';
import 'package:equina_task/app/start_app_cycle/models/login.dart';
import 'package:equina_task/app/start_app_cycle/services/outh_apis.dart';
import 'package:equina_task/widget/loding_gif.dart';
import 'package:equina_task/helpers/navigation_helper.dart';
import 'package:equina_task/widget/custom_text_form_field.dart';
import 'package:equina_task/app/start_app_cycle/widgets/custom_selec_user_button.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:equina_task/widget/custom_elevated_buttom.dart';
import 'package:equina_task/widget/ok_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInWiget extends StatefulWidget {
  const SignInWiget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInWigetState createState() => _SignInWigetState();
}

class _SignInWigetState extends State<SignInWiget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final bool _isPasswordVisible = true;
  String userType = "Equestrian User";

  late LogIn acc;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundGrey,
      padding: EdgeInsets.symmetric(horizontal: 20.w),

      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UsersTypeButton(
                onPressed: () {
                  setState(() {
                    userType = "Equestrian User";
                  });
                },
                select: userType == "Equestrian User",
                user: "Equestrian User",
              ),
              UsersTypeButton(
                onPressed: () {
                  setState(() {
                    userType = "Trainer User";
                  });
                },
                select: userType == "Trainer User",
                user: "Trainer User",
              ),
            ],
          ),
          SizedBox(height: 5.h),

          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (userType == "Equestrian User") ...[
                  Text(
                    "Phone Number",
                    style: TextManager.regular(fontSize: 16),
                  ),

                  AppTextFormField(
                    validator: (text) {
                      if (text?.isEmpty ?? false) {
                        return "Please Enter Your Phone Number ";
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9*#]')),
                      LengthLimitingTextInputFormatter(11),
                    ],
                    controller: _phoneController,
                    hintText: "Phone Number",
                    prefixIcon: SizedBox(
                      width: 10.w,
                      child: Center(
                        child: Text('🇪🇬', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    onChanged: (phone) async {
                      setState(() {});
                      if (phone.length == 11) {
                        setState(() {});
                      }
                    },
                  ),
                ] else ...[
                  Text("Email", style: TextManager.regular(fontSize: 16)),
                  AppTextFormField(
                    validator: (text) {
                      if (text?.isEmpty ?? false) {
                        return "please enter rigt email ";
                      }
                      return null;
                    },
                    controller: _emailController,
                    keyboardType: TextInputType.phone,
                    hintText: "Email",
                  ),
                ],

                SizedBox(height: 18.h),
                Text("Password", style: TextManager.regular(fontSize: 16)),

                AppTextFormField(
                  validator: (text) {
                    if (text?.isEmpty ?? false) {
                      return "Password cannot be empty!";
                    }
                    return null;
                  },
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: _isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "or login ",
                      style: TextManager.regular().copyWith(
                        color: lightGreyLabel,
                      ),
                      children: [
                        TextSpan(
                          text: "As a Guest",
                          style: TextManager.regular().copyWith(
                            color: mainBlue,
                            decoration: TextDecoration.underline,
                            decorationColor: mainBlue,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 4.h),

                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextManager.medium().copyWith(
                        color: mainBlue,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 60.h),
          CustomElevatedButtom(
            height: 45,
            text: 'Sign In',
            OnPressed: () async {
              if (formKey.currentState!.validate())
                if (userType == "Equestrian User" &&
                    _phoneController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
               

                      Navigation().showLoadingGifDialog(context);

                  acc =
                      (await OuthApis().logIn(
                        phone: "+2${_phoneController.text}",
                        password: _passwordController.text,
                      ))!;

                  if (acc.status == 1) {
                    Navigation().closeDialog(context);

                    Navigation().goToScreenAndClearAll(
                      context,
                      (context) => HomeScreen(),
                    );
                    
                  }

                 else {
                    Navigation().closeDialog(context);
                    showDialog(
                      context: context,
                      builder:
                          (c) => OkDialog(
                            title:
                                "Please Chick your Credentils and \n Try Again ",
                          ),
                    );
                  }
                }

              if (userType == "Trainer User" &&
                  _emailController.text.isNotEmpty &&
                  _passwordController.text.isNotEmpty) {
                Navigation().goToScreen(
                  context,
                  (context) => HomeScreen(),
                  // goToScreenAndClearAll
                );
              }
            },

            colorButton: mainBlue,
            colorText: white,
          ),
        ],
      ),
    );
  }
}

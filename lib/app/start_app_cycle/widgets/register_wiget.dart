import 'package:equina_task/app/home_cycle/views/home_screen.dart';
import 'package:equina_task/app/start_app_cycle/services/outh_apis.dart';
import 'package:equina_task/widget/ok_dialog.dart';
import 'package:equina_task/widget/custom_text_form_field.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:equina_task/widget/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helpers/navigation_helper.dart';
import 'dialog_otp.dart';

class RegisterWiget extends StatefulWidget {
  const RegisterWiget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterWigetState createState() => _RegisterWigetState();
}

class _RegisterWigetState extends State<RegisterWiget> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController(text: "+2");
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isChecked = false;

  bool _isPasswordVisible = false;

  String numberVerif = "";
  late bool onVerif;
  int outhState = -1;


  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundGrey,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: TextManager.regular()),

                AppTextFormField(
                  validator: (text) {
                    if (text?.isEmpty ?? false) {
                      return "please enter valid value";
                    }
                    return null;
                  },
                  controller: _nameController,
                  hintText: "Name",
                ),
                SizedBox(height: 15.h),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Phone Number", style: TextManager.regular()),
                    Spacer(),
                    _phoneController.text.isNotEmpty &&
                            _phoneController.text == numberVerif &&
                            _phoneController.text.length == 11
                        ? Text(
                          "phone verified ",
                          style: TextManager.regular().copyWith(
                            color: fixErorr,
                          ),
                        )
                        : Text(
                          "phone not verified ",
                          style: TextManager.regular().copyWith(
                            color: redErorr,
                          ),
                        ),
                    SizedBox(width: 5.w),
                    _phoneController.text.isNotEmpty &&
                            _phoneController.text == numberVerif &&
                            _phoneController.text.length == 11
                        ? Image.asset(
                          "assets/images/checked.png",
                          height: 20.h,
                          width: 20.w,
                        )
                        : Image.asset(
                          "assets/images/red_cross.png",
                          height: 20.h,
                          width: 20.w,
                        ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: AppTextFormField(
                        validator: (text) {
                          if (text?.isEmpty ?? false) {
                            return "please enter valid value";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
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

                            outhState =
                                (await OuthApis().checkPhone(
                                  phoneNumber: "+2$phone",
                                ))!;
                            setState(() {});

                            if (outhState == 0) {
                              showDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                                builder: (context) => OkDialog(title: 'This Phone Number is Aleady Used!',),
                              ).then((value) {
                                setState(() {
                                  _phoneController.clear();
                                });
                              });
                            }
                          }
                        },
                      ),
                    ),

                    SizedBox(width: 3.h),

                    //TODO
                    if (_phoneController.text.length == 11 && outhState == 1)
                      Expanded(
                        flex: 3,
                        child: CustomElevatedButtom(
                          height: 43,
                          text: "Verify Number",
                          colorSize: 10,
                          OnPressed: () async {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => DialogOTP(
                                    phoneNumber: _phoneController.text,
                                  ),
                            ).then((value) {
                              setState(() {
                                value["stat"] == true;
                                numberVerif = value["number"];
                                onVerif = true;
                              });
                            });
                          },
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 15.h),

                Text("Password", style: TextManager.regular()),
                AppTextFormField(
                  validator: (text) {
                    if (text?.isEmpty ?? false) {
                      return "please enter valid value";
                    }
                    return null;
                  },
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed:
                        () => setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        }),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 15.h),

                Text("Confirm Password", style: TextManager.regular()),
                AppTextFormField(
                  validator: (text) {
                    if (text?.isEmpty ?? false) {
                      return "please enter valid value";
                    }
                    if (text != _passwordController.text) {
                      return "password must be matched! ";
                    }
                    return null;
                  },
                  controller: _confirmPasswordController,
                  hintText: "Confirm Password",
                  isPasswordField: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed:
                        () => setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        }),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ],
            ),
          ),

          SizedBox(height: 15.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                activeColor: mainBlue,
              ),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: TextManager.regular().copyWith(
                      fontSize: 15.sp,
                      color: lightGreyLabel,
                    ),
                    children: [
                      TextSpan(text: "I have read and agreed to the \n"),
                      TextSpan(
                        text: "Terms",
                        style: TextManager.regular().copyWith(
                          color: mainBlue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextManager.regular().copyWith(
                          color: mainBlue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 5.h),
          CustomElevatedButtom(
            text: 'Register',
            OnPressed:
                _phoneController.text.isNotEmpty &&
                        _phoneController.text == numberVerif &&
                        _phoneController.text.length == 11 &&
                        _isChecked
                    ? () {
                      if (_nameController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty &&
                          _passwordController.text ==
                              _confirmPasswordController.text) {
                        Navigation().goToScreen(
                          context,
                          (context) => HomeScreen(),
                          // goToScreenAndClearAll
                        );
                      }

                      if (_nameController.text.isEmpty ||
                          _passwordController.text.isEmpty ||
                          _passwordController.text.isEmpty ||
                          _confirmPasswordController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => OkDialog(title: 'Please Fill all data Fields!',),
                        );
                      }

                      if (formKey.currentState!.validate()) {}
                    }
                    : null,
            colorButton:
                _phoneController.text.isNotEmpty &&
                        _phoneController.text == numberVerif &&
                        _phoneController.text.length == 11 &&
                        _isChecked
                    ? mainBlue
                    : greyBorder,
            colorText:
                _phoneController.text.isNotEmpty &&
                        _phoneController.text == numberVerif &&
                        _phoneController.text.length == 11 &&
                        _isChecked
                    ? white
                    : tutorialBg,
          ),
        ],
      ),
    );
  }
}

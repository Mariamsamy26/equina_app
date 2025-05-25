import 'dart:async';

import 'package:equina_task/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../styles/text_mang.dart';

// ignore: must_be_immutable
class DialogOTP extends StatefulWidget {
  String phoneNumber;

  DialogOTP({super.key, required this.phoneNumber});

  @override
  State<DialogOTP> createState() => _DialogOTPState();
}

class _DialogOTPState extends State<DialogOTP> {
  late int _secondsRemaining = 60;
  late Timer _timer;
  FirebaseAuth auth = FirebaseAuth.instance;
  String otpcode = "";
  String verifId = "";
  bool dialogTimerStarted = false;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _secondsRemaining = 0;
        TextButton(
          onPressed: () {},
          child: Text(
            "Resent Code",
            style: TextManager.regular().copyWith(color: mainBlue),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // verifyPhoneNumber(
    //   otpcode: otpcode,
    //   verifId: verifId,
    //   phone: widget.phoneNumber,
    // );
    super.initState();
    _startTimer();
  }

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
          'Please Enter the Code sent to your \nMobile Number',
          style: TextManager.regular().copyWith(color: black),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 0.w),
              child: PinCodeTextField(
                cursorColor: mainDarkBlue,
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10.r),
                  borderWidth: 1.w,
                  activeBorderWidth: 1.w,
                  selectedBorderWidth: 1.w,
                  inactiveBorderWidth: 1.w,
                  fieldHeight: 40.h,
                  fieldWidth: 30.w,
                  activeFillColor: mainBlue.withAlpha(10),
                  activeColor: mainBlue,
                  selectedColor: mainBlue.withAlpha(120),
                  inactiveFillColor: white,
                  selectedFillColor: white,
                  inactiveColor: mainBlue,
                ),
                animationDuration: Duration(milliseconds: 150),

                enableActiveFill: true,
                keyboardType: TextInputType.number,
                onCompleted: (code) {
                  if (code == 111111.toString())
                    // ignore: curly_braces_in_flow_control_structures
                    Navigator.of(
                      context,
                    ).pop({"stat": true, "number": widget.phoneNumber});

                  // verifyPhoneNumber(
                  //   otpcode: code,
                  //   verifId: verifId,
                  //   phone: widget.phoneNumber,
                  // )
                  // .then(
                  //   (value) => {
                  //     if (FirebaseOTP.verifOTP = true)
                  //       {
                  //         (value) => {
                  //           Navigator.of(
                  //             context,
                  //           ).pop(FirebaseOTP.verifOTP = true),
                  //         },
                  //       },
                  //   },
                  // );

                },
              ),
            ),
            Text(_secondsRemaining.toString()),
            if (_secondsRemaining == 0)
              TextButton(
                onPressed: () {
                  _startTimer();
                  //  resend OTP logic
                },
                child: Text(
                  "Resend Code",
                  style: TextManager.regular().copyWith(color: mainBlue),
                ),
              ),
          ],
        ),
      ),
    );
  }

  //   Future<void> verifyPhoneNumber({
  //     required String otpcode,
  //     required String verifId,
  //     required String phone,
  //   }) async {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: phone,
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await auth
  //             .signInWithCredential(credential)
  //             .then(
  //               (value) => {
  //                 if (value.user != null && FirebaseOTP.verifOTP == true)
  //                   {print(' valueee ${value.user}')},
  //                 {print('suss')},
  //               },
  //             );
  //         print('confirmed');
  //       },
  //       codeSent: (String verificationId, int? resendToken) async {
  //         codeSent();
  //       },

  //       verificationFailed: (FirebaseAuthException e) {
  //         print('verificationFailed : $e');
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //     );
  //   }

  //  Future<void> codeSent() async {

  // try {
  //         String smsCode = otpcode;
  //         PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //           smsCode: smsCode,
  //           verificationId: verifId,
  //         );
  //         print("sent");
  //         FirebaseOTP.verifOTP = true;
  //       } catch (e) {
  //         print("error");
  //         FirebaseOTP.verifOTP = false;
  //       }

  // String smsCode = otpcode;
  // PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //   verificationId: verifId,
  //   smsCode: smsCode,
  // );
  // try {
  //   await auth
  //       .signInWithCredential(credential)
  //       .then(
  //         (value) => {
  //           if (value.user != null)
  //             {Navigator.of(context).pop(FirebaseOTP.verifOTP = true)},
  //         },
  //       );
  //   print("sent");
  //   FirebaseOTP.verifOTP = true;
  // } catch (e) {
  //   print("error");
  //   FirebaseOTP.verifOTP = false;
  //   print(e);
  // }
}
// }
// import 'package:equina_task/helpers/navigation_helper.dart' show Navigation;
// import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseOTP {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   static bool verifOTP = false;

  // Future<void> verifyPhoneNumber({
  //   required String otpcode,
  //   required String verifId,
  //   required String phone ,
  // }) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phone,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await auth
  //           .signInWithCredential(credential)
  //           .then(
  //             (value) => {
  //               if (value.user != null && FirebaseOTP.verifOTP == true)
  //                 {print(' valueee ${value.user}')},
  //                 {print('suss')},

  //             },
  //           );
  //       print('confirmed');
  //     },
  //     codeSent: (String verificationId, int? resendToken) async {
  //       try {
  //         String smsCode = otpcode;
  //         PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //           smsCode: smsCode,
  //           verificationId: verificationId,
  //         );
  //         print("sent");
  //         FirebaseOTP.verifOTP = true;
  //       } catch (e) {
  //         print("error");
  //         FirebaseOTP.verifOTP = false;
  //       }
  //     },


  //     verificationFailed: (FirebaseAuthException e) {
  //       print('verificationFailed : $e');
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

// }

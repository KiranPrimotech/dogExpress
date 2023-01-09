import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../utils/routes/app_routes.dart';

class PhoneAuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;

  /// Send OTP
  Future registerUser(
      {required String countryCode,
      required String mobile,
      String? verificationId,
      int? resendToken}) async {
    // EasyLoading.show();
    Loader.show(Get.context!);
    await auth.verifyPhoneNumber(
      phoneNumber: "${countryCode} ${mobile}",
      verificationCompleted: (PhoneAuthCredential credential) {
        // EasyLoading.dismiss();
        Loader.hide();
        print("completed ----  ${credential.smsCode}");
        Get.snackbar("Verification Code", "${credential.smsCode}",
            backgroundColor: Colors.black, colorText: Colors.white60);
        //   auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        //EasyLoading.dismiss();
        Loader.hide();
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
          Get.snackbar(
            "Verification",
            "The provided phone number is not valid.",
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        // EasyLoading.dismiss();
        Loader.hide();
        verificationId = verificationId;
        resendToken = resendToken;
        print("otp code ---- ${resendToken}");
        Get.toNamed(AppRoutes.verifyOtp);
      },
      timeout: const Duration(seconds: 25),
      forceResendingToken: resendToken,
      codeAutoRetrievalTimeout: (String verificationId) {
        // EasyLoading.dismiss();
        Loader.hide();
        verificationId = verificationId;
      },
    );
  }
}

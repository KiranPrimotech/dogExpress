import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../src/UI/card/shared_pref.dart';
import '../src/controller/setting_controller.dart';
import '../utils/localization/localization_String.dart';
import '../utils/routes/app_routes.dart';

class PhoneAuthenticationService {

  SettingController settingController = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId ="";

  /// Send OTP
  Future<String> registerUser(
      {required String countryCode,
      required String mobile,
      String? verificationId,
      int? resendToken,
      String? routes}) async {

    Loader.show(Get.context!);
    await auth.verifyPhoneNumber(
      phoneNumber: "${countryCode} ${mobile}",
      verificationCompleted: (PhoneAuthCredential credential) {
        Loader.hide();
        print("completed ----  ${credential.smsCode}");
        Get.snackbar("Verification Code", "${credential.smsCode}",
            backgroundColor: Colors.black, colorText: Colors.white60);
      },
      verificationFailed: (FirebaseAuthException e) {
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
        Loader.hide();
        this.verificationId= verificationId;
        resendToken = resendToken;
        print("otp code ---- ${resendToken}");
        Get.toNamed(routes!, arguments: "$verificationId");
      },
      timeout: const Duration(seconds: 25),
      forceResendingToken: resendToken,
      codeAutoRetrievalTimeout: (String verificationId) {
        Loader.hide();
        verificationId = verificationId;
      },
    );
    return this.verificationId??"null";
  }



  /// Otp Verification

  Future verifyOtp({required String verificationId,required String otp}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId:verificationId, smsCode: otp
    );
    print("Credential ----- ${credential.smsCode}");
    await auth.signInWithCredential(credential);

  }
  /// Submit SMS  Code
  Future submitCode({required String verificationId,required String otp}) async {

    try {

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId:verificationId, smsCode: otp
      );
      print("Credential ----- ${credential.smsCode}");
      await auth.signInWithCredential(credential);


      SharePreference.addStringToSF(LocalString.signKey, "login");
      settingController.getGoogleLoginValue();
      Get.until((route) => Get.currentRoute == AppRoutes.setting);

    }
    catch(e){
      Get.snackbar("Otp", "Otp Doesn't Match",snackPosition: SnackPosition.BOTTOM);

    }
  }
}

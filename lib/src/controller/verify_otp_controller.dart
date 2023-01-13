import 'dart:async';

import 'package:dog_news/src/controller/setting_controller.dart';
import 'package:dog_news/src/controller/signin_phone_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../feature/sign_phone_number.dart';
import '../../utils/localization/localization_String.dart';
import '../../utils/routes/app_routes.dart';
import '../UI/card/shared_pref.dart';

class VerifyOTPController extends GetxController{
  PhoneController phoneController = Get.find();
  SettingController settingController = Get.find();
  late int otp ;
  String newOtp= "";
  RxInt timerOtp = 30.obs;
  bool isLoading = false;

  // OTP timer
  Future<void>  otpTimer()async{
    timerOtp.value = 30;
    Timer.periodic(const Duration(seconds: 1), (timer) {

      if(timerOtp>0){
        timerOtp.value--;
      }else{
        timer.cancel();
      }
    });
  }

  /// Submit SMS  Code
  Future submitCode(String otp,String verificationId) async {
    isLoading = true ;
    try {

      PhoneAuthenticationService().verifyOtp(verificationId: verificationId, otp: otp);

      // PhoneAuthCredential credential = PhoneAuthProvider.credential(
      //     verificationId: verificationId, smsCode: otp
      // );
      // print("Credential ----- ${credential.smsCode}");
      // isLoading = false;
      // await phoneController.auth.signInWithCredential(credential);
      SharePreference.addStringToSF(LocalString.signKey, "login");
      settingController.getGoogleLoginValue();


      Get.until((route) => Get.currentRoute == AppRoutes.setting);

    }
    catch(e){
      isLoading = false;
      Get.snackbar("Otp", "Otp Doesn't Match",snackPosition: SnackPosition.BOTTOM);

    }
  }



  Future<bool> resendOTP({required String countryCode,required String phone}) async {
    print(" testing ---- ${countryCode} ${phone}");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${countryCode} ${phone}",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        phoneController.verificationId = verificationId;
        phoneController.resendToken = resendToken;
      },
      timeout: const Duration(seconds: 25),
      forceResendingToken:  phoneController.resendToken,
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId =  phoneController.verificationId;
      },
    );
    debugPrint("_verificationId: ${ phoneController.resendToken}");
    return true;
  }

  @override
  void onInit() {
    otpTimer();
    super.onInit();
  }
}
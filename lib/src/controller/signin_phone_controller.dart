
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../utils/routes/app_routes.dart';

class PhoneController extends GetxController{

  TextEditingController phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId="";
  String countyCode="";
  String phoneNumber="";
  int? resendToken;


  /// Send OTP
  Future registerUser( String countryCode, String mobile) async {
    EasyLoading.show();
    await auth.verifyPhoneNumber(

      phoneNumber: "${countyCode} ${mobile}",
      verificationCompleted: (PhoneAuthCredential credential) {
        EasyLoading.dismiss();
        print("completed ----  ${credential.smsCode}");
        Get.snackbar(
          "Verification Code",
          "${credential.smsCode}",
          backgroundColor: Colors.black,
          colorText: Colors.white60

        );
       //   auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        EasyLoading.dismiss();
        if (e.code == 'invalid-phone-number') {

          print('The provided phone number is not valid.');
          Get.snackbar(
            "Verification",
            "The provided phone number is not valid.",

          );
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        EasyLoading.dismiss();
       this.verificationId = verificationId;
       this.resendToken = resendToken;
       print("otp code ---- ${resendToken}");
          Get.toNamed(AppRoutes.verifyOtp);
      },
      timeout: const Duration(seconds: 25),
      forceResendingToken: resendToken,
      codeAutoRetrievalTimeout: (String verificationId) {
        EasyLoading.dismiss();
        this.verificationId =  verificationId;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
  }



}
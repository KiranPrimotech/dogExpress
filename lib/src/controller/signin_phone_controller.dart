import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../../feature/sign_phone_number.dart';
import '../../utils/routes/app_routes.dart';

class PhoneController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = "";
  String countyCode = "";
  String phoneNumber = "";
  int? resendToken;
  PhoneAuthenticationService service= PhoneAuthenticationService();

  /// send Otp
   sendOtpSubmit() async   {
       await  service.registerUser(countryCode: countyCode, mobile: phoneNumber).then((value){verificationId = value; print(" iddd -- $verificationId!");
         log("verification id $verificationId",name: "firebase verification idd");}) ;
       print(" iddd -- $verificationId");

  }
  /// Send OTP
  Future registerUser(String countryCode, String mobile) async {

    Loader.show(Get.context!);
    await auth.verifyPhoneNumber(
      phoneNumber: "${countyCode} ${mobile}",
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
        this.verificationId = verificationId;
        this.resendToken = resendToken;
        print("otp code ---- ${resendToken}");
        Get.toNamed(AppRoutes.verifyOtp);
      },
      timeout: const Duration(seconds: 25),
      forceResendingToken: resendToken,
      codeAutoRetrievalTimeout: (String verificationId) {
        // EasyLoading.dismiss();
        Loader.hide();
        this.verificationId = verificationId;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
  }
}

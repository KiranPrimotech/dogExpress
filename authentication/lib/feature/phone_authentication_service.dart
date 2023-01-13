import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

class PhoneAuthenticationService {
  final BuildContext context;
  final String? nextScreenRoute;

  FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId = "";

  PhoneAuthenticationService({required this.context, this.nextScreenRoute});

  /// Send OTP
  Future<String> registerUser(
      {required String countryCode,
      required String mobile,
      String? verificationId,
      int? resendToken,
      String? routes}) async {
    Loader.show(context);
    await auth.verifyPhoneNumber(
      phoneNumber: "$countryCode $mobile",
      verificationCompleted: (PhoneAuthCredential credential) {
        Loader.hide();
       // print("completed ----  ${credential.smsCode}");
        Get.snackbar("Verification Code", "${credential.smsCode}",
            backgroundColor: Colors.black, colorText: Colors.white60);
      },
      verificationFailed: (FirebaseAuthException e) {
        Loader.hide();
        if (e.code == 'invalid-phone-number') {
        //  print('The provided phone number is not valid.');
          Get.snackbar(
            "Verification",
            "The provided phone number is not valid.",
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        Loader.hide();
        this.verificationId = verificationId;
        resendToken = resendToken;
       // print("otp code ---- $resendToken");

        if (nextScreenRoute != null) {
          Navigator.of(context)
              .pushNamed(nextScreenRoute!, arguments: verificationId);
        } else {}
      },
      timeout: const Duration(seconds: 25),
      forceResendingToken: resendToken,
      codeAutoRetrievalTimeout: (String verificationId) {
        Loader.hide();
        verificationId = verificationId;
      },
    );
    return this.verificationId ?? "null";
  }

  /// Otp Verification
  Future verifyOtp(
      {required String verificationId, required String otp}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    ///print("Credential ----- ${credential.smsCode}");
    await auth.signInWithCredential(credential);
  }
}

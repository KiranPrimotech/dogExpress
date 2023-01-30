
import 'package:authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
   sendOtpSubmit(BuildContext context) async   {

       await AuthManager().phoneLogin(context: context, countryCode: countyCode, mobile: phoneNumber,routes: AppRoutes.verifyOtp);

  }
  /// Send OTP
  // Future registerUser(String countryCode, String mobile) async {
  //
  //   Loader.show(Get.context!);
  //   await auth.verifyPhoneNumber(
  //     phoneNumber: "$countyCode $mobile",
  //     verificationCompleted: (PhoneAuthCredential credential) {
  //
  //       Loader.hide();
  //       debugPrint("completed ----  ${credential.smsCode}");
  //       Get.snackbar("Verification Code", "${credential.smsCode}",
  //           backgroundColor: Colors.black, colorText: Colors.white60);
  //
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       Loader.hide();
  //       if (e.code == 'invalid-phone-number') {
  //         debugPrint('The provided phone number is not valid.');
  //         Get.snackbar(
  //           "Verification",
  //           "The provided phone number is not valid.",
  //         );
  //       }
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //
  //       Loader.hide();
  //       this.verificationId = verificationId;
  //       this.resendToken = resendToken;
  //       debugPrint("otp code ---- $resendToken");
  //       Get.toNamed(AppRoutes.verifyOtp);
  //     },
  //     timeout: const Duration(seconds: 25),
  //     forceResendingToken: resendToken,
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       // EasyLoading.dismiss();
  //       Loader.hide();
  //       this.verificationId = verificationId;
  //     },
  //   );
  // }

}

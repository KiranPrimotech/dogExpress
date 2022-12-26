import 'dart:async';

import 'package:get/get.dart';

class VerifyOTPController extends GetxController{
  late int otp ;
  String newOtp= "";
  RxInt timerOtp = 30.obs;

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
  @override
  void onInit() {
    otpTimer();
    super.onInit();
  }
}
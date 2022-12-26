import 'package:get/get.dart';

import '../controller/verify_otp_controller.dart';

class VerifyOTPBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => VerifyOTPController());
  }

}
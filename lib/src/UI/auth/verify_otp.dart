import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../feature/sign_phone_number.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/localization/localization_String.dart';
import '../../controller/verify_otp_controller.dart';

class VerifyOTPScreen extends GetView<VerifyOTPController> {
  final verificationId = Get.arguments ;

   VerifyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //print("widget id --- $verificationId");
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        title: LocalString.enterPhnNum.tr.text
            .color(AppColors.white)
            .size(18)
            .make(),
      ),
      body: Column(
        children: [
          otpWidget(context),
        ],
      ),
    );
  }

  Widget otpWidget(BuildContext context) {
    return SizedBox(
      height: Get.height * .4,
      child: SingleChildScrollView(
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() =>
                      "Detecting Passcode ${controller.timerOtp.value == 0 ? " " : "(${controller.timerOtp.value}s)"}"
                          .text
                          .size(20)
                          .bold
                          .black
                          .make()).pLTRB(20, 20, 20, 0),
                  "We have sent a 6-digit passcode on your Mobile "
                      .text
                      .color(Colors.grey)
                      .make()
                      .pLTRB(20, 7, 20, 0),
                  "number +${controller.phoneController.countyCode} ${controller.phoneController.phoneNumber}"
                      .text
                      .color(Colors.grey)
                      .make()
                      .px(20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 20,
                      fieldStyle: FieldStyle.underline,
                      outlineBorderRadius: 8,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 17, color: AppColors.black),
                      onChanged: (pin) {},
                      onCompleted: (pin) {
                        controller.newOtp = pin;
                        controller.submitCode(controller.newOtp,verificationId);
                      },
                    ),
                  ).px(10).py(20),
                  Obx(
                    () => "Resend Passcode"
                        .text
                        .color(controller.timerOtp.value == 0
                            ? Colors.black
                            : Colors.grey)
                        .size(16)
                        .make()
                        .onTap(() {
                      if (controller.timerOtp.value == 0) {
                        controller.otpTimer();

                      //  controller.resendOTP(countryCode:controller.phoneController.countyCode,phone: controller.phoneController.phoneNumber);
                        PhoneAuthenticationService().registerUser(countryCode: controller.phoneController.countyCode, mobile: controller.phoneController.phoneNumber);

                        //controller.phoneController.registerUser(controller.phoneController.countyCode,controller.phoneController.phoneNumber );
                      }
                    }).pLTRB(20, 20, 20, 10),
                  )
                ],
              ),
      ),
    );
  }
}

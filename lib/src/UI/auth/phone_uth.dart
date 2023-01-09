import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/app_colors.dart';
import '../../controller/signin_phone_controller.dart';

class PhoneAuthScreen extends GetView<PhoneController> {
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            IntlPhoneField(
              controller: controller.phoneController,
              dropdownIcon: const Icon(
                Icons.arrow_drop_down_outlined,
                color: Colors.black,
              ),
              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                iconColor: AppColors.black,
                labelText: 'Phone Number',
                labelStyle:
                    const TextStyle(color: Colors.black, letterSpacing: 1.3),
                border: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderSide: const BorderSide(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(1.5)),
                focusedBorder: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderSide: const BorderSide(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(1.5)),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                controller.countyCode = phone.countryCode;
                controller.phoneNumber = phone.number;

                print(phone.countryCode);
                print(controller.phoneNumber);
              },
            ).pLTRB(12, 25, 12, 10),
            SizedBox(
              width: Get.width * .9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.black,
                  backgroundColor: AppColors.black,
                ),
                onPressed: () {
                  controller.registerUser(
                      controller.countyCode, controller.phoneNumber);
                  //  Get.toNamed(AppRoutes.verifyOtp);
                },
                child: "VERIFY PHONE NUMBER "
                    .tr
                    .text
                    .color(AppColors.white)
                    .make()
                    .p(8),
              ),
            ).py(10),
            LocalString.verifyOtpDec.tr.text
                .maxLines(3)
                .color(AppColors.gray)
                .make()
                .p(10),
          ],
        ),
      ),
    );
  }
}

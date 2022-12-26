import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthWidget {
  Widget optionWidget(
      {Color? bckClr,
      Color? textClr,
      String? title,
      String? imagePath,
      required Function onTap}) {
    return InkWell(
      onTap:()=> onTap(),
      child: Container(
        width: Get.width *.7,
        decoration: BoxDecoration(
            color: bckClr,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 3,spreadRadius: 2,offset:  Offset(0.0, 0.75))]),
        child: Row(
          children: [
            Image.asset(imagePath!,height: 20,width: 20,).px(8),
            title!.tr.text.color(textClr).make().px(8),
          ],
        ).p(8),
      ).py(10).px(20),
    );
  }
}

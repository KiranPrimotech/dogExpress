import 'package:dog_news/src/model/enumClass.dart';
import 'package:dog_news/utils/app_text.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/app_colors.dart';
import '../../../controller/relevancy_controller.dart';

class RelevancyWidget {
  RelevancyController controller = Get.find();
  /// Relevancy Option
  Widget headingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        relevancyOption(title: LocalString.allNews, color: AppColors.green),
        relevancyOption(title: LocalString.majorNews, color: AppColors.yellow),
        relevancyOption(title: LocalString.noNews, color: AppColors.red),
      ],
    ).p(12);
  }

  /// Relevancy Option Items
  Widget relevancyOption({required String title, required Color color}) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 16,
          color: color,
        ),
        AppText(
          title,
          fontWeight: FontWeight.w700,
        ).px(4),
      ],
    );
  }

  /// Relevancy List
  Widget relevancyList() {
    return SizedBox(
      child: Obx(()=>
         ListView.builder(
            itemCount: controller.map1.length,
            itemBuilder: (BuildContext context, int index) {
              return relevancyListItem( controller.map1.keys.elementAt(index));
            }),
      ),
    );
  }

  /// Relevancy List Items

  Widget relevancyListItem(String key) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         AppText(
          "${key}",
          fontWeight: FontWeight.w600,
          fontSize: TextSizes.normal,
        ).expand(),
        Obx(()=>
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){

                  controller.onValueChange(key, 0);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: controller.map1[key] == 0 ?AppColors.primary :Colors.transparent, width: 3),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.circle,
                    size: 25,
                    color: AppColors.green,
                  ).centered(),
                ),
              ),
              GestureDetector(
                onTap: (){

                  controller.onValueChange(key, 1);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: controller.map1[key] == 1 ?AppColors.primary :Colors.transparent, width: 3),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.circle,
                    size: 25,
                    color: AppColors.yellow,
                  ).centered(),
                ).px(8),
              ),
              GestureDetector(
                onTap: (){

                  controller.onValueChange(key, 2);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: controller.map1[key] == 2 ?AppColors.primary :Colors.transparent, width: 3),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.circle,
                    size: 25,
                    color: AppColors.red,
                  ).centered(),
                ),
              ),
            ],
          ).expand(),
        )
      ],
    ).px(14).py(12);
  }
}

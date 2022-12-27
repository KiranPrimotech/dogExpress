import 'package:dog_news/utils/app_text.dart';
import 'package:dog_news/utils/app_themes/app_theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../utils/localization/localization_String.dart';
import '../../../../controller/topic_card_controller.dart';

class TopicCardWidget {
  TopicCardController controller = Get.find();
  ThemeController themeController = Get.find();

  //  Animated app bar
  Widget animatedAppBar() {
    return AnimatedBuilder(
        animation: controller.appBarAnimationController,
        builder: (context, child) {
          return Transform.translate(
              offset: Offset(
                  0.0,
                  (controller.appBarAnimationController.value - 1) *
                      controller.appBarHeight),
              child: appBar());
        });
  }

  /// App Bar
  Widget appBar() {
    return Obx(
      () => Container(
        color: themeController.appBarColor.value,
        height: controller.appBarHeight,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                     // print("preeeeeeeesssed");
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios_new)),
                AppText(LocalString.topic).px(10),
              ],
            ),
           // const Icon(Icons.download).px(8),
          ],
        ),
      ),
    );
  }

  ///  Animated bottom bar
  Widget animatedBottomBar() {
    return AnimatedBuilder(
        animation: controller.bottomBarAnimationController,
        builder: (context, child) {
          return Transform.translate(
              offset: Offset(
                  0.0,
                  -(controller.bottomBarAnimationController.value - 1) *
                      controller.appBarHeight),
              child: Obx(
                () => Container(
                  height: controller.appBarHeight,
                  color: themeController.appBarColor.value,
                  width: Get.width,
                  child: bottomBarItems(),
                ),
              ));
        });
  }

  /// bottom bar items

  Widget bottomBarItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.circle,
              size: 14,
            ),
            "Relevancy".text.size(12).make()
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.share,
              size: 14,
            ),
            "Share".text.size(12).make()
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bookmark,
              size: 14,
            ),
            "Bookmark".text.size(12).make()
          ],
        )
      ],
    ).px(6).py(5);
  }
}

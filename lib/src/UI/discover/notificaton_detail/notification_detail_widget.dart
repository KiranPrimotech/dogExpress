import 'package:dog_news/src/controller/home_controller.dart';
import 'package:dog_news/utils/app_text.dart';
import 'package:dog_news/utils/app_themes/app_theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/localization/localization_String.dart';
import '../../../../utils/sizes_config.dart';
import '../../../controller/home_controller.dar.dart';

class NotificationDetailWidget {
  HomeController homeController = Get.find();
  ThemeController themeController = Get.find();

  //  Animated app bar
  Widget animatedAppBar() {
    return AnimatedBuilder(
        animation: homeController.appBarAnimationController,
        builder: (context, child) {
          return Transform.translate(
              offset: Offset(
                  0.0,
                  (homeController.appBarAnimationController.value - 1) *
                      homeController.appBarHeight),
              child: appBar());
        });
  }

  /// App Bar
  Widget appBar() {
    return Obx(
      () => Container(
        color: themeController.appBarColor.value,
        height: homeController.appBarHeight,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      print("preeeeeeeesssed");
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios_new,size: Dimens.mediumIcon,)),
                AppText(LocalString.notification).px(10),
              ],
            ),
             Icon(Icons.download,size:Dimens.mediumIcon).px(8),
          ],
        ),
      ),
    );
  }

  ///  Animated bottom bar
  Widget animatedBottomBar() {
    return AnimatedBuilder(
        animation: homeController.bottomBarAnimationController,
        builder: (context, child) {
          return Transform.translate(
              offset: Offset(
                  0.0,
                  -(homeController.bottomBarAnimationController.value - 1) *
                      homeController.appBarHeight),
              child: Obx(
                () => Container(
                  height: homeController.appBarHeight,
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              size: 14.h,
            ),
            "Relevancy".text.size(12.h).make()
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.share,
              size: 14.h,
            ),
            "Share".text.size(12.h).make()
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark,
              size: 14.h,
            ),
            "Bookmark".text.size(12.h).make()
          ],
        ),
      ],
    ).px(6).py(5);
  }
}

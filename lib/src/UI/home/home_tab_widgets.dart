import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/app_colors.dart';
import '../../controller/home_controller.dar.dart';

mixin MixinHomeTabWidgets {
  HomeController controller = Get.find();
  


  /** Note :  Discover action button is implemented using stack in [appBar] widget **/


  ///  Animated app bar
  Widget animatedAppBar() {
    return AnimatedBuilder(
        animation: controller.appBarAnimationController,
        builder: (context, child) {
          return Transform.translate(offset: Offset(0.0,(controller.appBarAnimationController.value-1)*controller.appBarHeight),child: appBar());
        });
  }
  ///  Animated bottom bar
  Widget animatedBottomBar() {
    return AnimatedBuilder(
        animation: controller.bottomBarAnimationController,
        builder: (context, child) {
          return Transform.translate(offset: Offset(0.0,-(controller.bottomBarAnimationController.value-1)*controller.appBarHeight),child: Container(height: controller.appBarHeight,width: Get.width,color: Colors.white,
          child: bottomBarItems(),));
        });
  }

  /// bottom bar items

  Widget bottomBarItems(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(Icons.circle,size: 14,color: AppColors.primary,),
            "Relevancy".text.size(12).color(AppColors.gray).make()
          ],
        ),
        Column(
          children: [
            Icon(Icons.share,size: 14,color: AppColors.primary,),
            "Share".text.size(12).color(AppColors.gray).make()
          ],
        ),
        Column(
          children: [
            Icon(Icons.bookmark,size: 14,color: AppColors.primary,),
            "Bookmark".text.size(12).color(AppColors.gray).make()
          ],
        )
      ],
    ).px(6).py(5);
  }

  /// App Bar
  Widget appBar() {
    return Container(
      color: Colors.white,
      height: controller.appBarHeight,
      child: Obx(()=>
        Row(
          children: [
            /// Left Side Widgets of App Bar
            leftAppBarActions(),
            Stack(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: Get.width * .8,
                  child: PageView(
                    allowImplicitScrolling: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: controller.appBarTab,
                    children: <Widget>[
                      appBarTile(
                        caption: LocalString.discover,
                        onTap: () => controller.homeFunctions(
                            action: HomeFunctions.discoverBar),
                      ),
                      Obx(() =>
                       appBarTile(
                          caption: '${controller.title.value}',
                          onTap: () => controller.homeFunctions(
                              action: HomeFunctions.feedBar),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Discover Action button
                AnimatedBuilder(
                 animation: controller.appBarAnimationController,
                  builder : (context , child)=> Transform.translate(
                    offset: Offset(0.0,(controller.appBarAnimationController.value-1)*controller.appBarHeight),
                    child: appBarActionButtons(
                      visible: controller.checkVisibility(
                          check: VisibilityEnum.dashboard)!,
                      onTap: () =>
                          controller.homeFunctions(action: HomeFunctions.search),
                      icon: Icons.search,
                    ),
                  ),
                ),
              ],
            ),

            /// Right Side Widgets of App Bar
            rightAppBarActions(),
          ],
        ),
      ),
    );
  }

  /// Left Side Widgets of App Bar
  Widget leftAppBarActions() {
    return Column(
      children: [
        appBarActionButtons(
          visible: controller.checkVisibility(check: VisibilityEnum.dashboard)!,
          icon: Icons.settings,
          onTap: () => controller.homeFunctions(action: HomeFunctions.setting),
        ),
        appBarActionButtons(
          visible: controller.checkVisibility(check: VisibilityEnum.feeds)!,
          icon: Icons.arrow_back_ios_new,
          onTap: () => controller.homeFunctions(action: HomeFunctions.backIcon),
        ),
        appBarActionButtons(
          visible: controller.checkVisibility(
              check: VisibilityEnum.invisbleHomeIcon)!,
          onTap: () {},
        ),
      ],
    );
  }

  /// Right Side Widgets of App Bar
  Widget rightAppBarActions() {
    return Column(
      children: [
        appBarActionButtons(
          visible: controller.checkVisibility(check: VisibilityEnum.dashboard)!,
          icon: Icons.arrow_forward_ios,
          onTap: () =>
              controller.homeFunctions(action: HomeFunctions.forwardIcon),
        ),
        appBarActionButtons(
          visible: controller.checkVisibility(check: VisibilityEnum.feeds)!,
          icon: Icons.refresh,
          onTap: () => controller.homeFunctions(action: HomeFunctions.refresh),
        ),
        appBarActionButtons(
          visible: controller.checkVisibility(
              check: VisibilityEnum.invisbleHomeIcon)!,
          onTap: () {},
        ),
      ],
    );
  }

  /// App bar tiles
  Widget appBarTile({required String caption, required Function onTap}) {
    return GestureDetector(
      onTap: onTap(),
      child: SizedBox(
        width: caption == LocalString.discover
            ? (Get.width - 60) * .4
            : (Get.width - 60) * .5,
        height: controller.appBarHeight,
        child: Center(
          child: Text(
            caption.tr,
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  /// App bar action buttons
  Widget appBarActionButtons(
      {required bool visible, IconData? icon, required Function onTap}) {
    return GestureDetector(
      onTap: onTap(),
      child: Visibility(
        visible: visible,
        child: SizedBox(
          height: controller.appBarHeight,
          width: Get.width * .1,
          child: icon != null ? Icon(icon,color: AppColors.primary,) : const SizedBox(),
        ),
      ),
    );
  }
}

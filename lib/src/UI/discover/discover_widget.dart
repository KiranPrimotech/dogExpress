import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_news/src/controller/discover_controller.dart';
import 'package:dog_news/src/controller/notifiocation_detail_controller.dart';
import 'package:dog_news/src/model/enumClass.dart';
import 'package:dog_news/utils/app_text.dart';
import 'package:dog_news/utils/app_themes/app_theme_controller.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/image_path_network.dart';
import '../../../utils/routes/app_routes.dart';
import '../../../utils/sizes_config.dart';
import '../../controller/home_controller.dar.dart';

class DiscoverWidget {
  DiscoverController controller = Get.find();
  HomeController homeController = Get.find();
  NotificationDetailController notificationDetailController = Get.find();
  ThemeController themeController = Get.find();

  /// search Widget
  Widget searchWidget() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.search);
      },
      child: Obx(
        () => Container(
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 3)],
              color: themeController.searchColor.value),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search_outlined,
                color: AppColors.primary,
                size: 20,
              ).centered(),
              AppText.medium(
                LocalString.searchNews.tr,
                color: themeController.searchHintColor.value,
              ).centered().px(4)
              // LocalString.searchNews.tr.text.make().px(4)
            ],
          ).p(8),
        ).p(10),
      ),
    );
  }

  Widget puzzleQuoteWidget() {
    return SizedBox(
      height: 110.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            puzzleQuoteWidgetItem(ImagePathNetwork.puzzle, () {
              Get.toNamed(AppRoutes.puzzleScreen);
            }),
            puzzleQuoteWidgetItem(ImagePathNetwork.quote, () {
              Get.toNamed(AppRoutes.quoteScreen);
            }),
          ],
        ),
      ),
    );
  }

  /// Puzzle Quote Widget
  Widget puzzleQuoteWidgetItem(String image, Function onTap) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: 180.w,
        height: 110.h,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.grey.shade500, blurRadius: 3)]),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ).p(10),
      ).p(10),
    );
  }

  /// Feed Option
  Widget feedOptionWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12).h,
      child: SizedBox(
        //  color: Colors.yellow,
        height: 100.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.feedList.length,
            itemBuilder: (BuildContext context, int index) {
              return feedItemsWidget(controller.feedList, index).px(20);
            }),
      ),
    );
  }

  /// Feed Option Items
  Widget feedItemsWidget(List<Map<String, dynamic>> feedList, int index) {
    return GestureDetector(
      onTap: () {

        homeController.homeTab.animateToPage(1,
            duration: homeController.durationLong, curve: Curves.easeInOut);
        homeController.appBarTab.animateToPage(1,
            duration: homeController.durationLong, curve: Curves.easeInOut);

        homeController.title.value = feedList[index]['name'];
        // homeController.   bottomBarAnimationController.reverse(from: 50);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            controller.feedList[index]['image'],
            size: Dimens.extraLargeIcon.h,
            color: AppColors.primary,
          ),
          Obx(
            () => AppText.medium(
              "${feedList[index]['name']}",
              fontWeight: FontWeight.w600,
              color: themeController.headingColor.value,
            ).py(10),
          ),
          //"${feedList[index]['name']}".text.make().py(10),
        ],
      ),
    );
  }

  /// Heading Widget
  Widget notificationHeading(String heading, String title, Function onTap) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 10, bottom: 10, right: 16).h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => AppText(
                    heading.tr,
                    fontWeight: FontWeight.w800,
                    color: themeController.headingColor.value,
                  )),
              Obx(
                () => Container(
                  height: 2.h,
                  width: 30.w,
                  color: themeController.dividerColor.value,
                ),
              )
            ],
          ),
          InkWell(
              onTap: () => onTap(),
              child: AppText.small(title.tr,
                  color: AppColors.primary, fontWeight: FontWeight.w600))
        ],
      ),
    );
  }

  /// Notification List widget
  Widget notificationListWidget() {
    return SizedBox(
      height: 75 * 4.h,
      child: ListView.builder(
          itemCount: controller.notificationList.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return notificationItemsWidget(controller.notificationList, index);
          }),
    );
  }

  /// Notification List Items
  Widget notificationItemsWidget(
      List<Map<String, dynamic>> notificationList, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.notificationDetail);
      },
      child: SizedBox(
        height: 75.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10).r,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * .7,
                    child: AppText.medium(
                      "${notificationList[index]['name']}",
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade400, blurRadius: 4)
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0).r,
                      child: CachedNetworkImage(
                        height: 57.h,
                        width: 57.h,
                        fit: BoxFit.cover,
                        imageUrl: notificationList[index]['image'],
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.h,
            )
          ],
        ),
      ),
    );
  }

  /// Insight
  Widget insightListWidget() {
    final ScrollController horizontal =
        ScrollController(initialScrollOffset: 50.0);

    return SizedBox(
      height: Get.height * .4,
      child: ListView.builder(
          itemCount: controller.insightList.length,
          controller: horizontal,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return insightItemsWidget(controller.insightList, index);
          }),
      // ),
    );
  }

  /// Insight List Items
  Widget insightItemsWidget(List<Map<String, dynamic>> insightList, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.insightScreen);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0),
            //  border: Border.all(color: AppColors.grey,width: 0.5),
            boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5)]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            height: Get.width * .4,
            width: Get.width * .4,
            fit: BoxFit.cover,
            imageUrl: insightList[index]['image'],
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ).p(10),
    );
  }

  /// Poll List View
  Widget pollListWidget() {
    return SizedBox(
      height: Get.width * .8 * 6 / 10 + 220.h,
      child: ListView.builder(
          itemCount: controller.pollList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return pollItemsWidget(controller.pollList, index);
          }),
    );
  }

  /// Poll Widget
  Widget pollItemsWidget(List<Map<String, dynamic>> pollList, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.pollScreen);
      },
      child: SizedBox(
        width: Get.width * .8,
        height: Get.width * .8 * 6 / 10 + 220.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6.0),
                        topRight: Radius.circular(6.0)),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade400, blurRadius: 5)
                    ]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6.0),
                      topRight: Radius.circular(6.0)),
                  child: CachedNetworkImage(
                    height: Get.width * .8 * 6 / 10,
                    width: Get.width * .8,
                    fit: BoxFit.cover,
                    imageUrl: pollList[index]['image'],
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                )).p(10),
            SizedBox(
              height: 220.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(
                    "${pollList[index]['description']}",
                    maxLines: 4,
                  ).px(8).py(5).expand(),
                  Obx(() => AppText(
                        "Do you personally own a pet?",
                        fontWeight: FontWeight.w800,
                        color: themeController.headingColor.value,
                      ).px(8).py(8)),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            border:
                                Border.all(color: AppColors.grey, width: 1)),
                        child: AppText(
                          LocalString.yes.tr,
                          color: AppColors.primary,
                        ).centered().p(4),
                      ).expand(),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            border:
                                Border.all(color: AppColors.grey, width: 1)),
                        child: AppText(
                          LocalString.no.tr,
                          color: AppColors.primary,
                        ).centered().p(4),
                      ).expand(),
                    ],
                  ).px(8).py(10)
                ],
              ),
            ).expand(),
          ],
        ),
      ),
    );
  }

  /// Topic List
  Widget itemsList() {
    return SizedBox(
      height: 220,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: controller.PAGER_HEIGHT,
            child: NotificationListener<ScrollNotification>(
              child: PageView.builder(
                onPageChanged: (pos) {
                  controller.currentPage.value = pos;

                },
                physics: const BouncingScrollPhysics(),
                controller: controller.pageController,
                itemCount: controller.topicList.length,
                itemBuilder: (context, index) {
                  return circleOffer(
                    controller.topicList[index]['image']!,
                    index,
                  );
                },
              ),
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification) {
                  controller.page.value = controller.pageController.page!;
                }
                controller.update();
                return true;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(() => AppText.large(
                  "${controller.topicList[controller.currentPage.value]['name']!}",
                  fontSize: TextSizes.large,
                  color: AppColors.primary,
                ).centered()),
          ),
        ],
      ),
    );
  }

  /// Topic List Item
  Widget circleOffer(String image, int index) {
    return Align(
      alignment: Alignment.center,
      child: GetBuilder<DiscoverController>(
        init: controller,
        builder: (controller) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: controller.PAGER_HEIGHT * controller.getScale(index).value,
          width: controller.PAGER_HEIGHT * controller.getScale(index).value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade200, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.fill,
                  height: 100,
                  width: 100,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),


              ).expand(),
            ],
          ),
        ),
      ),
    );
  }

  ///Topics PAge View
  Widget pageTopicNotifications() {
    return SizedBox(
        height: 300.h,
        child: PageView.builder(
          controller: controller.topicNotificationPageController,
          itemBuilder: (ctx, index) {
            return notificationListWidget();
          },
          itemCount: 20,
          physics: const NeverScrollableScrollPhysics(),
        ));
  }
}

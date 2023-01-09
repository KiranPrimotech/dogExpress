import 'package:dog_news/src/UI/dummy_widget.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:dog_news/utils/shimmer/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/localization/localization_String.dart';
import 'discover_widget.dart';

class DiscoverScreen extends StatelessWidget with DiscoverWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),

                /// Search Screen
                searchWidget().pLTRB(0, 10, 0, 0),

                /// Puzzle and quote
                Obx(
                  () => controller.loading.value
                      ? ShimmerLoader(child: puzzleQuoteWidget())
                      : puzzleQuoteWidget(),
                ),

                /// Feed Option
                feedOptionWidget(),

                /// Notification
                notificationHeading(
                    LocalString.notification, LocalString.viewAll, () {
                  Get.toNamed(AppRoutes.notificationPagerScreen);
                }),

                /// Notification List Widget
                Obx(
                  () => controller.loading.value
                      ? DummyWidget().notificationListWidgetShimmer()
                      : notificationListWidgte(),
                ),

                /// Insight
                notificationHeading(LocalString.insight, LocalString.viewAll,
                    () {
                  Get.toNamed(AppRoutes.insightScreen);
                }).pLTRB(0, 16, 0, 0),

                /// insight list item
                Obx(
                  () => controller.loading.value
                      ? DummyWidget().insightListWidgetShimmer()
                      : insightListWidget(),
                ),

                /// Topic
                notificationHeading(LocalString.topic, LocalString.viewAll, () {
                  Get.toNamed(AppRoutes.topicScreen);
                }).pLTRB(0, 16, 0, 0),

                /// Topic List Items
               Obx(
                  () => controller.loading.value
                      ? DummyWidget().topicItemsListShimmer()
                      : itemsList(),
                ),

                /// Topic List Notification
                Obx(
                  () => controller.loading.value
                      ? DummyWidget().notificationListWidgetShimmer()
                      : pageTopicNotifications(),
                ),

                /// Polll
                notificationHeading(LocalString.poll, LocalString.viewAll, () {
                  Get.toNamed(AppRoutes.pollPagerScreen);
                }).pLTRB(0, 16, 0, 0),

                /// Poll List Items
                Obx(
                  () => controller.loading.value
                      ? DummyWidget().pollListWidgetShimmer()
                      : pollListWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

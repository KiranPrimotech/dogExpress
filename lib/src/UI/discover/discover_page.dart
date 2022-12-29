import 'package:dog_news/utils/routes/app_routes.dart';
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
            padding: const EdgeInsets.only(left: 0,right: 0),
            child: Column(
              children: [
                 SizedBox(
                  height: 50.h,
                ),

                /// Search Screen
                searchWidget().pLTRB(0, 10, 0, 0),

                /// Puzzle and quote
                 puzzleQuoteWidget(),

                /// Feed Option
                feedOptionWidget(),

                /// Notification
                notificationHeading(LocalString.notification, LocalString.viewAll, () {
                  Get.toNamed(AppRoutes.notificationDetail);
                }),


                /// Notification List Widget
                notificationListWidgte(),

                /// Insight
                notificationHeading(LocalString.insight, LocalString.viewAll, () {
                  Get.toNamed(AppRoutes.insightScreen);
                }).pLTRB(0, 16, 0, 0),
                insightListWidget(),

                /// Topic
                notificationHeading(LocalString.topic, LocalString.viewAll, () {
                  Get.toNamed(AppRoutes.topicScreen);
                }).pLTRB(0, 16, 0, 0),
                itemsList(),
                pageTopicNotifications(),

                /// Polll
                notificationHeading(LocalString.poll, LocalString.viewAll, () {
                  Get.toNamed(AppRoutes.pollScreen);
                }).pLTRB(0, 16, 0, 0),
                pollListWidget(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

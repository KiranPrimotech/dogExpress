import 'package:dog_news/utils/image_path_network.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/localization/localization_String.dart';
import 'discover_widget.dart';
import 'package:card_swiper/card_swiper.dart';

class DiscoverScreen extends StatelessWidget with DiscoverWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),

              /// Search Screen
              searchWidget().pLTRB(0, 10, 0, 0),

              /// Puzzle and quote
              SizedBox(
                height: 110,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,


                  child: Row(
                    children: [
                      puzzleQuoteWidget(ImagePathNetwork.puzzle, () {
                        Get.toNamed(AppRoutes.puzzleScreen);
                      }),
                      puzzleQuoteWidget(ImagePathNetwork.quote, () {
                        Get.toNamed(AppRoutes.quoteScreen);
                      }),
                    ],
                  ),
                ),
              ),

              // SizedBox(
              //   height:110,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 2,
              //       itemBuilder: (BuildContext context, int index){
              //     return puzzleQuoteWidget();
              //   }),
              // ),

              /// Feed Option
              feedOptionWidget(),

              /// Notification
              notificationHeading(LocalString.notification, LocalString.viewAll,
                  () {
                Get.toNamed(AppRoutes.notificationDetail);
              }),

              notificationListWidgte(),

              /// Insight
              notificationHeading(LocalString.insight, LocalString.viewAll, () {
                Get.toNamed(AppRoutes.insightScreen);
              }).pLTRB(0, 10, 0, 0),
              insightListWidget(),

              /// Polll
              notificationHeading(LocalString.poll, LocalString.viewAll, () {
                Get.toNamed(AppRoutes.pollScreen);
              }).pLTRB(0, 10, 0, 0),
              pollListWidget(),
             // itemsList(),
            ],
          ),
        ),
      ),
    );
  }
}

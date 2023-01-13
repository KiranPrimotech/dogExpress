import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_news/utils/app_themes/app_theme_controller.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../controller/notifiocation_detail_controller.dart';
import '../../../controller/search_controller.dart';

class SearchWidget {
  SearchController searchController = Get.find();
  NotificationDetailController controller = Get.find();
  ThemeController themeController = Get.find();

  Widget tabWidget() {
    return Column(
      children: [
        const TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            tabs: [
              Tab(
                text: 'Shorts',
              ),
              Tab(
                text: 'Topic',
              ),
            ]),
        TabBarView(children: [
          shortWidget(),
          topicWidget(),
        ]).expand()
      ],
    );
  }

  /// Shorts Widget
  Widget shortWidget() {
    return ListView.builder(
        itemCount: searchController.shortList.length,
        itemBuilder: (BuildContext context, int index) {
          return shortListItem(searchController.shortList, index);
        });
  }

  /// Short List Item
  Widget shortListItem(List<Map<String, dynamic>> shortList, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.topicCardScreen);
        controller.title.value = "Shorts";
      },
      child: Row(
        children: [
          SizedBox(
            height: Get.width * .15 * 8 / 6,
            width: Get.width * .18,
            child: CachedNetworkImage(
              imageUrl: "${shortList[index]['image']}",
              width: Get.width * .1,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: Get.width * .15 * 8 / 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: Get.width * .8 - 10,
                  color: Colors.transparent,
                ),
                Row(
                  children: [
                    SizedBox(
                        //height: Get.width * .15 * 8/6,
                        width: Get.width * .6 - 10,
                        child: "${shortList[index]['description']}"
                            .text
                            .base
                            .make()
                            .centered()),
                    Container(
                      alignment: Alignment.bottomRight,
                      height: Get.width * .15 * 8 / 6 - 2,
                      width: Get.width * .22 - 10,
                      child: "2mo ago".text.size(12).base.make().py4(),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: Get.width * .8 - 10,
                  color: Colors.grey,
                )
              ],
            ).px(5),
          )
        ],
      ),
    );
  }

  /// Topic Widget
  Widget topicWidget() {
    return ListView.builder(
        itemCount: searchController.topicList.length,
        itemBuilder: (BuildContext context, int index) {
          return topicListItem(searchController.topicList, index);
        });
  }

  /// topic List Items
  Widget topicListItem(List<Map<String, dynamic>> topicList, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.topicCardScreen);
        controller.title.value = topicList[index]['name'];
      },
      child: Obx(
        () => Chip(
          elevation: 1,
          backgroundColor: themeController.appBarColor.value,
          shape: StadiumBorder(
              side: BorderSide(
                  width: 1, color: themeController.topicBorderColor.value)),
          shadowColor: Colors.black,
          label: Text(
            "${topicList[index]['name']}",
            style: TextStyle(
                fontSize: 14, color: themeController.topicBorderColor.value),
          ).px(10),
        ).pLTRB(0, 10, 0, 0),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_news/utils/image_path_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/app_colors.dart';
import '../../../controller/search_controller.dart';

class SearchWidget {
  SearchController searchController = Get.find();

  Widget tabWidget() {
    return Column(
      children: [
        const TabBar(
            labelStyle:
                TextStyle(fontWeight: FontWeight.w600, fontSize: 16),

            tabs: [
              Tab(
                text: 'Shorts',
              ),
              Tab(
                text: 'Topic',
              ),
            ]),
        SingleChildScrollView(
          child: SizedBox(
            height: Get.height * .9,
            child: TabBarView(children: [
              shortWidget(),
              topicWidget(),
            ]),
          ),
        ).expand()
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
    return Row(
      children: [
        SizedBox(
          height: Get.width * .15 * 8 / 6,
          width: Get.width * .18,
          child: CachedNetworkImage(
            imageUrl: "${shortList[index]['image']}",
            width: Get.width * .1,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
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
                      child: "${shortList[index]['name']}"
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
    );
  }

  Widget topicWidget() {
    return ListView.builder(
        itemCount: searchController.topicList.length,
        itemBuilder: (BuildContext context, int index) {
          return topicListItem(searchController.topicList, index);
        });
  }

  Widget topicListItem(List<Map<String, dynamic>> topicList, int index) {
    return Chip(
      elevation: 1,
      //padding: EdgeInsets.all(),
     // backgroundColor: Colors.transparent,
      shape:
          StadiumBorder(side: BorderSide(width: 1,)),
      shadowColor: Colors.black,

      label: Text(
        "${topicList[index]['name']}",
        style:
            TextStyle(fontSize: 14,),
      ).px(10),
    ).pLTRB(0, 10, 0, 0);
  }
}

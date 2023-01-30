import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_news/src/controller/notifiocation_detail_controller.dart';
import 'package:dog_news/utils/app_text.dart';
import 'package:dog_news/utils/app_themes/app_theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/routes/app_routes.dart';
import '../../../controller/topic_controller.dart';

class TopicWidget {
  TopicController controller = Get.find();
  NotificationDetailController topicCardController = Get.find();
  ThemeController themeController = Get.find();

  Widget topicListWidget() {
    return GridView.builder(
        itemCount: controller.topicList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0),
        itemBuilder: (BuildContext context, int index) {
          return topicItem(controller.topicList, index);
        });
  }

  Widget topicItem(List<Map<String, dynamic>> topicList, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.topicCardScreen);
       topicCardController.title.value= controller.topicList[index]['name'];
      },
      child: Column(

        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.0),
                //  border: Border.all(color: AppColors.grey,width: 0.5),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade400, blurRadius: 5)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                height: 110.h,
                width: 110.w,
                fit: BoxFit.fill,
                imageUrl: controller.topicList[index]['image'],
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          AppText.medium(
            "${controller.topicList[index]['name']}",
            maxLines: 2,
          ).centered().py(8)
          //"Crona virus ".text.maxLines(2).center.make().py(8)
        ],
      ),
    );
  }
}

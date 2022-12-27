import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_news/utils/app_text.dart';
import 'package:dog_news/utils/image_path_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/routes/app_routes.dart';
import '../../../controller/topic_controller.dart';

class TopicWidget{
  TopicController controller = Get.find();

  Widget topicListWidget(){
     return GridView.builder(
       itemCount: controller.topicList.length,
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
     crossAxisSpacing:0.0,
   mainAxisSpacing:0.0
    ), itemBuilder: (BuildContext context, int index){
       return topicItem(controller.topicList, index);


     });
  }
  Widget topicItem(List<Map<String, dynamic>> topicList, int index){
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.topicCardScreen);

      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child:CachedNetworkImage(
              height: 110,
              width: 110,
              fit: BoxFit.cover,
              imageUrl:  controller.topicList[index]['image'],
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),

          ),
          AppText.large("${controller.topicList[index]['name']}",maxLines: 2,).centered().py(8)
          //"Crona virus ".text.maxLines(2).center.make().py(8)

        ],
      ),
    );
  }
}
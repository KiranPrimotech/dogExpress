import 'package:dog_news/src/UI/discover/topic/topic_widget.dart';
import 'package:dog_news/src/controller/topic_controller.dart';
import 'package:dog_news/utils/app_text.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class TopicScreen extends StatelessWidget with TopicWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: IconButton(
         onPressed: (){
           Get.back();
         },
         icon: const Icon(Icons.arrow_back_ios_new,size: 18,),

       ),
       title: AppText(LocalString.topic),
       centerTitle: true,
     ),
     body: Column(
       children: [
         topicListWidget().expand(),

       ],
     ),
   );
  }
}
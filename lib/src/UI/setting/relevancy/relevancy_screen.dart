import 'package:dog_news/src/controller/relevancy_controller.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text.dart';
import 'relevancy_widget.dart';

class RelevancyScreen extends GetView<RelevancyController> with RelevancyWidget{


  @override
  Widget build(BuildContext context) {
   return Scaffold(

     appBar: AppBar(
       elevation: 0,
       backgroundColor: Colors.transparent,
       leading: IconButton(onPressed: () {
         Get.back();
       }, icon: Icon(Icons.arrow_back_ios_new,size: 18,),),
       title: AppText(LocalString.changeRelevancy.tr,fontWeight: FontWeight.w700,),
       centerTitle: true,
     ),
     body: Column(
       children: [
         headingWidget(),
         relevancyList().expand(),



       ],
     ),
   );
  }
}
import 'package:dog_news/src/controller/notification_controller.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/app_colors.dart';

class NotificationScreen extends GetView<NotificationController>{
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       elevation: 0,
       backgroundColor:AppColors.white,
       leading:  IconButton(onPressed: () {
         Get.back();
       }, icon:const Icon( Icons.arrow_back_ios,color: AppColors.black,),),
       title: LocalString.notification.tr.text.size(18).color(AppColors.black).make(),
       centerTitle: true,
     ),
     body: Column(
       children: [
         const Divider(
           thickness: 2,
         ),

       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [

               LocalString.notification.tr.text.color(AppColors.gray).make().px(10),

           switchButton(controller.switchBool).px(6),
         ],
       ).px(10),

         const Divider(
           thickness: 2,
         ),
         pauseNotificationWidget(LocalString.pauseNotification,Icons.arrow_forward_ios),
         const Divider(
           thickness: 2,
         ),




       ],
     ),
   );
  }

  Widget pauseNotificationWidget( String title,IconData? iconData) {
    return InkWell(
      onTap:() {
        Get.toNamed(AppRoutes.pauseNotification);

      },
      child: Container(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            title.tr.text.color(AppColors.gray).make().px(10),
            Icon(
              iconData,
              size: 20,
              color: AppColors.gray,
            ),
          ],
        ),
      ).p(10),
    );
  }
  Widget switchButton(RxBool switchBool ) {
    return Transform.scale(
      scale: 1.5,
      child: Obx(() =>
          Switch(
              activeColor: AppColors.primary,
              inactiveTrackColor: AppColors.grey.withOpacity(0.5),
              value: switchBool.value ,
              onChanged: (value) {
                switchBool.value = value;
              }),
      ),
    );
  }


}
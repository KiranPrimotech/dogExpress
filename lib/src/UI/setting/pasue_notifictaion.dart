import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/localization/localization_String.dart';

class PauseNotification extends StatelessWidget{
  const PauseNotification({super.key});

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
       actions: [
         LocalString.save.tr.text.size(18).bold.color(AppColors.primary).make().py(20).px(10),
       ],

     ),

     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         LocalString.from.tr.text.color(AppColors.gray).size(20).make(),
         timePickerWidget(),
         LocalString.to.tr.text.color(AppColors.gray).size(20).make(),
         timePickerWidget(),

       ],
     ).p(10),
   );
  }

  Widget timePickerWidget() {
    return  TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle:  TextStyle(
          fontSize: 24,
          color: AppColors.grey
      ),
      highlightedTextStyle:  TextStyle(
          fontSize: 30,
          color: AppColors.primary
      ),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: false,
      onTimeChange: (time) {

      },
    );
  }
}
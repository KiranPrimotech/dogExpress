import 'package:dog_news/src/controller/setting_controller.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';
import '../../../utils/routes/app_routes.dart';
import '../card/shared_pref.dart';
import 'setting_widget.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget with SettingWidget{
  SettingController controller = Get.find();
  getData() async {
    if( await SharePreference.getStringValuesSF(LocalString.langKey) == ""){
      print("No value Stored");

    }
    else{
      print(" uyryutieruituiotui ${await SharePreference.getStringValuesSF(LocalString.langKey) }");
    }
  }
  @override
  Widget build(BuildContext context) {
    double? thickness= 1.5;
    getData();

   return Scaffold(
     backgroundColor: AppColors.white,

     appBar: AppBar(
       backgroundColor: AppColors.white,
       leading:  BackButton(
         color: AppColors.gray,

       ),
       title: AppText.small( LocalString.options.tr,color:AppColors.gray,),

       actions: [
         GestureDetector(
           onTap: (){
             logout();
           },
           child: Container(
             height:35,
             width: 35,
             decoration: BoxDecoration(
               border: Border.all(color: AppColors.gray,width: 1.5),
               borderRadius: BorderRadius.circular(40)
             ),
               child: Icon(Icons.person_outline_outlined,color: AppColors.gray,size: 30,)).p(10),
         ),
       ],
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
        /// Safe Preference Widget
           safePreferenceWidget(),

           /// Language
           notificationOptionDropDownWidget(Icons.language, LocalString.language, controller.selectedLanguage, language),
           const Divider(thickness: 2,).px(12),

           /// Notification
           notificationOptionIconWidget(Icons.notifications_none, LocalString.notification,AppRoutes.notificationDetail),
            Divider(thickness: thickness,).px(12),

           /// Relevancy
           notificationOptionIconWidget(Icons.question_mark_rounded, LocalString.changeRelevancy,AppRoutes.relevancyScreen),
           Divider(thickness: thickness,).px(12),

           /// HD Image
           notificationOptionSwitchWidget(Icons.play_arrow_outlined,LocalString.hdImage,controller.hdImageValue),
            Divider(thickness: thickness,).px(12),

           ///  Night Mode
           notificationOptionSwitchWidget(Icons.nightlight_outlined,LocalString.nightMode,controller.modeValue),
            Divider(thickness: thickness,).px(12),

           /// AutoPlay
           notificationOptionDropDownWidget(Icons.play_arrow, LocalString.autoPlay, controller.selectedAutoPlay,autoPlayFun),
            Divider(thickness: thickness,).px(12),

           /// Text Size
           notificationOptionDropDownWidget(Icons.sort_by_alpha_outlined, LocalString.textSize,controller.selectedTextSize,textSizeFun),
            Divider(thickness: thickness,).px(12),


           /// Share APP
           notificationOptionTitleWidget(LocalString.shareApp),
           Divider(thickness: thickness,).px(12),
           /// Rate APP
           notificationOptionTitleWidget(LocalString.rateApp),
           Divider(thickness: thickness,).px(12),
           /// Feedback
           notificationOptionTitleWidget(LocalString.feedback),
           Divider(thickness: thickness,).px(12),
           ///Terms and Condition
           notificationOptionTitleWidget(LocalString.termsCondition),
           Divider(thickness: thickness,).px(12),
           /// Privacy
           notificationOptionTitleWidget(LocalString.privacy),



          ],
       ),
     ),
   );
  }
}
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:get/get.dart';

import '../UI/card/shared_pref.dart';

class SettingController extends GetxController{

  RxBool  modeValue = false.obs;
  RxBool  hdImageValue = false.obs;
 // RxString selectedLanguage = "English".obs;
  RxString selectedLanguage="".obs ;
  RxString selectedTextSize = LocalString.defaultTxt.obs;
  RxString selectedAutoPlay= LocalString.on.obs;

  onNotificationTap(){
    Get.toNamed(AppRoutes.notification);
  }

  onRelevancyTap(){
    Get.toNamed(AppRoutes.relevancyScreen);
  }

  setValue( ) async{
    if( await SharePreference.getStringValuesSF(LocalString.langKey) != ""){
      print("if --- ${selectedLanguage.value}");
      selectedLanguage.value =  await SharePreference.getStringValuesSF(LocalString.langKey);
  }
    else{
      selectedLanguage.value = LocalString.eng;
      print("else --- ${selectedLanguage.value}");
    }

  }


  setModeValue( ) async{
   modeValue.value = await SharePreference.getBoolValuesSF("mode");
   print("mode value --- ${modeValue}");

  }

  getData() async {
    if( await SharePreference.getStringValuesSF(LocalString.langKey) == ""){
      print("No value Stored");

    }
    else{
      print(" uyryutieruituiotui ${await SharePreference.getStringValuesSF(LocalString.langKey) }");
    }
  }

  @override
  void onInit() {
    super.onInit();
    setValue();
    setModeValue();

  }



}
enum SwitchAction{
  hdImage,
  theme,
}
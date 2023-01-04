import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../UI/card/shared_pref.dart';

class SettingController extends GetxController{

  RxBool  modeValue = false.obs;
  RxBool  hdImageValue = false.obs;
  RxBool  loginValue = true.obs;
  RxBool  logOutValue = false.obs;
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
    if( await SharePreference.getStringValuesSF(LocalString.langKey) != "" && await SharePreference.getStringValuesSF(LocalString.langKey) != null){
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


  /// Login with Google
  getGoogleLoginValue() async{
    print("loginnnn -------");

    if(await SharePreference.getStringValuesSF(LocalString.signKey) != "" && await SharePreference.getStringValuesSF(LocalString.signKey) != null){
      loginValue.value= false;
      logOutValue.value= true;
      print("if ----- ${loginValue.value}");
      // Sign out with firebase
      await FirebaseAuth.instance .signOut();
      // Sign out with google
      await GoogleSignIn().signOut();

    }
    else{
      loginValue.value=true;
      logOutValue.value= false;

      print("else  ----- ${loginValue.value}");
    }
    update();
  }



  @override
  void onInit() {
    print("google login init------- ");

    super.onInit();
    setValue();
    setModeValue();
    getGoogleLoginValue();

  }
  @override
  void onReady() {
   print("google login ready------- ");
    super.onReady();
  }
  @override

  InternalFinalCallback<void> get onStart => super.onStart;

  void logOutUser() async {
    if (await SharePreference.getStringValuesSF(LocalString.signKey) != "" &&
        await SharePreference.getStringValuesSF(LocalString.signKey) != null) {
      loginValue.value=true;
      logOutValue.value= false;
      SharePreference.removeField(LocalString.signKey);
      Get.back();

    }
    else{
      loginValue.value=false;
      logOutValue.value= true;

    }
  }



}
enum SwitchAction{
  hdImage,
  theme,
}
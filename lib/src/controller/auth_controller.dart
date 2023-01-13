import 'dart:io';

import 'package:authentication/authentication.dart';
import 'package:dog_news/src/UI/card/shared_pref.dart';
import 'package:dog_news/src/controller/setting_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../firebase_options.dart';
import '../../utils/localization/localization_String.dart';
import '../../utils/routes/app_routes.dart';

class SignController extends GetxController {

  SettingController settingController = Get.find();
  User? user;
  RxBool platformBool = false.obs;

  checkCurrentPlatform(){
    if (Platform.isAndroid) {
      platformBool.value= false;
      print("platrforn -- if --- ${platformBool.value}");

    } else if (Platform.isIOS) {
      platformBool.value= true;
      print("platrforn -- else --- ${platformBool.value}");
    }
  }

  /// Click
  Function onClickFunction({required OnClick action}) {
    Map<OnClick, void Function()> actions = {
      /// Click  facebook
      OnClick.facebook: () async {
        user = await AuthManager().facebookLogin();
        if (user != null) {
          SharePreference.addStringToSF(LocalString.signKey, "${user!.email!}");
          settingController.getGoogleLoginValue();
          Get.back();
        }
      },

      /// Click Google
      OnClick.google: () async {

        user = await AuthManager().googleLogin(androidClientId: DefaultFirebaseOptions.currentPlatform.androidClientId!, iosClientId: DefaultFirebaseOptions.currentPlatform.iosClientId!);
        if (user != null) {
          await SharePreference.addStringToSF(
              LocalString.signKey, user!.email!);
          settingController.getGoogleLoginValue();
          Get.back();
        }
      },

      /// Click apple
      OnClick.apple: () async {
        user = await AuthManager().appleLogin();
        if (user != null) {
          await SharePreference.addStringToSF(
              LocalString.signKey, "${user!.email!}");
          settingController.getGoogleLoginValue();
          Get.back();
        }
      },

      /// Click phone
      OnClick.phone: () {
        Get.toNamed(AppRoutes.phoneAuth);
      },
    };

    Function act = actions[action]!;
    return act;
  }

  @override
  void onInit() {
    checkCurrentPlatform();
    super.onInit();
  }

}

enum OnClick { facebook, google, twitter, phone,apple }

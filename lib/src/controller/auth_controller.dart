import 'package:dog_news/feature/apple_login.dart';
import 'package:dog_news/feature/facebook_login.dart';
import 'package:dog_news/feature/google_login.dart';
import 'package:dog_news/src/UI/card/shared_pref.dart';
import 'package:dog_news/src/UI/setting/setting_page.dart';
import 'package:dog_news/src/controller/setting_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../utils/localization/localization_String.dart';
import '../../utils/routes/app_routes.dart';

class SignController extends GetxController{
SettingController settingController = Get.find();
  User? user;
  Function onClickFunction({required OnClick action}){
    Map<OnClick ,void Function()> actions = {
      /// Click  facebook
      OnClick.facebook : () async{
        user =await FacebookManager().signInWithFacebook();
        if(user != null){
          SharePreference.addStringToSF(LocalString.signKey, "${user!.email!}");
          settingController.getGoogleLoginValue();
          Get.back();
        }
      },
      /// Click Google
      OnClick.google : () async{
        user =await LoginManager().signInWithGoogle();
         if(user != null){
          await SharePreference.addStringToSF(LocalString.signKey, "${user!.email!}");
          settingController.getGoogleLoginValue();
          Get.back();

         }
      },
      /// Click Twitter
      OnClick.twitter : () async {
        await AppleLoginService().signInWithApple();
      //   final credential = await SignInWithApple.getAppleIDCredential(
      //   scopes: [
      //     AppleIDAuthorizationScopes.email,
      //     AppleIDAuthorizationScopes.fullName,
      //   ],
      // );
      //
      // print(credential);
     },
      /// Click phone
      OnClick.phone : (){

        Get.toNamed(AppRoutes.phoneAuth);
      },

    };

    Function act = actions[action]!;
    return act ;
  }
}

enum OnClick{
  facebook,
  google,
  twitter,
  phone
}
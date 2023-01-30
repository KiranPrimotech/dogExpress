import 'dart:io';

import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

import '../../firebase_options.dart';
import '../UI/card/shared_pref.dart';

class SettingController extends GetxController {
  RxBool modeValue = false.obs;
  RxBool hdImageValue = false.obs;
  RxBool loginValue = true.obs;
  RxBool logOutValue = false.obs;
  RxString selectedLanguage = "".obs;
  RxString selectedTextSize = LocalString.defaultTxt.obs;
  RxString selectedAutoPlay = LocalString.on.obs;
  RxBool platformBool = false.obs;


  onNotificationTap() {
    Get.toNamed(AppRoutes.notification);
  }

  onRelevancyTap() {
    Get.toNamed(AppRoutes.relevancyScreen);
  }

  /// Get Language Value
  setValue() async {
    if (await SharePreference.getStringValuesSF(LocalString.langKey) != "" &&
        await SharePreference.getStringValuesSF(LocalString.langKey) != null) {
      debugPrint("if --- ${selectedLanguage.value}");
      selectedLanguage.value =
          await SharePreference.getStringValuesSF(LocalString.langKey);
    } else {
      selectedLanguage.value = LocalString.eng;
      debugPrint("else --- ${selectedLanguage.value}");
    }
  }

  /// Get Mode Value
  setModeValue() async {
    modeValue.value = await SharePreference.getBoolValuesSF("mode") ?? false;
    debugPrint("mode value --- $modeValue");
  }

  getData() async {
    if (await SharePreference.getStringValuesSF(LocalString.langKey) == "") {
      debugPrint("No value Stored");
    } else {
      debugPrint(
          " language  ${await SharePreference.getStringValuesSF(LocalString.langKey)}");
    }
  }


  /// Share Data or Url
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Dog Express ',
        text: 'Example share text',
        linkUrl: 'https://dogexpress.in/',
        chooserTitle: 'Example Chooser Title'
    );
  }


  /// feedback on email
  feedbackLaunchMailto() async {
    var now =  DateTime.now();
    var formatter =  DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);

    Email email = Email(
        recipients: ['kiran.primotech@gmail.com'],
        cc: ['shubhpreet.primotech@gmail.com'],
        subject: '$formattedDate  feedback for Dog Express App',
        body: 'body',
      isHTML: true,

    );

    await FlutterEmailSender.send(email);
  }

  /// Login with Google
  getGoogleLoginValue() async {

    if (await SharePreference.getStringValuesSF(LocalString.signKey) != "" &&
        await SharePreference.getStringValuesSF(LocalString.signKey) != null) {
      loginValue.value = false;
      logOutValue.value = true;
      debugPrint("if ----- ${loginValue.value}");


    } else {
      loginValue.value = true;
      logOutValue.value = false;

      debugPrint("else  ----- ${loginValue.value}");
    }
    update();
  }

  /// Current Platform
  checkCurrentPlatform(){
    if (Platform.isAndroid) {
      platformBool.value= false;
      debugPrint("platform -- if --- ${platformBool.value}");

    } else if (Platform.isIOS) {
      platformBool.value= true;
      debugPrint("platform -- else --- ${platformBool.value}");
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkCurrentPlatform();
    setValue();
    setModeValue();
    getGoogleLoginValue();

  }


  /// Click
  Function onClickFunction({required OnClickOption action}) {
    Map<OnClickOption, void Function()> actions = {
      /// share data
      OnClickOption.share: () async {
        share();

      },

      /// feedback
      OnClickOption.feedback: () async {
        feedbackLaunchMailto();

      },

      /// privacy policy
      OnClickOption.privacy: () async {

      },

      /// terms and condition
      OnClickOption.termsAndCondition: () {

      },
      /// Rate Application
      OnClickOption.rateApp: () {

      },
    };

    Function act = actions[action]!;
    return act;
  }

  /// Log Out
   logOutUser() async {
    if (await SharePreference.getStringValuesSF(LocalString.signKey) != "" &&
        await SharePreference.getStringValuesSF(LocalString.signKey) != null) {
      loginValue.value = true;
      logOutValue.value = false;
      SharePreference.removeField(LocalString.signKey);
      Get.back();

      await FirebaseAuth.instance.signOut();
      // Sign out with google

      try {
        if (Platform.isAndroid) {
          await GoogleSignIn(
              clientId:
              DefaultFirebaseOptions.currentPlatform.androidClientId)
              .signOut();
        } else if (Platform.isIOS) {
          await GoogleSignIn(
              clientId: DefaultFirebaseOptions.currentPlatform.iosClientId)
              .signOut();
        }
      }
      catch(e){
        debugPrint("error -->   $e");
      }
    } else {
      loginValue.value = false;
      logOutValue.value = true;
    }
  }
}

enum SwitchAction {
  hdImage,
  theme,
}

enum OnClickOption { share, feedback, privacy, termsAndCondition,rateApp }

import 'dart:io';

import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

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
      print("if --- ${selectedLanguage.value}");
      selectedLanguage.value =
          await SharePreference.getStringValuesSF(LocalString.langKey);
    } else {
      selectedLanguage.value = LocalString.eng;
      print("else --- ${selectedLanguage.value}");
    }
  }

  /// Get Mode Value
  setModeValue() async {
    modeValue.value = await SharePreference.getBoolValuesSF("mode") ?? false;
    print("mode value --- ${modeValue}");
  }

  getData() async {
    if (await SharePreference.getStringValuesSF(LocalString.langKey) == "") {
      print("No value Stored");
    } else {
      print(
          " uyryutieruituiotui ${await SharePreference.getStringValuesSF(LocalString.langKey)}");
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
    print("loginnnn -------");

    if (await SharePreference.getStringValuesSF(LocalString.signKey) != "" &&
        await SharePreference.getStringValuesSF(LocalString.signKey) != null) {
      loginValue.value = false;
      logOutValue.value = true;
      print("if ----- ${loginValue.value}");
      // Sign out with firebase
      await FirebaseAuth.instance.signOut();
      // Sign out with google
      await GoogleSignIn().signOut();
    } else {
      loginValue.value = true;
      logOutValue.value = false;

      print("else  ----- ${loginValue.value}");
    }
    update();
  }

  /// Current Platform
  checkCurrentPlatform(){
    if (Platform.isAndroid) {
      platformBool.value= false;
      print("platrforn -- if --- ${platformBool.value}");

    } else if (Platform.isIOS) {
      platformBool.value= true;
      print("platrforn -- else --- ${platformBool.value}");
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

      /// feedabck
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
  void logOutUser() async {
    if (await SharePreference.getStringValuesSF(LocalString.signKey) != "" &&
        await SharePreference.getStringValuesSF(LocalString.signKey) != null) {
      loginValue.value = true;
      logOutValue.value = false;
      SharePreference.removeField(LocalString.signKey);
      Get.back();
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

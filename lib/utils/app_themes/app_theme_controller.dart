import 'package:dog_news/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController{

  static ThemeController get to => Get.find();

  late SharedPreferences prefs;
  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;
  bool themeModeValue= true;
  Rx<Color> appBarColor = AppColors.white.obs;

  upgradeFun(bool value){
    if(value ){

      appBarColor.value =AppColors.gray;
      print(  " iff part --- ${appBarColor.value }");
    }
    else{
      appBarColor.value =AppColors.white;
      print(  " else  part --- ${appBarColor.value }");    }
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    Get.changeThemeMode(themeMode);
    _themeMode = themeMode;
    update();
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeMode.toString().split('.')[1]);
  }



  getThemeModeFromPreferences() async {
    ThemeMode themeMode;
    prefs = await SharedPreferences.getInstance();
    String themeText = prefs.getString('theme') ?? 'system';
    try {
      themeMode =
          ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
    } catch (e) {
      themeMode = ThemeMode.system;
    }



    setThemeMode(themeMode);

  }
}
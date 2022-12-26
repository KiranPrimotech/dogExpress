import 'package:dog_news/src/controller/setting_controller.dart';
import 'package:get/get.dart';

class SettingBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
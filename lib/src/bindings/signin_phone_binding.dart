import 'package:dog_news/src/controller/signin_phone_controller.dart';
import 'package:get/get.dart';

class PhoneBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PhoneController());
  }
}
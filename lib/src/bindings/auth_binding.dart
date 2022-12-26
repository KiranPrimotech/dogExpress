import 'package:dog_news/src/controller/auth_controller.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignController());
  }
}
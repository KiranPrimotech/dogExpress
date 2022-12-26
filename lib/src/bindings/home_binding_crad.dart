import 'package:dog_news/src/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBindingCard implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeControllerCard());
  }
}
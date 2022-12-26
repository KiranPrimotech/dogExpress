import 'package:dog_news/src/controller/relevancy_controller.dart';
import 'package:get/get.dart';

class RelevancyBinding implements Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => RelevancyController());
  }
}
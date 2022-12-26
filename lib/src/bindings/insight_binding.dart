import 'package:dog_news/src/controller/insight_controller.dart';
import 'package:get/get.dart';

class InsightBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => InsightController());
  }
}
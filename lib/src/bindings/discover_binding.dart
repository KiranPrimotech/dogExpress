import 'package:dog_news/src/controller/discover_controller.dart';
import 'package:get/get.dart';

class DiscoverBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => DiscoverController());
  }
}
import 'package:dog_news/src/controller/poll_controller.dart';
import 'package:get/get.dart';

class PollBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PollController());
  }
}
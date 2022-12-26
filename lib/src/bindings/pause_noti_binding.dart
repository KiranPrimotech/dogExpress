import 'package:dog_news/src/controller/puase_noti_controller.dart';
import 'package:get/get.dart';

class PauseNotificationBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => PauseNotificationController());
  }
}
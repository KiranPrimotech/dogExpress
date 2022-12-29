import 'package:dog_news/src/controller/notifiocation_detail_controller.dart';
import 'package:dog_news/src/controller/poll_controller.dart';
import 'package:get/get.dart';

class NotificationDetailBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationDetailController());
  }
}
import 'package:dog_news/src/controller/notifiocation_detail_controller.dart';
import 'package:dog_news/src/controller/poll_controller.dart';
import 'package:get/get.dart';

import '../controller/notification_pager_controller.dart';

class NotificationPagerBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationPagerController());
    Get.lazyPut(() => PollController());
    Get.lazyPut(() => NotificationDetailController());
  }

}
import 'package:dog_news/src/controller/notifiocation_detail_controller.dart';
import 'package:dog_news/src/controller/topic_card_controller.dart';
import 'package:dog_news/src/controller/topic_controller.dart';
import 'package:get/get.dart';

class  TopicBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => TopicController());
   Get.lazyPut(() => TopicCardController());
   Get.lazyPut(() => NotificationDetailController());
  }
}
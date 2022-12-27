import 'package:dog_news/src/controller/topic_card_controller.dart';
import 'package:get/get.dart';

class TopicCardBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => TopicCardController());
  }
}
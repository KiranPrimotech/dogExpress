import 'package:dog_news/src/controller/topic_controller.dart';
import 'package:get/get.dart';

class  TopicBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => TopicController());
  }
}
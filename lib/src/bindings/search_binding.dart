import 'package:dog_news/src/controller/search_controller.dart';
import 'package:get/get.dart';

import '../controller/notifiocation_detail_controller.dart';

class SearchBinding implements Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => NotificationDetailController());
  }

}
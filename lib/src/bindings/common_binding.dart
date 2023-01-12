import 'package:get/get.dart';

import '../controller/common_controller.dart';

class CommonBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => CommonController());
  }
}
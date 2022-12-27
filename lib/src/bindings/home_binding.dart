import 'package:dog_news/src/controller/discover_controller.dart';
import 'package:dog_news/src/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../utils/app_themes/app_theme_controller.dart';
import '../controller/home_controller.dar.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(  ThemeController());

    Get.put(HomeController());
    Get.put(HomeControllerCard());
    Get.put(DiscoverController());

  }
}
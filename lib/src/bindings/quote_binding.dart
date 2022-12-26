import 'package:dog_news/src/controller/quote_controller.dart';
import 'package:get/get.dart';

class QuoteBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => QuoteController());
  }
}
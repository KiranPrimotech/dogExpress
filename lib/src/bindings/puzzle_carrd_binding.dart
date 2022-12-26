import 'package:dog_news/src/controller/puzzle_controller.dart';
import 'package:get/get.dart';

class PuzzleCardBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PuzzleController());
  }
}
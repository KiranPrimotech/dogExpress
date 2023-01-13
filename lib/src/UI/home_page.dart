import 'package:dog_news/src/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


class HomeScreen extends GetView<HomeControllerCard> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    int prevIndex =
    controller.index.value <= 0 ? 0 : controller.index.value - 1;
    int nextIndex =
    controller.index.value == controller.newsModal.result!.length - 1
        ? 0
        : controller.index.value + 1;

      return Scaffold(
        //backgroundColor: Colors.black,
        body:controller.newsModal.result!.isEmpty? Center(child: "No List Found".text.make()):slidingWidget(prevIndex, nextIndex),

      );
    }

  Widget slidingWidget(int prevIndex, int nextIndex){
    return Center(
      child: Obx(()=>
         Dismissible(
          background:controller. newsCard(prevIndex),
          onUpdate: (details) {
          },
          secondaryBackground: controller.newsCard(nextIndex),
          resizeDuration: const Duration(milliseconds: 10),
          key: Key(controller.index.toString()),
          direction: DismissDirection.vertical,
          onDismissed: (direction) {
            controller. updateContent(direction);
          },
          child:controller. newsCard(controller.index.value),
        ),
      ),
    );
  }
}




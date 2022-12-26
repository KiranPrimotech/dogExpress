import 'package:dog_news/src/controller/poll_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PollScreen extends GetView<PollController>{
  @override
  Widget build(BuildContext context) {
    int prevIndex =controller. index.value <= 0 ? 0 :controller.  index.value - 1;
    int nextIndex =controller.  index.value == controller. newsModal.result!.length - 1 ? 0 : controller. index.value + 1;

    return Scaffold(

      body: Center(
        child: Obx(() =>
            Dismissible(
              background:controller. pollCard(prevIndex),
              child:controller. pollCard(controller.index.value),
              onUpdate: (details) {
                print(details.progress);
              },
              secondaryBackground:controller. pollCard(nextIndex),
              resizeDuration: const Duration(milliseconds: 10),
              key: Key(controller.index.toString()),
              direction: DismissDirection.vertical,
              onDismissed: (direction) {
                controller. updateContent(direction);
              },
            ),
        ),
      ),

    );
  }

}
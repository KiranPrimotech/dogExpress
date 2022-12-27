import 'package:dog_news/src/UI/discover/topic/card/topic_card_widget.dart';
import 'package:dog_news/src/controller/topic_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class TopicCardScreen extends GetView<TopicCardController> with TopicCardWidget{
  @override
  Widget build(BuildContext context) {
    int prevIndex =
    controller.index.value <= 0 ? 0 : controller.index.value - 1;
    int nextIndex =
    controller.index.value == controller.newsModal.result!.length - 1
        ? 0
        : controller.index.value + 1;

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Center(
            child: Obx(
                  () => Dismissible(
                background: controller.topicCard(prevIndex),
                child: controller.topicCard(controller.index.value),
                onUpdate: (details) {
                  print(details.progress);
                },
                secondaryBackground: controller.topicCard(nextIndex),
                resizeDuration: const Duration(milliseconds: 10),
                key: Key(controller.index.toString()),
                direction: DismissDirection.vertical,
                onDismissed: (direction) {
                  controller.updateContent(direction);
                },
              ),
            ),
          ),
          Positioned(top: 0, child: animatedAppBar()),
          Positioned(bottom: 0, child: animatedBottomBar()),
        ]),
      ),
    );  }


}
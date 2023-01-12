import 'package:dog_news/src/controller/topic_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/commom_widget.dart';

class TopicCardScreen extends GetView<TopicCardController> with CommonWidget {
   TopicCardScreen({super.key});

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
                onUpdate: (details) {

                },
                secondaryBackground: controller.topicCard(nextIndex),
                resizeDuration: const Duration(milliseconds: 10),
                key: Key(controller.index.toString()),
                direction: DismissDirection.vertical,
                onDismissed: (direction) {
                  controller.updateContent(direction);
                },
                child: controller.topicCard(controller.index.value),
              ),
            ),
          ),
          Positioned(top: 0, child: animatedAppBar()),
          Positioned(bottom: 0, child: animatedBottomBar()),
        ]),
      ),
    );
  }
}

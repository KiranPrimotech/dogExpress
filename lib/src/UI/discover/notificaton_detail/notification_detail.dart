import 'package:dog_news/src/controller/notifiocation_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widget/commom_widget.dart';

class NotificationDetailScreen extends GetView<NotificationDetailController> with CommonWidget {
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
                background: controller.notificationCard(prevIndex),
                onUpdate: (details) {
                },
                secondaryBackground: controller.notificationCard(nextIndex),
                resizeDuration: const Duration(milliseconds: 10),
                key: Key(controller.index.toString()),
                direction: DismissDirection.vertical,
                onDismissed: (direction) {
                  controller.updateContent(direction);
                },
                child: controller.notificationCard(controller.index.value),
              ),
            ),
          ),
          Positioned(top: 0, child: animatedAppBar()),
          Positioned(bottom: 0, child: animatedBottomBar())
        ]),
      ),
    );
  }
}

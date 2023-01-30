import 'package:dog_news/src/controller/quote_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuoteScreen extends GetView<QuoteController>{
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {

    int prevIndex =controller. index.value <= 0 ? 0 :controller.  index.value - 1;
    int nextIndex =controller.  index.value == controller. newsModal.result!.length - 1 ? 0 : controller. index.value + 1;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Obx(() =>
           Dismissible(
              background:controller. quoteCard(prevIndex),
              onUpdate: (details) {
                debugPrint("${details.progress}");
              },
              secondaryBackground:controller. quoteCard(nextIndex),
              resizeDuration: const Duration(milliseconds: 10),
              key: Key(controller.index.toString()),
              direction: DismissDirection.vertical,
              onDismissed: (direction) {
                controller. updateContent(direction);
              },
              child:controller. quoteCard(controller.index.value),
            ),
          ),
        ),

      ),
    );
  }
}
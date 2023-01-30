import 'package:dog_news/src/controller/poll_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PollNewsUrlLauncher extends GetView<PollController> {
  const PollNewsUrlLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PollController>(
        init: controller,
        builder: (con) {
          return WebViewWidget(
              key: Key("${controller.index.value}"),
              controller: con.webController);
        });
  }
}

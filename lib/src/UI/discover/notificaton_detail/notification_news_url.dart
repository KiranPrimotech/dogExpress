import 'package:dog_news/src/controller/notifiocation_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NotificationNewsUrlLauncher extends GetView<NotificationDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationDetailController>(
        init: controller,
        builder: (con) {
          return WebViewWidget(
              key: Key("${controller.index.value}"),
              controller: con.webController);
        });
  }
}
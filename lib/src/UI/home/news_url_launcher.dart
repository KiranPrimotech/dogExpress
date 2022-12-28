

import 'package:dog_news/src/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../controller/home_controller.dar.dart';


class NewsUrlLauncher extends GetView<HomeControllerCard>{



  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<HomeControllerCard>(
      init: controller,
      builder: (contr) {
        return WebViewWidget(key : Key("${controller.index.value}"),controller: contr.webController);
      }
    );
  }
}
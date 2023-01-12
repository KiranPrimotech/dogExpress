import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPagerController extends GetxController{


  late PageController webTab;



  @override
  void onInit() {
    /// initialize webTab Tab Controller
    webTab = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    webTab.dispose();
    super.onClose();
  }
}
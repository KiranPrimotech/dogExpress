import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/notification_pager_controller.dart';
import '../../home/news_url_launcher.dart';
import 'notification_detail.dart';
import 'notification_news_url.dart';

class NotificationPager extends GetView<NotificationPagerController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          allowImplicitScrolling: true,
          physics: PageScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: controller.webTab,
          children: [
            NotificationDetailScreen(),
            NotificationNewsUrlLauncher()
          ],
        ),
      ),
    );

  }

}
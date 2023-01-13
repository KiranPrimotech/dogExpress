import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/notification_pager_controller.dart';
import 'notification_detail.dart';
import 'notification_news_url.dart';

class NotificationPager extends GetView<NotificationPagerController>{
  const NotificationPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          allowImplicitScrolling: true,
          physics: const PageScrollPhysics(),
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
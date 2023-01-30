import 'package:dog_news/src/UI/discover/poll/poll_news_url.dart';
import 'package:dog_news/src/UI/discover/poll/poll_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/notification_pager_controller.dart';

class PollPager extends GetView<NotificationPagerController>{
  const PollPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          allowImplicitScrolling: true,
          physics: const PageScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: controller.webTab,
          children:  [
            PollScreen(),
            const PollNewsUrlLauncher()
          ],
        ),
      ),
    );

  }

}
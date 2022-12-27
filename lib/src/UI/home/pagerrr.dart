import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/scroll_physic/custom_scroll_physic.dart';

import '../../controller/home_controller.dar.dart';
import '../discover/discover_page.dart';
import '../home_page.dart';
import 'home_tab_widgets.dart';
import 'news_url_launcher.dart';

class HomeTabView extends GetView<HomeController> with MixinHomeTabWidgets {
  HomeTabView({super.key});

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
            Stack(
            children: [
              PageView(
                physics: CustomScrollPhysics(controller.webTab,parent: PageScrollPhysics()),
                scrollDirection: Axis.horizontal,
                controller: controller.homeTab,
                children: <Widget>[
                  /// Discover Tab
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child:DiscoverScreen()
                  ),

                  /// Feed Tab
                  Stack(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: HomeScreen()),
                      Positioned(bottom: 0, child: animatedBottomBar()),
                    ],
                  ),
                ],
              ),
               animatedAppBar(),
            ],
          ),

            NewsUrlLauncher()
          ],
        ),
      ),
    );
  }
}


import 'package:dog_news/src/controller/insight_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/image_path_network.dart';

class InsightWidget {
  InsightCardController controller = Get.put(InsightCardController());

  Widget imageSliderWidget() {
    return Stack(
      children: [

        SizedBox(
          height: Get.height *.7,
          child: PageView(

            controller: controller.controller,
            children: <Widget>[
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(ImagePathNetwork.dog4))),
              ),
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(ImagePathNetwork.dog5))),
              ),
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(ImagePathNetwork.dog4))),
              )
            ],
          ),
        ),

        Positioned(
            bottom: 8,
            left: 20,
            //right: 0,
            child: Center(
              child: SmoothPageIndicator(
                  controller: controller.controller,
                  count: 3,
                  effect: const ScrollingDotsEffect(
                      activeStrokeWidth: 3.0,
                      activeDotScale: 1.5,
                      maxVisibleDots: 5,
                      radius: 8,
                      spacing: 10,
                      dotHeight: 15,
                      dotWidth: 15,
                      dotColor: Colors.white,
                      activeDotColor: Colors.white)),
            )),
        Positioned(
          bottom: 30,
          right: 20,
          child: Container(
              decoration: BoxDecoration(
                  color:Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2,color:Colors.white)
              ),
              child: "Share".text.bold.white.make().px(15).py(5)

          ),
        )
      ],
    );
  }

}
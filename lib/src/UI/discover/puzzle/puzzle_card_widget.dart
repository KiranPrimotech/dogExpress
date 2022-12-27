import 'package:dog_news/src/controller/puzzle_card_controller.dart';
import 'package:dog_news/utils/image_path_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class PuzzleWidget {
  PuzzleCardController controller = Get.put(PuzzleCardController());

  Widget imageSliderWidget() {
    return Stack(
      children: [
        SizedBox(
          height: Get.height * .7,
          child: PageView(
            controller: controller.controller,
            children: <Widget>[
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(ImagePathNetwork.cartoon),
                  ),
                ),
              ),
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(ImagePathNetwork.cartoon))),
              ),
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(ImagePathNetwork.cartoon))),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                  controller: controller.controller,
                  count: 3,
                  effect: const ScrollingDotsEffect(
                      activeStrokeWidth: 2.6,
                      activeDotScale: 1.5,
                      maxVisibleDots: 5,
                      radius: 8,
                      spacing: 10,
                      dotHeight: 8,
                      dotWidth: 8,
                      dotColor: Colors.white,
                      activeDotColor: Colors.white)),
            )),
        Positioned(
          bottom: 30,
          right: 20,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.white)),
              child: "Share".text.bold.white.make().px(15).py(5)),
        )
      ],
    );
  }
}

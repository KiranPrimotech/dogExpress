import 'package:dog_news/src/controller/discover_controller.dart';
import 'package:dog_news/utils/shimmer/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class DummyWidget {
  DiscoverController controller = Get.find();

  Widget puzzleQuoteWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: 110.h,
        // width: Get.width,

        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 180.w,
                height: 110.h,
                color: Colors.red,
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 180.w,
                height: 110.h,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Notification Shimmer Loader
  Widget notificationListWidgetShimmer() {
    return ShimmerLoader(
      child: SizedBox(
        height: 75 * 4.h,
        child: ListView.builder(
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 75.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10).r,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * .7,
                            height: 57.h,
                            color: Colors.red,
                          ),
                          Container(
                            height: 57.h,
                            width: 57.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 4)
                                ]),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1.h,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  /// Insight Shimmer Loader
  Widget insightListWidgetShimmer() {
    final ScrollController horizontal =
        ScrollController(initialScrollOffset: 50.0);

    return ShimmerLoader(
      child: SizedBox(
        height: Get.height * .4,
        child: ListView.builder(
            itemCount: 5,
            controller: horizontal,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: Get.width * .4,
                width: Get.width * .4,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ).p(10);
            }),
        // ),
      ),
    );
  }

  /// Poll Shimmer Loader
  Widget pollListWidgetShimmer() {
    return ShimmerLoader(
      child: SizedBox(
        height: Get.width * .8 * 6 / 10 + 220.h,
        child: ListView.builder(
            itemCount: controller.pollList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: Get.width * .8,
                height: Get.width * .8 * 6 / 10 + 220.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.width * .8 * 6 / 10,
                      width: Get.width * .8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400, blurRadius: 5)
                          ]),
                    ).p(10),
                    SizedBox(
                      height: 220.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            color: Colors.red,
                          ).px(8).py(3).expand(),
                          Container(
                            height: 40,
                            color: Colors.red,
                          ).px(8).py(3),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                color: Colors.red,
                              ).expand(),
                              Container(
                                height: 50,
                                color: Colors.red,
                              ).expand(),
                            ],
                          ).px(8).py(4)
                        ],
                      ),
                    ).expand(),
                  ],
                ),
              );
            }),
      ),
    );
  }

  /// Topic Shimmer Loader
  Widget topicItemsListShimmer() {
    return ShimmerLoader(
      child: SizedBox(
          height: 220,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                height: 20,
                // color: Colors.red,
              ),
              SizedBox(
                height: 100,
                child: NotificationListener<ScrollNotification>(
                  child: PageView.builder(
                    onPageChanged: (pos) {
                      controller.currentPage.value = pos;
                      print("page ---- ${controller.currentPage.value}");
                    },
                    physics: BouncingScrollPhysics(),
                    controller: controller.pageController,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                              child: Card(
                                elevation: 4,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.grey.shade200, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.grey,
                height: 20,
                width: 100,
              ).centered().py(8),
            ],
          )),
    );
  }
}

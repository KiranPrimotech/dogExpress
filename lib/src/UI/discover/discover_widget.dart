import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_news/src/controller/discover_controller.dart';
import 'package:dog_news/utils/image_path_assets.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/app_colors.dart';


import '../../../utils/image_path_network.dart';
import '../../../utils/routes/app_routes.dart';
import '../../controller/home_controller.dar.dart';

class DiscoverWidget {
  DiscoverController controller = Get.find();
  HomeController homeController = Get.find();

  /// search Widget
  Widget searchWidget() {
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.search);
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade300.withOpacity(0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_outlined,
              color: AppColors.primary,
              size: 20,
            ),
            LocalString.searchNews.tr.text.color(Colors.grey).make().px(4)
          ],
        ).p(8),
      ).p(10),
    );
  }

  /// Puzzle Quote Widget
  Widget puzzleQuoteWidget(String image, Function onTap) {
    return InkWell(
      onTap:()=>onTap(),
      child: Container(

        width: 180,
        height:110,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.grey.shade500, blurRadius: 3)]),
        child:
        CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ).p(10),
        
      //   Image.network(
      //     ImagePathAssets.image,
      //     fit: BoxFit.fitWidth,
      //   ).p(10),
    ).p(10),
    );
  }

  Widget feedOptionWidget() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.feedList.length,
          itemBuilder: (BuildContext context, int index) {
            return feedItemsWidget( controller.feedList,index).px(20);
          }),
    ).pLTRB(0, 20, 0, 10);
  }

  Widget feedItemsWidget(List<Map<String, dynamic>> feedList, int index) {
    return GestureDetector(
      onTap: (){print("home page -------------------");
       homeController. homeTab.animateToPage(1, duration:   homeController.  durationLong, curve: Curves.easeInOut);
       homeController.  appBarTab.animateToPage(1, duration:   homeController.  durationLong, curve: Curves.easeInOut);
       homeController.title.value = feedList[index]['name'];
      // homeController.   bottomBarAnimationController.reverse(from: 50);
      },
      child: Column(
        children: [
          Icon(
            controller.feedList[index]['image'],
            size: 50,
            color: AppColors.primary,
          ),
          "${ feedList[index]['name']}".text.base.fontWeight(FontWeight.w600).color(AppColors.black).make().py(10),
        ],
      ),
    );
  }

  Widget notificationHeading(String heading, String title,Function onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           heading.tr.text
                .color(AppColors.black)
                .size(18)
                .bold
                .make(),
            Container(
              height: 2,
              width: 30,
              color: AppColors.black,
            )
          ],
        ),
        InkWell(
          onTap: () => onTap(),


            child: title.tr.text.size(12).bold.color(AppColors.primary).make())
      ],
    ).pLTRB(10, 0, 16, 16);
  }

  Widget notificationListWidgte() {
    return SizedBox(
      height: Get.height * .43,
      child: ListView.builder(
          itemCount: controller.notificationList.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return notificationItemsWidget(controller.notificationList, index);
          }),
    );
  }

  Widget notificationItemsWidget(List<Map<String, dynamic>> notificationList, int index) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.notificationDetail);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: Get.width * .7,
                  child: Text("${ notificationList[index]['name']}",style: TextStyle(
                    fontSize: 16,color: AppColors.black
                  ),),),

              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child:CachedNetworkImage(
                  height: 55,
                    width: 55,
                    fit: BoxFit.cover,

                  imageUrl:notificationList[index]['image'],
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

                // Image.network(
                //   ImagePathNetwork.dog2,
                //   height: 55,
                //   width: 55,
                //   fit: BoxFit.cover,
                // ),
              )
            ],
          ).px(10),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          )
        ],
      ),
    );
  }

  Widget insightListWidget() {
    final ScrollController horizontal =
        ScrollController(initialScrollOffset: 50.0);

    return
      // RawScrollbar(
      // controller: horizontal,
      // thumbColor: Colors.blue,
      // minThumbLength: 8,
      // minOverscrollLength: 4,
      // radius: Radius.circular(10),
      // scrollbarOrientation: ScrollbarOrientation.top,
      // thickness: 5,
      // thumbVisibility: true,
      // trackVisibility: true,
     // child:

      SizedBox(
        height: Get.height * .4,
        child:
        ListView.builder(
            itemCount: controller.insightList.length,
            controller: horizontal,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return insightItemsWidgte(controller.
              insightList,index);
            }),
     // ),
    );
  }

  Widget insightItemsWidgte(List<Map<String, dynamic>> insightList,int index) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.insightScreen);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child:
        CachedNetworkImage(
          height: 150,
            width: 150,
            fit: BoxFit.cover,
          imageUrl: insightList[index]['image'],
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),


      ).p(10),
    );
  }

  Widget pollListWidget() {
    return SizedBox(
      height: Get.height * .56,
      child: ListView.builder(
          itemCount: controller.pollList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return pollItemsWidget(controller.pollList, index);
          }),
    );
  }

  /// Poll Widget
  Widget pollItemsWidget(List<Map<String, dynamic>> pollList,int index) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.pollScreen);
      },
      child: SizedBox(
        width: Get.width * .8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child:
              CachedNetworkImage(
                  height: 160,
                  width: Get.width * .8,
                  fit: BoxFit.cover,
                imageUrl: pollList[index]['image'],
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

            ).p(10),
          "${  pollList[index]['description']}"
                .text.maxLines(5)
                .make()
                .px(8)
                .py(5),
            "Do you personally own a pet?"
                .text
                .bold
                .color(AppColors.black)
                .make()
                .px(8)
                .py(8),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey, width: 1)),
                  child: LocalString.yes.tr.text
                      .color(AppColors.primary)
                      .make()
                      .centered()
                      .p(4),
                ).expand(),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey, width: 1)),
                  child: LocalString.no.tr.text
                      .color(AppColors.primary)
                      .make()
                      .centered()
                      .p(4),
                ).expand(),
              ],
            ).px(16).py(10)
          ],
        ),
      ),
    );
  }

  Widget itemsList() {
    return SizedBox(
      height: Get.height * .5,
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: controller.PAGER_HEIGHT,
            child: NotificationListener<ScrollNotification>(
              child: PageView.builder(
                onPageChanged: (pos) {
                  controller.currentPage.value = pos;
                  print("page ---- ${controller.currentPage.value}");
                },
                physics: BouncingScrollPhysics(),
                controller: controller.pageController,
                itemCount: controller.listOfCharacters.length,
                itemBuilder: (context, index) {
                  return circleOffer(
                    controller.listOfCharacters[index]['image']!,
                    index,
                  );
                },
              ),
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification) {
                  controller.page.value = controller.pageController.page!;
                }
                controller.update();
                return true;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Obx(() =>
                          "${controller.listOfCharacters[controller.currentPage.value]['name']!}"
                              .text
                              .color(AppColors.primary).bold
                              .make().centered()),

          ),
        ],
      ),
    );
  }

  Widget circleOffer(String image, int index) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GetBuilder<DiscoverController>(
        init: controller,
        builder: (controller) => Container(
          margin: EdgeInsets.only(bottom: 10),
          height: controller.PAGER_HEIGHT * controller.getScale(index).value,
          width: controller.PAGER_HEIGHT * controller.getScale(index).value,
          child: Column(
            children: [
              Card(
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade200, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

                // Image.network(
                //   image,
                //   fit: BoxFit.cover,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

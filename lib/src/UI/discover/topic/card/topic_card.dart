import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_news/src/controller/topic_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home_controller.dar.dart';
import '../../../card/Utils.dart';
import '../../../phot_view_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class TopicCard extends StatelessWidget {
  final String url,
      imgUrl,
      primaryText,
      secondaryText,
      sourceName,
      author,
      publishedAt;

  TopicCard(
      {required this.url,
        required this.imgUrl,
        required this.primaryText,
        required this.secondaryText,
        required this.sourceName,
        required this.author,
        required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    TopicCardController controller = Get.find();
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Get.to(PhotoViewScreen(), arguments: "${imgUrl}");
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              color: Colors.grey.withOpacity(0.2),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (controller.appBarAnimationController.status ==
                  AnimationStatus.completed &&
                  controller.bottomBarAnimationController.status ==
                      AnimationStatus.dismissed) {
                controller.bottomBarAnimationController.forward();
              } else if (controller.appBarAnimationController.status ==
                  AnimationStatus.completed &&
                  controller.bottomBarAnimationController.status ==
                      AnimationStatus.completed) {
                controller.bottomBarAnimationController.reverse(from: 50);
                controller.appBarAnimationController.reverse(from: 50);
              } else if (controller.appBarAnimationController.status ==
                  AnimationStatus.dismissed &&
                  controller.bottomBarAnimationController.status ==
                      AnimationStatus.dismissed) {
                controller.appBarAnimationController.forward();
                controller.bottomBarAnimationController.forward();
              }
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                  child: Text(
                    primaryText,
                    style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      secondaryText,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w300),
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
                  child: Text(
                    "swipe left for more at $sourceName by $author / ${Utils.timeAgoSinceDate(publishedAt)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                    ),
                  ),
                )
              ],
            ),
          ).expand(),
          Container(
            width: Get.width * 1,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.grey.shade700,
                  Colors.grey.shade900,
                ],
              ),
              // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8),)
            ),
            child: GestureDetector(
              onTap: (){
                Utils.launchURL(url);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Blast Ocuured on jangambadi area".text.white.size(12).make(),
                  "Tap to read more $sourceName".text.white.size(10).make(),
                ],
              ).p(8),
            ),
          )
        ],
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_news/utils/app_text.dart';
import 'package:dog_news/utils/app_themes/app_theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../utils/app_colors.dart';
import '../../../controller/notifiocation_detail_controller.dart';
import '../../card/Utils.dart';
import '../../phot_view_screen.dart';

class NotificationCard extends StatelessWidget {
  final String url,
      imgUrl,
      primaryText,
      secondaryText,
      sourceName,
      author,
      publishedAt;

  const NotificationCard(
      {super.key,
      required this.url,
      required this.imgUrl,
      required this.primaryText,
      required this.secondaryText,
      required this.sourceName,
      required this.author,
      required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    NotificationDetailController controller = Get.find();
    ThemeController themeController = Get.find();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Get.to(const PhotoViewScreen(), arguments: imgUrl);
            },
            child: Container(
              height: (MediaQuery.of(context).size.height / 3).h,
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
                controller.bottomBarAnimationController
                    .reverse(from: controller.appBarHeight);
                controller.appBarAnimationController
                    .reverse(from: controller.appBarHeight);
              } else if (controller.appBarAnimationController.status ==
                      AnimationStatus.dismissed &&
                  controller.bottomBarAnimationController.status ==
                      AnimationStatus.dismissed) {
                controller.appBarAnimationController.forward();
                controller.bottomBarAnimationController.forward();
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                  child: Obx(
                    () => AppText.large(
                      primaryText,
                      maxLines: 10,
                      color: themeController.headingColor.value,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AppText(
                      secondaryText,
                      fontWeight: FontWeight.w500,
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
                  child: AppText.small(
                    "swipe left for more at $sourceName by $author / ${Utils.timeAgoSinceDate(publishedAt)}",
                  ),
                )
              ],
            ),
          ).expand(),
          Container(
            width: Get.width * 1,
            height: 50.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.grey.shade700,
                  Colors.grey.shade900,
                ],
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Utils.launchURL(url);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5, top: 5).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppText.small(
                      "Blast Occurred on jangambadi area",
                      color: AppColors.white,
                    ),
                    AppText.small(
                      "Tap to read more$sourceName",
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
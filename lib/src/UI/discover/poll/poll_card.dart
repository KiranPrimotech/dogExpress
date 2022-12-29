import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_news/src/controller/poll_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text.dart';
import '../../../../utils/localization/localization_String.dart';
import '../../card/Utils.dart';
import '../../phot_view_screen.dart';

class PollCard extends StatelessWidget{

  final String url,
      imgUrl,
      primaryText,
      secondaryText,
      sourceName,
      author,
      publishedAt;

  PollCard(
      {required this.url,
        required this.imgUrl,
        required this.primaryText,
        required this.secondaryText,
        required this.sourceName,
        required this.author,
        required this.publishedAt});
  @override
  Widget build(BuildContext context) {
    PollController controller = Get.find();

    return Scaffold(
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
       children: <Widget>[
         GestureDetector(
           onTap: (){
             Get.to(PhotoViewScreen(), arguments: "${imgUrl}");
           },
           child: Container(
             height: (MediaQuery.of(context).size.height / 2).h,
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
                 controller.bottomBarAnimationController.reverse(from: controller.appBarHeight);
                 controller.appBarAnimationController.reverse(from: controller.appBarHeight);
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
                 child: AppText(
                   primaryText,
                   maxLines: 10,

                 ),
               ),
               Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                   child: AppText.small(
                     secondaryText,
                     maxLines: 50,

                   )),
               Container(
                 padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 4.0),
                 child: AppText.medium(
                   "swipe left for more at $sourceName by $author / ${Utils.timeAgoSinceDate(publishedAt)}",

                 ),
               )
             ],
           )

         ).expand(),

         Container(
           width: Get.width *1,
           height: Get.height *.15,
           decoration:   BoxDecoration(
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
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Transform.translate(
                 offset: const Offset(20.0, -20.0),
                 child: Container(
                   decoration: BoxDecoration(
                     borderRadius: const BorderRadius.only(topRight: Radius.circular(8),topLeft:  Radius.circular(8)),
                     gradient: LinearGradient(

                       begin: Alignment.topRight,
                       end: Alignment.bottomLeft,

                       colors: [
                         Colors.grey.shade700,
                         Colors.grey.shade900,

                       ],
                     ),
                   ),
                   padding: const EdgeInsets.all(8.0),

                   child: "Dog Express Poll".text.color(AppColors.white).make(),
                 ),
               ),
               "Do you think remote work should be banned?".text.white.size(12).make().px(16).py(6),
               Container(

                 alignment: Alignment.bottomCenter,
                 decoration:const  BoxDecoration(
                   color: AppColors.white,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                 ),
                 child: Row(
                   children: [
                     Container(

                       child: LocalString.yes.tr.text
                           .color(AppColors.black).bold
                           .make()
                           .centered()
                           .p(8),
                     ).expand(),

                     Container(
                       child: LocalString.no.tr.text
                           .color(AppColors.black).bold
                           .make()
                           .centered()
                           .p(8),
                     ).expand(),
                   ],
                 ),
               ).px(16)
             ],
           ),

         )
       ],
     ),

   );
  }
}
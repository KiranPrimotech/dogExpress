import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_news/src/UI/auth/auth_widget.dart';
import 'package:dog_news/src/controller/auth_controller.dart';
import 'package:dog_news/utils/app_colors.dart';
import 'package:dog_news/utils/image_path_assets.dart';
import 'package:dog_news/utils/image_path_network.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInScreen extends GetView<SignController> with AuthWidget{
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        title: "Dog Express".text.color(AppColors.white).make(),
      ),
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                imageUrl: ImagePathNetwork.dog1,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ).centered().pLTRB(0, 20, 0, 10),
            SizedBox(
              height: Get.height *.14,
            ),
            /// Facebook
            optionWidget(bckClr: AppColors.facebookClr,title:LocalString.signWithFacebook,textClr: AppColors.white,imagePath: ImagePathAssets.facebookImg, onTap: controller.onClickFunction(action: OnClick.facebook,context: context)),

            /// Google
            optionWidget(bckClr: AppColors.white,title:LocalString.signWithGoogle,textClr: AppColors.black,imagePath: ImagePathAssets.googleImg,onTap: controller.onClickFunction(action: OnClick.google, context: context)),

            /// Apple
            Obx(() =>  Visibility(
                visible:controller.platformBool.value,
                child: optionWidget(bckClr: AppColors.grey,title:LocalString.signWithApple,textClr: AppColors.white,imagePath: ImagePathAssets.appleImg,onTap: controller.onClickFunction(action: OnClick.apple,context: context)))),

            /// Phone Number
            optionWidget(bckClr: AppColors.whatsClr,title:LocalString.signWithPhone,textClr: AppColors.white,imagePath:ImagePathAssets.callImg,onTap: (){
              Get.toNamed(AppRoutes.phoneAuth);
            }),

          ],
        ),
      ),
    );
  }
}
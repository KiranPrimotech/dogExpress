import 'package:dog_news/src/UI/auth/auth_widget.dart';
import 'package:dog_news/src/controller/auth_controller.dart';
import 'package:dog_news/utils/app_colors.dart';
import 'package:dog_news/utils/image_path_assets.dart';
import 'package:dog_news/utils/image_path_network.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInScreen extends GetView<SignController> with AuthWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        title: "Dog Express".text.color(AppColors.white).make(),
      ),
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(ImagePathNetwork.dog1,height: 200,width: 200,).centered().pLTRB(0, 20, 0, 10),
            SizedBox(
              height: Get.height *.14,
            ),
            /// Facebook
            optionWidget(bckClr: AppColors.facebookClr,title:LocalString.signWithFacebook,textClr: AppColors.white,imagePath: ImagePathAssets.facebookImg, onTap: controller.onClickFunction(action: OnClick.facebook)),
            optionWidget(bckClr: AppColors.white,title:LocalString.signWithGoogle,textClr: AppColors.black,imagePath: ImagePathAssets.googleImg,onTap: controller.onClickFunction(action: OnClick.google)),
            optionWidget(bckClr: AppColors.twitterClr,title:LocalString.signWithTwitter,textClr: AppColors.white,imagePath: ImagePathAssets.twitterImg,onTap: controller.onClickFunction(action: OnClick.twitter)),
            optionWidget(bckClr: AppColors.phoneClr,title:LocalString.signWithPhone,textClr: AppColors.white,imagePath:ImagePathAssets.callImg,onTap: (){
              Get.toNamed(AppRoutes.phoneAuth);
            }),
          ],
        ),
      ),
    );
  }
}
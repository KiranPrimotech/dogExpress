import 'package:dog_news/src/controller/setting_controller.dart';
import 'package:dog_news/src/model/enumClass.dart';
import 'package:dog_news/utils/app_colors.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:dog_news/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/app_text.dart';
import '../../../utils/app_themes/app_theme_controller.dart';
import '../../../utils/image_path_assets.dart';
import '../../../utils/sizes_config.dart';
import '../card/shared_pref.dart';

class SettingWidget {
  SettingController controller = Get.find();
  final ThemeController _themeController = Get.find();

  /// Sign In Widget
  Widget safePreferenceWidget() {
    return Obx(
      () => Visibility(
        visible: controller.loginValue.value,
        child: Container(
          height: Get.height * .24,
          color: AppColors.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.extraLarge(
                LocalString.savePreference.tr,
                fontSize: TextSizes.extraLarge,
                color: AppColors.white,
              ).p(10),
              SizedBox(
                width: Get.width * .37,
                child: AppText.small(
                  LocalString.signInDesc.tr,
                  maxLines: 2,
                  color: AppColors.white,
                ),
              ).px(10),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.signIn);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.signIn);
                      },
                      child: Container(
                        //width: Get.width *.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.white,
                        ),
                        child: Center(
                            child: AppText.small(
                          LocalString.signIn.tr,
                          maxLines: 2,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        )).py(10).px(12),
                      ),
                    ),
                    SizedBox(
                      // width: Get.width *.6,
                      child: Row(
                        children: [
                          signInOptionIcon(ImagePathAssets.googleImg),
                          signInOptionIcon(ImagePathAssets.facebookImg),
                          signInOptionIcon(ImagePathAssets.appleImg),
                          signInOptionIcon(ImagePathAssets.callImg),
                        ],
                      ),
                    )
                  ],
                ).pLTRB(10, 15, 10, 5),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Sign in option Widget
  Widget signInOptionIcon(String image) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: CircleBorder(
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        height: 35.h,
        width: 35.h,
      ),
    );
  }

  /// Widget With Icons
  Widget notificationOptionIconWidget(
      IconData? iconData, String title, String route) {
    return InkWell(
      onTap: () {
        Get.toNamed(route);
      },
      child: Row(
        children: [
          Icon(
            iconData,
            size: Dimens.smallIcon,
            //  color: AppColors.gray,
          ),
          AppText.medium(
            title.tr,
          ).px(10)
        ],
      ).p(10),
    );
  }

  /// Widget With Title Only
  Widget notificationOptionTitleWidget(String title) {
    return Row(
      children: [
        SizedBox(
          width: Dimens.smallIcon,
        ),
        AppText.medium(
          title.tr,
        ).px(10)
      ],
    ).p(10);
  }

  /// Widget With DropDown Options
  Widget notificationOptionDropDownWidget(IconData? iconData, String title,
      RxString dropDownTitle, void Function() onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              size: Dimens.smallIcon,
              // color: AppColors.gray,
            ),
            AppText.medium(
              title.tr,
            ).px(10)
          ],
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Row(
            children: [
              Obx(() => AppText.medium(
                    dropDownTitle.value.tr,
                  )),
              // dropDownTitle.tr.text.color(AppColors.primary).make(),
              Icon(
                Icons.arrow_drop_down_outlined,
                size: Dimens.extraSmallIcon,
                color: AppColors.primary,
              ).px(5)
            ],
          ),
        )
      ],
    ).p(10);
  }

  /// Widget With Switch Button
  Widget notificationOptionSwitchWidget(
      IconData? iconData, String title, RxBool value, SwitchAction action) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                size: 24,
                //color: AppColors.gray,
              ),
              AppText.medium(
                title.tr,
              ).px(10)
              // title.tr.text.color(AppColors.gray).make().px(10),
            ],
          ),
          switchButton(value, action).px(6),
        ],
      ),
    ).px(10);
  }

  Widget switchButton(RxBool switchBool, SwitchAction action) {
    return Transform.scale(
      scale: 1.5,
      child: Switch(
        inactiveThumbColor: _themeController.switchColor.value,
        activeColor: _themeController.switchColor.value,
        inactiveTrackColor: AppColors.gray.withOpacity(0.5),
        activeTrackColor: AppColors.primary.withOpacity(0.5),
        value: switchBool.value,
        onChanged: (value) {
          switchBool.value = value;
          if (action == SwitchAction.theme) {
            Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            _themeController.upgradeFun(value);
            _themeController
                .setThemeMode(value ? ThemeMode.dark : ThemeMode.light);

            SharePreference.addBoolToSF("mode", value);
            controller.update();
          } else {}
        },
      ),
    );
  }

  /// Log Out function
  void logout() {
    showModalBottomSheet(
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        isDismissible: true,
        isScrollControlled: true,
        enableDrag: true,
        context: Get.context!,
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
            child: logoutDialog(),
          );
        });
  }

  /// Log Out Bottom sheet
  Widget logoutDialog() {
    return SizedBox(
      height: Get.height * .38,
      child: Column(
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray, width: 1.5),
                  borderRadius: BorderRadius.circular(40)),
              child: Icon(
                Icons.person_outline_outlined,
                color: AppColors.gray,
                size: 40,
              )).p(20),
          LocalString.doyouWantLog.tr.text
              .size(18)
              .color(AppColors.gray)
              .wide
              .make()
              .py(20),
          GestureDetector(
              onTap: () {
                controller.logOutUser();
              },
              child:
                  logoutOptions(title: "Log Out", txtClr: AppColors.primary)),
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: logoutOptions(title: "Cancel", txtClr: AppColors.gray)),
        ],
      ),
    );
  }

  Widget logoutOptions({String? title, Color? txtClr}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Divider(
          thickness: 1,
          color: AppColors.grey,
        ),
        AppText.medium(title!.tr, color: txtClr).px(10)
        //title!.tr.text.color(txtClr).wide.base.make().p(8)
      ],
    );
  }

  /// Language function

  void language() {
    showModalBottomSheet(
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        isDismissible: true,
        isScrollControlled: true,
        enableDrag: true,
        context: Get.context!,
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
            child: languageDialog(),
          );
        });
  }

  Widget languageDialog() {
    return SizedBox(
      height: Get.height * .25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          languageOption(title: "English", value: 1),
          Divider(
            thickness: 1,
            color: AppColors.grey,
          ),
          languageOption(title: "हिंदी", value: 2),
        ],
      ),
    );
  }

  Widget languageOption({required String title, required int value}) {
    // print("$title     ${controller.selectedLanguage.value}");
    return GestureDetector(
      onTap: () async {
        Get.updateLocale(
            value == 1 ? const Locale('en', 'US') : const Locale('hi', 'IND'));

        controller.selectedLanguage.value = title;
        // print("$title     ${controller.selectedLanguage.value}");
        controller.update();
        await SharePreference.addStringToSF(
            LocalString.langKey, controller.selectedLanguage.value);
        //   print(LocalString.langKey);

        Get.back();
      },
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.check,
              color: controller.selectedLanguage.value != title
                  ? Colors.transparent
                  : AppColors.primary,
            ),
            title.tr.text
                .color(controller.selectedLanguage.value != title
                    ? Colors.black
                    : AppColors.primary)
                .make()
                .centered(),
            const Icon(
              Icons.check,
              color: Colors.transparent,
            )
          ],
        ).p(10),
      ),
    );
  }

  /// Text Size Function
  void textSizeFun() {
    showModalBottomSheet(
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        isDismissible: true,
        isScrollControlled: true,
        enableDrag: true,
        context: Get.context!,
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
            child: textSizeDialog(),
          );
        });
  }

  Widget textSizeDialog() {
    return SizedBox(
      height: Get.height * .25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textSizeOption(title: LocalString.defaultTxt, value: 1),
          Divider(
            thickness: 1,
            color: AppColors.grey,
          ),
          textSizeOption(title: LocalString.largeTxt, value: 2),
        ],
      ),
    );
  }

  Widget textSizeOption({required String title, required int value}) {
    //print("$title     ${controller.selectedTextSize.value}");
    return GestureDetector(
      onTap: () {
        controller.selectedTextSize.value = title;
        // print("$title     ${controller.selectedLanguage.value}");
        controller.update();

        Get.back();
      },
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.check,
              color: controller.selectedTextSize.value != title
                  ? Colors.transparent
                  : AppColors.primary,
            ),
            title.tr.text
                .color(controller.selectedTextSize.value != title
                    ? Colors.black
                    : AppColors.primary)
                .make()
                .centered(),
            const Icon(
              Icons.check,
              color: Colors.transparent,
            )
          ],
        ).p(10),
      ),
    );
  }

  /// AutoPlay
  void autoPlayFun() {
    showModalBottomSheet(
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        isDismissible: true,
        isScrollControlled: true,
        enableDrag: true,
        context: Get.context!,
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
            child: autoPlayDialog(),
          );
        });
  }

  Widget autoPlayDialog() {
    return SizedBox(
      height: Get.height * .28,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          autoPlayOption(title: LocalString.on, value: 1),
          Divider(
            thickness: 1,
            color: AppColors.grey,
          ),
          autoPlayOption(title: LocalString.onlyOn, value: 2),
          Divider(
            thickness: 1,
            color: AppColors.grey,
          ),
          autoPlayOption(title: LocalString.off, value: 2),
        ],
      ),
    );
  }

  Widget autoPlayOption({required String title, required int value}) {
    //print("$title     ${controller.selectedAutoPlay.value}");
    return GestureDetector(
      onTap: () {
        controller.selectedAutoPlay.value = title;
        controller.update();

        Get.back();
      },
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.check,
              color: controller.selectedAutoPlay.value != title
                  ? Colors.transparent
                  : AppColors.primary,
            ),
            title.text
                .color(controller.selectedAutoPlay.value != title
                    ? Colors.black
                    : AppColors.primary)
                .make()
                .centered(),
            const Icon(
              Icons.check,
              color: Colors.transparent,
            )
          ],
        ).p(10),
      ),
    );
  }
}

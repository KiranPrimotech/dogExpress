import 'package:dog_news/src/controller/setting_controller.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/app_text.dart';
import '../../../utils/routes/app_routes.dart';
import '../../../utils/sizes_config.dart';
import 'setting_widget.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget with SettingWidget {
  @override
  Widget build(BuildContext context) {
    double? thickness = 1.5;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: AppText.medium(
          LocalString.options.tr,
        ),
        actions: [
          Obx(
            () => Visibility(
              visible: controller.logOutValue.value,
              child: GestureDetector(
                onTap: () {
                  logout();
                },
                child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5,
                            color: themeController.borderColor.value),
                        borderRadius: BorderRadius.circular(40)),
                    child: Icon(
                      Icons.person_outline_outlined,
                      size: Dimens.largeIcon,
                    )).p(10),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Safe Preference Widget
            safePreferenceWidget(),

            /// Language
            notificationOptionDropDownWidget(Icons.language,
                LocalString.language, controller.selectedLanguage, language),
            const Divider(
              thickness: 2,
            ).px(12),

            /// Notification
            notificationOptionIconWidget(Icons.notifications_none,
                LocalString.notification, AppRoutes.notificationDetail),
            Divider(
              thickness: thickness,
            ).px(12),

            /// Relevancy
            notificationOptionIconWidget(Icons.question_mark_rounded,
                LocalString.changeRelevancy, AppRoutes.relevancyScreen),
            Divider(
              thickness: thickness,
            ).px(12),

            /// HD Image
            Obx(() => notificationOptionSwitchWidget(
                Icons.play_arrow_outlined,
                LocalString.hdImage,
                controller.hdImageValue,
                SwitchAction.hdImage)),
            Divider(
              thickness: thickness,
            ).px(12),

            ///  Night Mode
            Obx(() => notificationOptionSwitchWidget(
                Icons.nightlight_outlined,
                LocalString.nightMode,
                controller.modeValue,
                SwitchAction.theme)),
            Divider(
              thickness: thickness,
            ).px(12),

            /// AutoPlay
            notificationOptionDropDownWidget(Icons.play_arrow,
                LocalString.autoPlay, controller.selectedAutoPlay, autoPlayFun),
            Divider(
              thickness: thickness,
            ).px(12),

            /// Text Size
            notificationOptionDropDownWidget(Icons.sort_by_alpha_outlined,
                LocalString.textSize, controller.selectedTextSize, textSizeFun),
            Divider(
              thickness: thickness,
            ).px(12),

            /// Share APP
            notificationOptionTitleWidget(
                title: LocalString.shareApp,
                onTap: controller.onClickFunction(action: OnClickOption.share)),
            Divider(
              thickness: thickness,
            ).px(12),

            /// Rate APP
            notificationOptionTitleWidget(
                title: LocalString.rateApp,
                onTap:
                    controller.onClickFunction(action: OnClickOption.rateApp)),
            Divider(
              thickness: thickness,
            ).px(12),

            /// Feedback
            notificationOptionTitleWidget(
                title: LocalString.feedback,
                onTap:
                    controller.onClickFunction(action: OnClickOption.feedback)),
            Divider(
              thickness: thickness,
            ).px(12),

            ///Terms and Condition
            notificationOptionTitleWidget(
                title: LocalString.termsCondition,
                onTap: controller.onClickFunction(
                    action: OnClickOption.termsAndCondition)),
            Divider(
              thickness: thickness,
            ).px(12),

            /// Privacy
            notificationOptionTitleWidget(
                title: LocalString.privacy,
                onTap:
                    controller.onClickFunction(action: OnClickOption.privacy)),
          ],
        ),
      ),
    );
  }
}

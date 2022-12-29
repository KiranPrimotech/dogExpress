import 'package:dog_news/src/UI/home_page.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/app_colors.dart';
import 'notification_detail_widget.dart';

class NotificationDetailScreen extends StatelessWidget  with NotificationDetailWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Stack(
            children:[
              HomeScreen(),
              Positioned(top: 0, child: animatedAppBar()),
              Positioned(bottom: 0, child: animatedBottomBar())
            ]),
      ),
    );
  }
}

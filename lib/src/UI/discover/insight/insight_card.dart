import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'insight_widget.dart';


class InsightCard extends StatelessWidget with InsightWidget {

  final String url,
      imgUrl,
      primaryText,
      secondaryText,
      sourceName,
      author,
      publishedAt;

  InsightCard(
      {super.key, required this.url,
        required this.imgUrl,
        required this.primaryText,
        required this.secondaryText,
        required this.sourceName,
        required this.author,
        required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(

            begin: Alignment.topRight,
            end: Alignment.bottomLeft,

            colors: [
              Colors.grey.shade900,
              Colors.primaries[Random().nextInt(Colors.primaries.length)],


            ],
          ),
        ),



        child: Column(
          children: [

            SizedBox(
              height: Get.height *.1,
            ),
            imageSliderWidget(),

          ],
        ),
      ),
    );
  }
}

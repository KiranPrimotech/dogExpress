import 'dart:math';

import 'package:dog_news/src/UI/discover/puzzle/puzzle_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PuzzleCard extends StatelessWidget with PuzzleWidget {
  final String url,
      imgUrl,
      primaryText,
      secondaryText,
      sourceName,
      author,
      publishedAt;

  PuzzleCard(
      {required this.url,
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
              Colors.primaries[Random().nextInt(Colors.primaries.length)],
              Colors.grey.shade900,

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

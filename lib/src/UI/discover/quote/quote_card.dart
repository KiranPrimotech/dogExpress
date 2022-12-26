import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


class QuoteCard extends StatelessWidget {
  final String url,
      imgUrl,
      primaryText,
      secondaryText,
      sourceName,
      author,
      publishedAt;

   QuoteCard(
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
        color: Colors.black,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: double.maxFinite,
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 20,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2, color: Colors.white)),
                      child: "Share".text.bold.white.make().px(15).py(5)),
                )
              ],
            ).expand()
          ],
        ),
      ),
    );
  }
}

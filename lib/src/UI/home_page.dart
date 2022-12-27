import 'package:dog_news/src/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


class HomeScreen extends GetView<HomeControllerCard> {
  @override
  Widget build(BuildContext context) {


      int prevIndex =controller. index.value <= 0 ? 0 :  controller. index.value - 1;
      int nextIndex = controller.index ==controller. newsList.length - 1 ? 0 :controller. index.value + 1;

      return Scaffold(
        //  backgroundColor: Colors.black,
        body:controller.newsList.length == 0? Center(child: "No List Found".text.make()):slidingwidet(prevIndex, nextIndex),



      );
    }

  Widget slidingwidet(int prevIndex, int nextIndex){
    return Center(
      child: Obx(()=>
         Dismissible(
          background:controller. newsCard(prevIndex),
          child:controller. newsCard(controller.index.value),
          onUpdate: (details) {
            print(details.progress);
          },
          secondaryBackground: controller.newsCard(nextIndex),
          resizeDuration: Duration(milliseconds: 10),
          key: Key(controller.index.toString()),
          direction: DismissDirection.vertical,
          onDismissed: (direction) {
            controller. updateContent(direction);
          },
        ),
      ),
    );
  }


}




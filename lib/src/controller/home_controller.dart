import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UI/card/NewsCards.dart';
import '../UI/card/NewsModal.dart';
import '../UI/card/shared_pref.dart';
import '../model/response/news_response_model.dart';
import '../network/api_call.dart';

class HomeControllerCard extends GetxController{

  RxInt index = 0.obs;
  late NewsModal newsModal;
  List<Articles> newsList =[] ;


  Future<void>  getNewsList() async {

    newsList = await CallAPI().getNewsList();


    print("resposne ---- ${newsList.length}");

  }

  void updateIndex(newIndex) {

      index.value = newIndex;

    SharePreference.setLastIndex(newIndex);
  }

  void setupLastIndex() async {
    int? lastIndex = await SharePreference.getLastIndex();
    if (lastIndex != null && lastIndex < newsList.length - 1) {
      updateIndex(lastIndex);
    }
  }

  void updateContent(direction) {
    if (index.value <= 0 && direction == DismissDirection.down) {
      index.value =newsList!.length - 1;
    } else if (index == newsList!.length - 1 &&
        direction == DismissDirection.up) {
      index.value = 0;
    } else if (direction == DismissDirection.up) {
      index.value++;
    } else {
      index.value--;
    }
    updateIndex(index.value);
  }

  String getShareText() {
    return "${newsList[index.value].title}\n${newsList[index.value].url}";
  }

  Widget newsCard(int index) {
    return NewsCard(
      imgUrl: newsList[index].urlToImage!,
      primaryText: newsList[index].title!,
      secondaryText: newsList[index].description!,
      sourceName: newsList[index].source!.name!,
      author: newsList[index].author!,
      publishedAt: newsList[index].publishedAt!,
      url: newsList[index].url!,
    );
  }

  @override
  void onInit() {
    getNewsList();
    setupLastIndex();
    super.onInit();
  }
}
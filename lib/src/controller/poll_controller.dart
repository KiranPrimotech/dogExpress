import 'package:dog_news/src/UI/discover/poll/poll_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UI/card/NewsDummy.dart';
import '../UI/card/NewsModal.dart';
import '../UI/card/shared_pref.dart';

class PollController extends GetxController{

  RxInt index = 0.obs;
  late NewsModal newsModal;



  fetchData() {
    newsModal = NewsModal.fromJson(newsDummy);
  }

  void updateIndex(newIndex) {

    index.value = newIndex;

    SharePreference.setLastIndex(newIndex);
  }

  void setupLastIndex() async {
    int? lastIndex = await SharePreference.getLastIndex();
    if (lastIndex != null && lastIndex < newsModal.result!.length - 1) {
      updateIndex(lastIndex);
    }
  }

  void updateContent(direction) {
    if (index <= 0 && direction == DismissDirection.down) {
      index.value = newsModal.result!.length - 1;
    } else if (index == newsModal.result!.length - 1 &&
        direction == DismissDirection.up) {
      index.value = 0;
    } else if (direction == DismissDirection.up) {
      index++;
    } else {
      index--;
    }
    updateIndex(index);
  }

  String getShareText() {
    return "${newsModal.result![index.value].title}\n${newsModal.result![index.value].url}";
  }

  @override
  void onInit() {
    fetchData();
    setupLastIndex();
    super.onInit();
  }

  Widget pollCard(int index) {
    return PollCard(
      imgUrl: newsModal.result![index].urlToImage!,
      primaryText: newsModal.result![index].title!,
      secondaryText: newsModal.result![index].description!,
      sourceName: newsModal.result![index].sourceName!,
      author: newsModal.result![index].author!,
      publishedAt: newsModal.result![index].publishedAt!,
      url: newsModal.result![index].url!,
    );
  }

}
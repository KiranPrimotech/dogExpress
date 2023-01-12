import 'package:dog_news/src/UI/discover/topic/card/topic_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/localization/localization_String.dart';
import '../UI/card/NewsDummy.dart';
import '../UI/card/NewsModal.dart';
import '../UI/card/shared_pref.dart';
import '../UI/discover/topic/card/topic_card.dart';

class TopicCardController extends GetxController with GetTickerProviderStateMixin{
  RxInt index = 0.obs;
  late NewsModal newsModal;
  RxString title=LocalString.topic.obs;

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
      index.value++;
    } else {
      index.value--;
    }
    updateIndex(index.value);
  }

  String getShareText() {
    return "${newsModal.result![index.value].title}\n${newsModal.result![index
        .value].url}";
  }

  Widget topicCard(int index) {
    return TopicCard(
      imgUrl: newsModal.result![index].urlToImage!,
      primaryText: newsModal.result![index].title!,
      secondaryText: newsModal.result![index].description!,
      sourceName: newsModal.result![index].sourceName!,
      author: newsModal.result![index].author!,
      publishedAt: newsModal.result![index].publishedAt!,
      url: newsModal.result![index].url!,
    );
  }

  @override
  void onInit() {
    fetchData();
    setupLastIndex();
  }
}
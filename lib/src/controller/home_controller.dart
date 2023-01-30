import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../UI/card/NewsCards.dart';
import '../UI/card/NewsDummy.dart';
import '../UI/card/NewsModal.dart';
import '../UI/card/shared_pref.dart';
import '../model/response/news_response_model.dart';

class HomeControllerCard extends GetxController{

  RxInt index = 0.obs;
  late NewsModal newsModal;
  List<Articles> newsList =[] ;
  late  WebViewController  webController ;


  fetchData() {
    newsModal = NewsModal.fromJson(newsDummy);
  }

  void updateIndex(newIndex) async {
    index.value = newIndex;
    SharePreference.setLastIndex(newIndex);
   await updateWeb().then((value) => print("Done Done $value"));
    update();
  }

  void setupLastIndex() async {
    int? lastIndex = await SharePreference.getLastIndex();
    if (lastIndex != null && lastIndex < newsModal.result!.length - 1) {
      updateIndex(lastIndex);
    }
  }
    RxInt progressValue = 0.obs;
  Future updateWeb() async{
    WebViewController().clearLocalStorage();
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            progressValue.value= progress;

            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(newsModal.result![index.value].url!));
return Future.value(0);
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
    return "${newsModal.result![index.value].title}\n${newsModal.result![index.value].url}";
  }


  // Future<void>  getNewsList() async {
  //
  //   newsList = await CallAPI().getNewsList();
  //
  //
  //   print("resposne ---- ${newsList.length}");
  //
  // }
  // void updateIndex(newIndex) {
  //
  //     index.value = newIndex;
  //
  //   SharePreference.setLastIndex(newIndex);
  // }
  // void setupLastIndex() async {
  //   int? lastIndex = await SharePreference.getLastIndex();
  //   if (lastIndex != null && lastIndex < newsList.length - 1) {
  //     updateIndex(lastIndex);
  //   }
  // }
  // void updateContent(direction) {
  //   if (index.value <= 0 && direction == DismissDirection.down) {
  //     index.value =newsList!.length - 1;
  //   } else if (index == newsList!.length - 1 &&
  //       direction == DismissDirection.up) {
  //     index.value = 0;
  //   } else if (direction == DismissDirection.up) {
  //     index.value++;
  //   } else {
  //     index.value--;
  //   }
  //   updateIndex(index.value);
  // }
  // String getShareText() {
  //   return "${newsList[index.value].title}\n${newsList[index.value].url}";
  // }

  Widget newsCard(int index) {
    return NewsCard(
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
    updateWeb();
    super.onInit();
  }
}
import 'package:dog_news/src/UI/discover/poll/poll_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../UI/card/NewsDummy.dart';
import '../UI/card/NewsModal.dart';
import '../UI/card/shared_pref.dart';

class PollController extends GetxController with GetTickerProviderStateMixin{

  RxInt index = 0.obs;
  late NewsModal newsModal;
  late  WebViewController  webController ;


  /// AppBar Height
  double appBarHeight = 50.h;
  double bottomBarHeight = (Get.height *.1).h;
  late AnimationController appBarAnimationController;
  late AnimationController bottomBarAnimationController;

  Duration animationDuration = const Duration(milliseconds: 300);

  fetchData() {
    newsModal = NewsModal.fromJson(newsDummy);
  }

  void updateIndex(newIndex) async  {
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

  Future updateWeb() async{
    WebViewController().clearLocalStorage();
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
          //  progressValue.value= progress;

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


  @override
  void onInit() {

    /// initialize app bar animation controller
    appBarAnimationController = AnimationController(duration : animationDuration,vsync: this);
  //  appBarAnimationController.forward();

    /// initialize bottom bar animation controller
    bottomBarAnimationController = AnimationController(duration : animationDuration,vsync: this);

    fetchData();
    setupLastIndex();
    updateWeb();
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
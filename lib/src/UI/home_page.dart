import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/response/news_response_model.dart';
import '../network/api_call.dart';
import 'card/NewsCards.dart';
import 'card/NewsDummy.dart';
import 'card/NewsModal.dart';
import 'card/shared_pref.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late NewsModal newsModal;
  late List<Articles> newsList ;

  @override
  void initState() {
 //   fetchData();

    getNewsList();
    setupLastIndex();
    super.initState();
  }

  fetchData() {
    newsModal = NewsModal.fromJson(newsDummy);
  }
  Future<void> getNewsList() async {
    newsList = await CallAPI().getNewsList();
    print("resposne ---- ${newsList}");

  }

  void updateIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
    SharePreference.setLastIndex(newIndex);
  }

  void setupLastIndex() async {
    int? lastIndex = await SharePreference.getLastIndex();
    if (lastIndex != null && lastIndex < newsList.length - 1) {
      updateIndex(lastIndex);
    }
  }

  void updateContent(direction) {
    if (index <= 0 && direction == DismissDirection.down) {
      index = newsModal.result!.length - 1;
    } else if (index == newsModal.result!.length - 1 &&
        direction == DismissDirection.up) {
      index = 0;
    } else if (direction == DismissDirection.up) {
      index++;
    } else {
      index--;
    }
    updateIndex(index);
  }

  String getShareText() {
    return "${newsList[index].title}\n${newsList[index].url}";
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
  Widget build(BuildContext context) {
    int prevIndex = index <= 0 ? 0 : index - 1;
    int nextIndex = index == newsList.length - 1 ? 0 : index + 1;

    return Scaffold(
    //  backgroundColor: Colors.black,
      body: Center(
        child: Dismissible(
          background: newsCard(prevIndex),
          child: newsCard(index),
          onUpdate: (details) {
            print(details.progress);
          },
          secondaryBackground: newsCard(nextIndex),
          resizeDuration: Duration(milliseconds: 10),
          key: Key(index.toString()),
          direction: DismissDirection.vertical,
          onDismissed: (direction) {
            updateContent(direction);
          },
        ),
      ),
    );
  }
}


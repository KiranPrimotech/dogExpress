import 'package:dog_news/src/UI/discover/search/search_widget.dart';
import 'package:dog_news/utils/localization/localization_String.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget with SearchWidget{
   SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset : false,

          body: Column(
            children: [
              Row(
                children: [

                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: const BackButton(
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .8,
                    child:  TextField(
                      decoration: InputDecoration(
                        hintText: LocalString.searchNews.tr,
                        border: InputBorder.none
                      ),
                    ),
                  )
                ],
              ),

              Expanded(child: tabWidget()),

            ],
          ),

        ),
      ),
    );
  }
}
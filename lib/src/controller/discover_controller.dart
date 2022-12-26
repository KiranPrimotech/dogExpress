import 'dart:math';

import 'package:dog_news/utils/image_path_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController{

   double SCALE_FRACTION = 0.7;
   double FULL_SCALE = 1.0;
   double  PAGER_HEIGHT = 230.0;
   double viewPortFraction = 0.5;
   RxDouble page = 2.0.obs;
   RxDouble scale = 0.0.obs;

   late PageController pageController;

   RxInt currentPage = 2.obs;

   List<Map<String, String>> listOfCharacters = [{'image': ImagePathNetwork.image4, 'name': "Richmond"},
     {'image':ImagePathNetwork.image1,'name': "Roy"},
     {'image': ImagePathNetwork.url10, 'name': "Moss"},
     {'image': ImagePathNetwork.image4, 'name': "Douglas"},
     {'image': ImagePathNetwork.image5, 'name': "Jen"}
   ];

   /// Feed List
   List<Map<String, dynamic>> feedList = [{'image':Icons.feed, 'name': "Feed"},
     {'image':Icons.document_scanner,'name': "All News"},
     {'image': Icons.star, 'name': "Top Stories"},
     {'image': Icons.favorite, 'name': "Trending"},
     {'image':Icons.bookmark, 'name': "Bookmarks"},
     {'image':Icons.remove_red_eye, 'name': "Unread"}
   ];

   /// Notification List
   List<Map<String, dynamic>> notificationList = [{'image':ImagePathNetwork.dog8, 'name': "Dog Attack: Dog attack on child in Thane, Mumbai"},
     {'image':ImagePathNetwork.dog1,'name': "Asked to put ‘Dog’ in a pet carrier, passenger throws bottle at fellow flyer"},
     {'image': ImagePathNetwork.dog2, 'name': "Dog Attack: Dog attack on child in Thane, Mumbai"},
     {'image': ImagePathNetwork.dog1, 'name': "Viral Video: Pet Dog goes Paragliding with owner, netizens react- WATCH"},
   ];
   /// Insight List
   List<Map<String, dynamic>> insightList = [{'image':ImagePathNetwork.dog1},
     {'image':ImagePathNetwork.dog7},
     {'image': ImagePathNetwork.dog8},
     {'image': ImagePathNetwork.dog2},
     {'image':ImagePathNetwork.dog7},
     {'image':ImagePathNetwork.dog2}
   ];

   /// Poll List

   List<Map<String, dynamic>> pollList = [{'image':ImagePathNetwork.dog2, 'name': "Dog Attack: Dog attack on child in Thane, Mumbai",'description':"These days, cases of dog attacks are coming to the fore. Recently, a stray dog ​​attacked a child in Noida, due to which he died. Now a case of dog attack has come to light from Mumbai. Watch this report. "},
     {'image':ImagePathNetwork.dog1,'name': "Asked to put ‘Dog’ in a pet carrier, passenger throws bottle at fellow flyer",
       'description':"A female passenger travelling on a Delta Airline plane with her pet dog got angry when asked to place the dog in a special carrier bag for pets and threw bottle at a fellow flyer. "},
     {'image': ImagePathNetwork.dog2, 'name': "Dog Attack: Dog attack on child in Thane, Mumbai",
       'description':"These days, cases of dog attacks are coming to the fore. Recently, a stray dog ​​attacked a child in Noida, due to which he died. Now a case of dog attack has come to light from Mumbai. Watch this report. "},
     {'image': ImagePathNetwork.dog8, 'name': "Viral Video: Pet Dog goes Paragliding with owner, netizens react- WATCH",
       'description':"When internet users saw that the dog appeared to be terrified, they became upset The video has crossed over 1.4 million views since it was shared The pair paragliding was included in a few wide Instagram Reels photos"},
     {'image':ImagePathNetwork.dog, 'name': "Rashmika laughs off report claiming she demands flight tickets for her dog ",
       'description':"Actress Rashmika Mandanna, who is one of the top actresses in the Tamil, Telugu and Kannada industries, has laughed off a media report that claimed that the actress has been demanding flight tickets for her pet dog from producers. "},
     {'image':ImagePathNetwork.dog7, 'name': "Barack Obama announces death of former US 'first dog', says lost true friend",'description':"n 2013, Bo was joined at the White House by a second Portuguese water dog, Sunny, after Michelle Obama said that Bo needed more interaction with other dogs, according to NYT."}
   ];




   @override
  void onInit() {

    super.onInit();
    pageController =
        PageController(initialPage: currentPage.value, viewportFraction: viewPortFraction);
  }

getScale(int index){
    scale.value= max(SCALE_FRACTION, (FULL_SCALE - (index - page.value).abs()) +  viewPortFraction);
return scale;
  }
}
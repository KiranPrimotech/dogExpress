import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/image_path_network.dart';

class SearchController extends GetxController {
  /// Short List Controller

  List<Map<String, dynamic>> shortList = [
    {
      'image': ImagePathNetwork.dog8,
      'description': "Dog Attack: Dog attack on child in Thane, Mumbai",
    },
    {
      'image': ImagePathNetwork.dog1,
      'description':
          "Asked to put ‘Dog’ in a pet carrier, passenger throws bottle at fellow flyer",
      'name': "Health"
    },
    {
      'image': ImagePathNetwork.dog2,
      'description': "Dog Attack: Dog attack on child in Thane, Mumbai",
      'name': "Behaviour"
    },
    {
      'image': ImagePathNetwork.dog1,
      'description':
          "Viral Video: Pet Dog goes Paragliding with owner, netizens react- WATCH",
      'name': "Behaviour"
    },
    {
      'image': ImagePathNetwork.dog,
      'description':
          "Rashmika laughs off report claiming she demands flight tickets for her dog ",
      'name': "Behaviour"
    },
    {
      'image': ImagePathNetwork.dog7,
      'description':
          "Barack Obama announces death of former US 'first dog', says lost true friend",
      'name': "Food"
    },
    {
      'image': ImagePathNetwork.dog1,
      'description':
          "Asked to put ‘Dog’ in a pet carrier, passenger throws bottle at fellow flyer",
      'name': "Behaviour"
    },
    {
      'image': ImagePathNetwork.dog,
      'description':
          "Rashmika laughs off report claiming she demands flight tickets for her dog ",
      'name': "Body Modification"
    },
    {
      'image': ImagePathNetwork.dog8,
      'description':
          "Asked to put ‘Dog’ in a pet carrier, passenger throws bottle at fellow flyer",
      'name': "Behaviour"
    },
    {
      'image': ImagePathNetwork.dog1,
      'description':
          "Viral Video: Pet Dog goes Paragliding with owner, netizens react- WATCH",
      'name': "Training Methods"
    }
  ];

  List<Map<String, dynamic>> topicList = [
    {'name': "Adoptions"},
    {'name': "Health"},
    {'name': "Behaviour"},
    {'name': "Food"},
    {'name': "Body Modification"},
    {'name': "Training Methods"}
  ];

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // scrollController.addListener(() {
    //
    //   if (scrollController.position.maxScrollExtent ==
    //
    //       scrollController.position.pixels) {
    //
    //
    //           print("max position ---- ${scrollController.position.maxScrollExtent}");
    //
    //   }
    //
    // });

    super.onInit();
  }
}

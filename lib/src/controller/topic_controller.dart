import 'package:dog_news/src/controller/discover_controller.dart';
import 'package:dog_news/utils/image_path_network.dart';
import 'package:get/get.dart';

class TopicController extends GetxController{

  List<Map<String, dynamic>> topicList = [{'image':ImagePathNetwork.dog8, 'name': "Health"},
    {'image':ImagePathNetwork.dog2,'name': "Food"},
    {'image': ImagePathNetwork.dog6, 'name': "Dog Behaviour"},
    {'image': ImagePathNetwork.dog7, 'name': "Animal Cruelty"},
    {'image':ImagePathNetwork.dog4, 'name': "Barking Problems"},
    {'image':ImagePathNetwork.dog5, 'name': "Bones for Your Dog"}
  ];


}
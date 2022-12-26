import 'package:get/get.dart';

import '../../utils/image_path_network.dart';

class SearchController extends GetxController{

  /// Short List Controller

  List<Map<String, dynamic>> shortList = [{'image':ImagePathNetwork.dog8, 'name': "Dog Attack: Dog attack on child in Thane, Mumbai"},
    {'image':ImagePathNetwork.dog1,'name': "Asked to put ‘Dog’ in a pet carrier, passenger throws bottle at fellow flyer"},
    {'image': ImagePathNetwork.dog2, 'name': "Dog Attack: Dog attack on child in Thane, Mumbai"},
    {'image': ImagePathNetwork.dog1, 'name': "Viral Video: Pet Dog goes Paragliding with owner, netizens react- WATCH"},
    {'image':ImagePathNetwork.dog, 'name': "Rashmika laughs off report claiming she demands flight tickets for her dog "},
    {'image':ImagePathNetwork.dog7, 'name': "Barack Obama announces death of former US 'first dog', says lost true friend"},
    {'image':ImagePathNetwork.dog1,'name': "Asked to put ‘Dog’ in a pet carrier, passenger throws bottle at fellow flyer"},
    {'image':ImagePathNetwork.dog, 'name': "Rashmika laughs off report claiming she demands flight tickets for her dog "},
    {'image':ImagePathNetwork.dog8,'name': "Asked to put ‘Dog’ in a pet carrier, passenger throws bottle at fellow flyer"},
    {'image': ImagePathNetwork.dog1, 'name': "Viral Video: Pet Dog goes Paragliding with owner, netizens react- WATCH"}




  ];

  List<Map<String, dynamic>> topicList = [{'name':"Adoptions"},
    {'name':"Health"},
    {'name': "Behaviour"},
    {'name':"Food" },
    {'name':"Body Modification"},
    {'name':"Training Methods"}
  ];
}
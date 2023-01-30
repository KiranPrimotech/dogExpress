import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RelevancyController extends GetxController{

  RxMap<String, int> map1 = {'politics': 0, 'business': 0, 'item1': 0,
    'item2': 0,'item3': 0}.obs;

  void getData(){
    for (String key in map1.keys){
      debugPrint(key);

      debugPrint(" map values ---  ${map1[key]}");
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void onValueChange(key , value ){
    if(0 == value){
      map1[key]= value;
    }

    else if(1 == value){
      map1[key]= value;
    }
    else{
      map1[key]= value;
    }

  }
}
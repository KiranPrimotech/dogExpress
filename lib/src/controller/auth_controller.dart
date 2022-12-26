import 'package:get/get.dart';

import '../../utils/routes/app_routes.dart';

class SignController extends GetxController{



  Function onClickFunction({required OnClick action}){
    Map<OnClick ,void Function()> actions = {
      /// Click  facebook
      OnClick.facebook : (){},
      /// Click Google
      OnClick.google : (){},
      /// Click Twitter
      OnClick.twitter : (){print(action);},
      /// Click phone
      OnClick.phone : (){
        Get.toNamed(AppRoutes.phoneAuth);
      },

    };

    Function act = actions[action]!;
    return act ;
  }


}

enum OnClick{
  facebook,
  google,
  twitter,
  phone
}
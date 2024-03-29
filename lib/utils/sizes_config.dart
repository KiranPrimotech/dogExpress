import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeConfig {
 late final MediaQueryData _mediaQueryData;
 late final double screenWidth;
 late final double screenHeight;
 late final double blockSizeHorizontal;
 late final double blockSizeVertical;

 late final double _safeAreaHorizontal;
 late final double _safeAreaVertical;
 late final double safeBlockHorizontal;
 late final double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }


  void responsiveDimension(){
    if(Get.width <= 480) {

      // margins
      Dimens.margin = 16.0;
      Dimens.marginLarge = 18.0;
      Dimens.marginExtraLarge = 22.0;
      Dimens.marginSmall = 12.0;
      Dimens.largeSpace = 35.0;
    }

    //   // font sizes
    //   Dimens.fontExtraSmall = 10.0;
    //   Dimens.fontSmall = 12.0;
    //   Dimens.fontMedium = 14.0;
    //   Dimens.fontNormal = 16.0;
    //   Dimens.fontLarge = 21.0;
    //   Dimens.fontExtraLarge = 25.0;
    //
    //   // padding
    //   Dimens.padding2px = 2.0;
    //   Dimens.smallPadding = 5.0;
    //   Dimens.extraSmallPadding = 8.0;
    //   Dimens.mediumPadding = 12.0;
    //   Dimens.padding = 16.0;
    //
    //   //elevation
    //   Dimens.elevationNormal = 6.0;
    //
    //   //TextFiled
    //   Dimens.borderRadius = 10.0;
    //
    //   //extra
    //   Dimens.roundBtRadius = 20.0;
    // }

  }

}

class Dimens {
  // margins
  static  double margin = 16.0;
  static  double marginLarge = 18.0;
  static  double marginExtraLarge = 22.0;
  static  double marginSmall = 12.0;
  static  double largeSpace = 35.0;

// font sizes
  static const  double fontExtraSmall = 10.0;
  static const  double fontSmall = 12.0;
  static const  double fontMedium = 14.0;
  static const  double fontNormal = 16.0;
  static const  double fontLarge = 21.0;
  static const  double fontExtraLarge = 25.0;

// padding
  static const  double padding2px = 2.0;
  static const  double smallPadding = 5.0;
  static const  double extraSmallPadding = 8.0;
  static const  double mediumPadding = 12.0;
  static const  double padding = 16.0;

  // elevation
  static const double elevationNormal = 6.0;

  //TextFiled
  static const  double borderRadius = 10.0;

  // Extra
  static  const double roundBtRadius = 20.0;
}

import 'package:flutter/widgets.dart';

/**
 * Created by baay404@gmail.com
 */

class SizeConfig{
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHight;
  static double blockHorizontal;
  static double blockVertical;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHight = _mediaQueryData.size.height;
    blockHorizontal = screenWidth / 100;
    blockVertical = screenHight / 100;
  }
}

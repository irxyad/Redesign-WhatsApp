// import 'package:flutter/material.dart';

// class SizeConfig {
//   static late MediaQueryData _mediaQueryData;
//   static late double screenWidth;
//   static late double screenHeight;
//   static late double defaultSize;
//   static late Orientation orientation;

//   static void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = _mediaQueryData.size.width;
//     screenHeight = _mediaQueryData.size.height;
//     orientation = _mediaQueryData.orientation;
//   }
// }

// // Get the proportionate height as screen size

// double getProportionateScreenHeight(double inputHeight) {
//   double screenHeight = SizeConfig.screenHeight;
//   //812 is the layout height that my design use
//   return (inputHeight / 812.0) * screenHeight;
// }

// // Get the proportionate width as screen size

// double getProportionateScreenWidth(double inputHeight) {
//   double screenWidth = SizeConfig.screenWidth;
//   //812 is the layout height that my design use
//   return (inputHeight / 812.0) * screenWidth;
// }
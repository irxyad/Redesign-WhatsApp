import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../material/colors/list_gradient.dart';

final pages = [
  Container(
    height: Get.height,
    width: Get.width,
    color: Colors.red,
  ),
  Container(
    height: Get.height,
    width: Get.width,
    color: Colors.blue,
  ),
  Container(
    height: Get.height,
    width: Get.width,
    color: Colors.amber,
  ),
  Container(
    height: Get.height,
    width: Get.width,
    color: Colors.green.shade800,
  ),
  Container(
    height: Get.height,
    width: Get.width,
    color: Colors.pink.shade300,
  ),
  Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: BgGradient.amin,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight))),
  Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: BgGradient.electViolet,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter))),
  Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: BgGradient.lawrenCium,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight))),
  Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: BgGradient.moonlitAsteroid,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight))),
  Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: BgGradient.wireTap,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight))),
  Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: BgGradient.yoda,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight))),
];

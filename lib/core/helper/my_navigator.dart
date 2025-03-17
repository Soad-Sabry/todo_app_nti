import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyNavigator{
  static void  navigateTo( Widget screen){
    Get.to(()=>screen,
    transition:Transition.rightToLeftWithFade,
      duration: Duration(microseconds: 1500),
    );
  }
}
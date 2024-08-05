import 'package:crypto_tracker_1/View/cryptolistpage/cryptolist.dart';
import 'package:crypto_tracker_1/View/favoritescreen/favoritescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page_View_controller extends GetxController{
   //RxPageController pageController = PageController().;
    var selectedIndex = 0.obs;

    List<Widget> pages = [
    Cryptolistscreen(),
  Favoritescreen(),
  ];


  void changePage(int index) {
    selectedIndex.value = index;
  }
}
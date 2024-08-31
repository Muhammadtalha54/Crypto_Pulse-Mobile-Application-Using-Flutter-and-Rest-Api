import 'package:crypto_tracker_1/View/chartsscreen/chartsscreen.dart';
import 'package:crypto_tracker_1/View/cryptolistpage/cryptolist.dart';
import 'package:crypto_tracker_1/View/favoritescreen/favoritescreen.dart';
import 'package:crypto_tracker_1/View/wallet/gen_or_import/generate_or_import.dart';
import 'package:crypto_tracker_1/View/wallet/walletdetailpage/walletpage1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page_View_controller extends GetxController {
  //RxPageController pageController = PageController().;
  var selectedIndex = 0.obs;

  List<Widget> pages = [Cryptolistscreen(), Favoritescreen(), WalletPage()];

  void changePage(int index) {
    selectedIndex.value = index;
    
  }
}

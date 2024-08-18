import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';
import 'package:flutter/material.dart'; // Import the Flutter material library
import 'package:get/get.dart';

class CarouselController extends GetxController {
  // Observable variables for the current index and items
  RxInt currentIndex = 0.obs;
  RxList<Crypto_list_model> carouselItems =
      <Crypto_list_model>[].obs; // Observable list

  // Method to add items to the list at runtime
  void addItems(RxList<Crypto_list_model> items) {
    carouselItems.assignAll(items); // Assign new items to the list
  }

  void updateIndex(int index) {
    currentIndex.value = index % carouselItems.length;
  }
}

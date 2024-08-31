import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FavoriteScrollController extends GetxController {
  final scrollController = ScrollController();
  var offset = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    offset.value = scrollController.offset;
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }
}

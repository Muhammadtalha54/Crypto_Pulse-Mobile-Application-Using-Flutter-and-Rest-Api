import 'package:crypto_tracker_1/Resources/Components/titleanddetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Detailsrow extends StatelessWidget {
  Detailsrow({Key? key, this.title, this.detail, this.title2, this.detail2})
      : super(key: key);
  String? title;
  String? detail;
  String? title2;
  String? detail2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.93,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null && detail != null)
            Container(
              width: Get.width * 0.4,
              child: Titleanddetail(
                Title: title!,
                detail: detail!,
              ),
            ),
          SizedBox(
            width: Get.width * 0.03,
          ),
          if (title2 != null && detail2 != null)
            Container(
              width: Get.width * 0.4,
              child: Titleanddetail(
                Title: title2!,
                detail: detail2!,
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Titleanddetail extends StatelessWidget {
  Titleanddetail({Key? key, this.Title, this.detail}) : super(key: key);
  String? Title;
  String? detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Title!,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: Get.height * 0.0,
        ),
        Text(
          detail!,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}

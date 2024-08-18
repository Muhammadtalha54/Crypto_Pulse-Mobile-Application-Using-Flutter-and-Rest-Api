
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, this.heading});
  final String? heading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.05,
      width: Get.width * 0.87,
      child: Text(heading!,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.titleLarge),
    );
  }
}

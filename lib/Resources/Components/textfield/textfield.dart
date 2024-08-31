import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final bool? obscureText;

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height * 0.07,
        width: Get.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).iconTheme.color!,
              width: 2,
            )),
        child: TextFormField(
          cursorColor: Theme.of(context).iconTheme.color,
          controller: controller,
          obscureText: obscureText!,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Theme.of(context).iconTheme.color),
              prefixIcon: icon != null ? Icon(icon) : null,
              border: InputBorder.none),
        ));
  }
}

import 'package:crypto_tracker_1/Resources/Apptheme/Apptheme.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Roundbutton extends StatelessWidget {
  const Roundbutton(
      {Key? key,
      this.buttoncolor,
      this.textcolor,
      required this.title,
      required this.onpress,
      required this.radius,
      required this.Width,
      required this.Height,
      this.textSize,
      this.loading});

  final bool? loading;
  final String title;
  final double? radius;
  final double Height, Width;
  final VoidCallback onpress;
  final double? textSize;

  final Color? textcolor, buttoncolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: Height,
        width: Width,
        decoration: BoxDecoration(
            color: buttoncolor, borderRadius: BorderRadius.circular(radius!)),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: textcolor, fontSize: textSize),
          ),
        ),
      ),
    );
  }
}

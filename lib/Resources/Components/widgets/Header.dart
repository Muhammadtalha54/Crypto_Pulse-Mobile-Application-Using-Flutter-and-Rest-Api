import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cryptoHeader extends StatelessWidget {
  final String? welcomeText;
  final String? trackerText;
  final IconData? icon;
  final VoidCallback? onIconTap;
  final Color? iconColor;

  cryptoHeader({
    this.welcomeText,
    this.trackerText,
    this.icon,
    this.onIconTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Get.height * 0.13,
        width: Get.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text(
              welcomeText ?? '',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Container(
              height: Get.height * 0.076,
              width: Get.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    trackerText ?? '',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  InkWell(
                    onTap: onIconTap,
                    child: Icon(
                      icon,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

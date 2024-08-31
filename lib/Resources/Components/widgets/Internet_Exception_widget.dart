import 'package:crypto_tracker_1/Resources/Apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Internet_exception_widget extends StatefulWidget {
  const Internet_exception_widget({super.key, required this.onpress});
  final VoidCallback onpress;

  @override
  State<Internet_exception_widget> createState() =>
      _Internet_exception_widgetState();
}

class _Internet_exception_widgetState extends State<Internet_exception_widget> {
  @override
  var height, width;
  Widget build(BuildContext context) {
    // height = MediaQuery.of(context).size.height;
    // width = MediaQuery.of(context).size.width;
    return Container(
      height: Get.height * 0.7,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/png1.png', // Path to your SVG asset
              // Apply color if needed
              width: width, // Set width and height
              height: Get.height * 0.5,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Center(
            child: Container(
              height: Get.height * 0.1,
              width: Get.width * 0.7,
              child: Center(
                child: Text(
                  'No Internet Connection',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.coiny(
                    color: Colors.black,
                    fontSize: Get.width * 0.04,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Retry",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}

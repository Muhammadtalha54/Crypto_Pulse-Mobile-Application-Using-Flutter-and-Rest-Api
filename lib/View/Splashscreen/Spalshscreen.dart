import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crypto_tracker_1/Resources/Routes/Routenames.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Viewmodel/Services/Splashservices.dart';
import '../Homescreen/Homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  SplashServices splashservices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashservices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary, // #2b4162
              Theme.of(context).colorScheme.secondary, // #12100e
            ],
            begin: Alignment
                .topLeft, // 315 degrees corresponds to top-left to bottom-right
            end: Alignment.bottomRight,
            stops: [0.0, 0.74], // #2b4162 at 0%, #12100e at 74%
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.4,
              width: Get.width * 0.9,
              child: Image.asset("assets/Icon/gif2.gif"),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            Container(
                width: Get.width * 0.7,
                height: Get.height * 0.2,
                child: AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    // speed: 2
                    "Welcome to Crypto Tracker Mobile App",
                    textStyle: GoogleFonts.coiny(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromRGBO(85, 173, 240, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}

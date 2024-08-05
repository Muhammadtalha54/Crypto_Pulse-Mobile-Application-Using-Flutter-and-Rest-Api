import 'dart:async';

import 'package:crypto_tracker_1/Resources/Routes/Routenames.dart';
import 'package:get/get.dart';

class SplashServices {
  // UserPrefrences userPrefrence = UserPrefrences();
  void isLogin() {
    Timer(
      const Duration(seconds: 3),
      () {
        // Ensure RouteNames.LoginScreen is not null
        if (RouteNames.Homescreen != null) {
          Get.toNamed(RouteNames.Homescreen);
        } else {
          // Handle the case where the route is null
          print('Error: RouteNames.LoginScreen is null');
        }
      },
    );
  }
}












// userPrefrence.getuser().then((value) {
    //if (value.islogin==false || value.islogin.toString()== 'null') {
    //   Timer(
    //     const Duration(seconds: 3),
    //     () {
    //       // Ensure RouteNames.LoginScreen is not null
    //       if (RouteNames.LoginScreen != null) {
    //         Get.toNamed(RouteNames.LoginScreen);
    //       } else {
    //         // Handle the case where the route is null
    //         print('Error: RouteNames.LoginScreen is null');
    //       }
    //     },
    //   );
    // } else {
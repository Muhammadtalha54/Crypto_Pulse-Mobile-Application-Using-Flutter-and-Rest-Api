import 'package:crypto_tracker_1/Resources/Routes/Routenames.dart';
import 'package:crypto_tracker_1/View/Detailspage/Detailspage.dart';
import 'package:crypto_tracker_1/View/Homescreen/Homescreen.dart';
import 'package:get/get.dart';

import '../../View/Splashscreen/Spalshscreen.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes() {
    return [
      GetPage(
        name: RouteNames.Splashscreen,
        page: () => Splashscreen(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
      GetPage(
        name: RouteNames.Homescreen,
        page: () => HOmescreen(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
      GetPage(
        name: RouteNames.Detailsscreen,
        page: () => Detailspage(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
      ),

      // Add more GetPage objects as needed
    ];
  }
}

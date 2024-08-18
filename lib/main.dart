import 'package:crypto_tracker_1/Resources/Apptheme/Apptheme.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/themecontroller/Themecontroller.dart';
import 'package:crypto_tracker_1/Resources/Routes/Routenames.dart';
import 'package:crypto_tracker_1/Resources/Routes/Routes.dart';
import 'package:crypto_tracker_1/View/Splashscreen/Spalshscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Resources/Getx_localization/Languages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themecontroller _themeController = Get.put(themecontroller());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          translations: Languages(),

          locale: Locale('en', 'US'),

          darkTheme: darkTheme,
          //theme: lightTheme,
          theme: lightTheme,
          themeMode: _themeController.isDarkmode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const Splashscreen(),
          getPages: AppRoutes.routes(),
        );
      },
    );
  }
}

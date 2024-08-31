
import 'package:crypto_tracker_1/Resources/Apptheme/Apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class themecontroller extends GetxController {
  RxBool isDarkmode = false.obs;

  void toggleTheme() {
    isDarkmode.value = !isDarkmode.value;
    _saveTheme(isDarkmode.value);
    Get.changeTheme(isDarkmode.value ? darkTheme: lightTheme);
  }

  void onInit() {
    super.onInit();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    //isDarkmode.value = prefs.getBool('isDarkMode') ?? false;
    bool darkMode = prefs.getBool('isDarkMode') ?? false;
    Get.changeTheme(isDarkmode.value ? darkTheme : lightTheme);
    isDarkmode.value = darkMode;
    Get.changeTheme(darkMode ? darkTheme : lightTheme);
    if (kDebugMode){
    print("Loaded Theme: ${darkMode ? 'Dark' : 'Light'}");}
  }

  Future<void> _saveTheme(bool isDark) async {
     if (kDebugMode){
    print("dark mode vale$isDark.");}
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
     if (kDebugMode){
    print("Saved Theme: ${isDark ? 'Dark' : 'Light'}");} // Debug
  }
}

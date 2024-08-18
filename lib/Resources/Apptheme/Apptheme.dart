import 'package:flutter/material.dart';

class Appcolor {
  // Light theme colors
  static const Color YellowColor = Colors.yellow;
  static const Color TextColor = Color.fromARGB(255, 0, 0, 0);
  static const Color tButtonColor = Color.fromARGB(255, 251, 105, 0);
  static const Color ExceptionIconColor = Color.fromARGB(255, 245, 0, 12);
  static const Color backgroundcolor = Color.fromARGB(255, 255, 255, 255);
}

var lightTheme = ThemeData(
    cardColor: Color.fromARGB(255, 255, 255, 255),
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: Color.fromARGB(255, 230, 230, 230),

      primaryContainer: Color.fromARGB(255, 137, 175, 76),
      onBackground: Colors.black,

      background: Color.fromARGB(255, 220, 215, 213),
      brightness: Brightness.light, //background: Colors.red
    ),
    primaryColor: Colors.white,
    textTheme: TextTheme(
      // for price
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.blue,
      ),
      // for appbar heading
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.blue,
      ),
      // for symbol in subtitle
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      // for title of detail
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 17,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      // for details
      bodyMedium: TextStyle(
        fontSize: 15,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      // for title
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 17,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      // market change percentage negative
      labelSmall: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      // market change percentage positive
      labelMedium: TextStyle(
        color: Color.fromARGB(198, 17, 104, 15),
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0), size: 25),
    cardTheme: CardTheme(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 255, 255, 255), elevation: 0),
    backgroundColor: Color.fromARGB(255, 255, 255, 255));
// Old Style Names:

// headline1, headline2, headline3, headline4, headline5, headline6
// subtitle1, subtitle2
// bodyText1, bodyText2
// caption, button, overline
// New Style Names:

// displayLarge, displayMedium, displaySmall
// headlineLarge, headlineMedium, headlineSmall
// titleLarge, titleMedium, titleSmall
// bodyLarge, bodyMedium, bodySmall
// labelLarge, labelMedium, labelSmall

var darkTheme = ThemeData(
    cardColor: Colors.black,
    useMaterial3: true,
    unselectedWidgetColor: Colors.red,
    primaryColor: Color.fromARGB(255, 0, 0, 0),
    textTheme: TextTheme(
      // for price
      // for price
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.blue,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      // for appbar heading
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.blue,
      ),
      // for symbol in subtitle
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      // for title of detail
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 17,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      // for details
      bodyMedium: TextStyle(
        //fontWeight: FontWeight.w400,
        fontSize: 15,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      // for title
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 17,
        color: Color.fromARGB(255, 248, 248, 248),
      ),

      // market change percentage negative
      labelSmall: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      // market change percentage positive
      labelMedium: TextStyle(
        color: Color.fromARGB(197, 41, 198, 39),
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.white, size: 25),
    colorScheme: ColorScheme.dark(
      primary: Color.fromARGB(255, 0, 0, 0),
      primaryContainer: Color.fromARGB(255, 133, 199, 26),
      onBackground: Colors.black,

      background: Color.fromARGB(255, 0, 0, 0),
      brightness: Brightness.dark, //background: Colors.red
    ),
    cardTheme: CardTheme(
        elevation: 5,
        color: Color.fromARGB(255, 0, 0, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      elevation: 0,
    ),
    backgroundColor: Color.fromARGB(255, 0, 0, 0));

// import 'package:flutter/material.dart';

// class Appcolor {
//   // Light theme colors
//   static const Color YellowColor = Colors.yellow;
//   static const Color TextColor = Color.fromARGB(255, 0, 0, 0);
//   static const Color tButtonColor = Color.fromARGB(255, 251, 105, 0);
//   static const Color ExceptionIconColor = Color.fromARGB(255, 245, 0, 12);
//   static const Color backgroundcolor = Color.fromARGB(255, 255, 255, 255);
// }

// var lightTheme = ThemeData(
//   cardColor: const Color.fromARGB(255, 255, 255, 255),
//   useMaterial3: true,
//   colorScheme: const ColorScheme.light(
//     //  primary: const  Color(0xFFb8c6db),
//     //   secondary: const Color(0xFFf5f7fa),
//     primary: const Color(0xFFF1DFD1),
//     secondary: const Color(0xFFF6F0EA),
//     //will be used for card
//     // #f9fcff

//     primaryContainer: Color(0xFFF9FCFF),
//     secondaryContainer: Color.fromARGB(255, 230, 231, 232),
//     onBackground: Colors.black,

//     background: Color.fromARGB(255, 220, 215, 213),
//     brightness: Brightness.light, //background: Colors.red
//   ),
//   primaryColor: Colors.white,
//   textTheme: const TextTheme(
//     // for price
//     headlineLarge: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 30,
//       color: Color.fromARGB(255, 0, 0, 0),
//     ),
//     bodyLarge: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 18,
//       color: Colors.blue,
//     ),
//     // for appbar heading
//     headlineSmall: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 20,
//       color: Color.fromARGB(255, 0, 0, 0),
//     ),
//     headlineMedium: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 20,
//       color: Colors.blue,
//     ),
//     // for symbol in subtitle
//     titleMedium: TextStyle(
//       fontWeight: FontWeight.w500,
//       fontSize: 14,
//       color: Color.fromARGB(255, 0, 0, 0),
//     ),
//     // for title of detail
//     titleSmall: TextStyle(
//       fontWeight: FontWeight.w500,
//       fontSize: 17,
//       color: Color.fromARGB(255, 0, 0, 0),
//     ),
//     // for details
//     bodyMedium: TextStyle(
//       fontSize: 15,
//       color: Color.fromARGB(255, 0, 0, 0),
//     ),
//     // for title
//     labelLarge: TextStyle(
//       fontWeight: FontWeight.w500,
//       fontSize: 17,
//       color: Color.fromARGB(255, 0, 0, 0),
//     ),
//     // market change percentage negative
//     labelSmall: TextStyle(
//       color: Colors.red,
//       fontWeight: FontWeight.w600,
//       fontSize: 14,
//     ),
//     // market change percentage positive
//     labelMedium: TextStyle(
//       color: Color.fromARGB(198, 17, 104, 15),
//       fontWeight: FontWeight.w600,
//       fontSize: 14,
//     ),
//     titleLarge: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 17,
//       color: Color.fromARGB(255, 0, 0, 0),
//     ),
//   ),
//   iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0), size: 25),
//   cardTheme: CardTheme(
//       elevation: 5,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
//   appBarTheme: AppBarTheme(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255), elevation: 0),
//   backgroundColor: Color.fromARGB(255, 255, 255, 255),
// );
// // Old Style Names:

// // headline1, headline2, headline3, headline4, headline5, headline6
// // subtitle1, subtitle2
// // bodyText1, bodyText2
// // caption, button, overline
// // New Style Names:

// // displayLarge, displayMedium, displaySmall
// // headlineLarge, headlineMedium, headlineSmall
// // titleLarge, titleMedium, titleSmall
// // bodyLarge, bodyMedium, bodySmall
// // labelLarge, labelMedium, labelSmall

// var darkTheme = ThemeData(
//     cardColor: Colors.black,
//     useMaterial3: true,
//     unselectedWidgetColor: Colors.red,
//     primaryColor: Color.fromARGB(255, 0, 0, 0),
//     textTheme: const TextTheme(
//       // for price
//       // for price
//       headlineLarge: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 30,
//         color: Color.fromARGB(255, 255, 255, 255),
//       ),
//       bodyLarge: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 18,
//         color: Colors.blue,
//       ),
//       titleLarge: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 17,
//         color: Color.fromARGB(255, 255, 255, 255),
//       ),
//       // for appbar heading
//       headlineSmall: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 18,
//         color: Color.fromARGB(255, 255, 255, 255),
//       ),
//       headlineMedium: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 20,
//         color: Colors.blue,
//       ),
//       // for symbol in subtitle
//       titleMedium: TextStyle(
//         fontWeight: FontWeight.w500,
//         fontSize: 14,
//         color: Color.fromARGB(255, 255, 255, 255),
//       ),
//       // for title of detail
//       titleSmall: TextStyle(
//         fontWeight: FontWeight.w500,
//         fontSize: 17,
//         color: Color.fromARGB(255, 255, 255, 255),
//       ),
//       // for details
//       bodyMedium: TextStyle(
//         //fontWeight: FontWeight.w400,
//         fontSize: 15,
//         color: Color.fromARGB(255, 255, 255, 255),
//       ),
//       // for title
//       labelLarge: TextStyle(
//         fontWeight: FontWeight.w500,
//         fontSize: 17,
//         color: Color.fromARGB(255, 248, 248, 248),
//       ),

//       // market change percentage negative
//       labelSmall: TextStyle(
//         color: Colors.red,
//         fontWeight: FontWeight.w600,
//         fontSize: 14,
//       ),
//       // market change percentage positive
//       labelMedium: TextStyle(
//         color: Color.fromARGB(197, 41, 198, 39),
//         fontWeight: FontWeight.w600,
//         fontSize: 14,
//       ),
//     ),
//     iconTheme: const IconThemeData(color: Colors.white, size: 25),
//     colorScheme: ColorScheme.dark(
//       // will be used for gradients on the backgrou
//       primary: Color(0xFF2b4162), // #2b4162
//       // #12/
//       secondary: Color(0xFF12100e),
//       //will be used for card
//       //  primaryContainer: const Color(0xFF000000),
//       // secondaryContainer: Color.fromARGB(255, 89, 46, 9),
//       primaryContainer: const Color(0xFF000000),
//       secondaryContainer: const Color(0xFF2c3e50),
//       onBackground: Colors.black,

//       background: const Color.fromARGB(255, 0, 0, 0),
//       brightness: Brightness.dark, //background: Colors.red
//     ),
//     cardTheme: CardTheme(
//         elevation: 5,
//         color: Colors.transparent,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
//     appBarTheme: AppBarTheme(
//       backgroundColor: Color.fromARGB(255, 0, 0, 0),
//       elevation: 0,
//     ),
//     backgroundColor: Color.fromARGB(255, 0, 0, 0));

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ...

var screenWidth = Get.width;
var screenHeight = Get.height;

class Appcolor {
  // Light theme colors
  static const Color YellowColor = Colors.yellow;
  static const Color TextColor = Color.fromARGB(255, 0, 0, 0);
  static const Color tButtonColor = Color.fromARGB(255, 251, 105, 0);
  static const Color ExceptionIconColor = Color.fromARGB(255, 245, 0, 12);
  static const Color backgroundcolor = Color.fromARGB(255, 255, 255, 255);
}

var lightTheme = ThemeData(
  cardColor: const Color.fromARGB(255, 255, 255, 255),
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: const Color(0xFFF1DFD1),
    secondary: const Color(0xFFF6F0EA),
    primaryContainer: Color(0xFFF9FCFF),
    secondaryContainer: Color.fromARGB(255, 230, 231, 232),
    onBackground: Colors.black,
    background: Color.fromARGB(255, 220, 215, 213),
    brightness: Brightness.light,
  ),
  primaryColor: Colors.white,
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenWidth * 0.065, // 5% of screen width
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenWidth * 0.039, // 3.5% of screen width
      color: Colors.blue,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenWidth * 0.06, // 4% of screen width
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenWidth * 0.05, // 4.5% of screen width
      color: Colors.blue,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: screenWidth * 0.04, // 3% of screen width
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: screenWidth * 0.04, // 3.2% of screen width
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: screenWidth * 0.036, // 2.8% of screen width
        color: Color.fromARGB(255, 0, 0, 0)),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: screenWidth * 0.04, // 3.5% of screen width
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    labelSmall: TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w600,
      fontSize: screenWidth * 0.035, // 2.5% of screen width
    ),
    labelMedium: TextStyle(
      color: Color.fromARGB(198, 17, 104, 15),
      fontWeight: FontWeight.w600,
      fontSize: screenWidth * 0.035, // 2.5% of screen width
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenWidth * 0.04, // 3.5% of screen width
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ),
  iconTheme: IconThemeData(
    color: Color.fromARGB(255, 0, 0, 0),
    size: screenWidth * 0.06, // 5% of screen width
  ),
  cardTheme: CardTheme(
    elevation: 5,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(screenWidth * 0.02), // 2% of screen width
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    elevation: 0,
  ),
  backgroundColor: Color.fromARGB(255, 255, 255, 255),
);

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
        fontSize: screenWidth * 0.065,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: screenWidth * 0.039,
        color: Colors.blue,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: screenWidth * 0.04,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      // for appbar heading
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: screenWidth * 0.06,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: screenWidth * 0.05,
        color: Colors.blue,
      ),
      // for symbol in subtitle
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: screenWidth * 0.04,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      // for title of detail
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: screenWidth * 0.04,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      // for details
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: screenWidth * 0.036,
          color: Color.fromARGB(255, 247, 247, 247)),
      // for title
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: screenWidth * 0.04,
        color: Color.fromARGB(255, 248, 248, 248),
      ),

      // market change percentage negative
      labelSmall: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: screenWidth * 0.034,
      ),
      // market change percentage positive
      labelMedium: TextStyle(
        color: Color.fromARGB(197, 41, 198, 39),
        fontWeight: FontWeight.w600,
        fontSize: screenWidth * 0.035,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white, size: 25),
    colorScheme: ColorScheme.dark(
      // will be used for gradients on the backgrou
      primary: Color(0xFF2b4162), // #2b4162
      // #12/
      secondary: Color(0xFF12100e),
      //will be used for card
      //  primaryContainer: const Color(0xFF000000),
      // secondaryContainer: Color.fromARGB(255, 89, 46, 9),
      primaryContainer: const Color(0xFF000000),
      secondaryContainer: const Color(0xFF2c3e50),
      onBackground: Colors.black,

      background: const Color.fromARGB(255, 0, 0, 0),
      brightness: Brightness.dark, //background: Colors.red
    ),
    cardTheme: CardTheme(
        elevation: 5,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      elevation: 0,
    ),
    backgroundColor: Color.fromARGB(255, 0, 0, 0));

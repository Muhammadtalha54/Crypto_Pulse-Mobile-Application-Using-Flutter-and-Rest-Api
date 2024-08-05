import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:crypto_tracker_1/Data/Network/Base_api_services.dart';
import 'package:crypto_tracker_1/Data/Responce/App_exceptions.dart';
import 'package:flutter/foundation.dart';

class NetworkApiServices extends BaseApiAervices {
  @override
  Future<List<dynamic>> getApi(String Url) async {
    // if (kDebugMode) {
    //   print(Url);
    // }

// a variable that isuse for storing the responce
    dynamic responsejson;

    try {
      final response =
          //this is get api function
          await http.get(Uri.parse(Url)).timeout(Duration(seconds: 20));

      responsejson = Returnresponse(response);
    }

    //Socket execption means that internet is unavailable
    on SocketException {
      //these exceptions are defined already in a seperate file
      // Get.snackbar("NO Internet", "No internet connecttion");
      throw InternetExceptions("No internet available");
    } on TimeoutException {
      //  Get.snackbar("Request timed out", "Time out exception");
      throw RequestTimeout("Timed out");
    }
    return responsejson;
  }

  static dynamic Returnresponse(http.Response response) {
    //print(response.body.toString());
    switch (response.statusCode) {
      case 200:
        //the response will be decoded and then assigned to the variable
        dynamic responsejson = jsonDecode(response.body);
        List<dynamic> apirespponce = responsejson as List<dynamic>;
        // print('the markets');
        //print(markets);
        // print(apirespponce);
        return responsejson;

      case 400:
        throw BadRequestexception('Bad request');
        // Get.snackbar("400", 'll');
        break;
      case 401:
        throw Authorizationexception('User not authorized');
        //Get.snackbar("401", 'll');
        break;
      case 403:
        throw Userforbiddenexception('Blocked  by server');
        // Get.snackbar("403", 'll');
        break;
      case 429:
        RequestTimeout("REquest timed out");
        // Get.snackbar("429", 'll');
        break;
      case 500:
        ServerExceptions("Internal server error");
        // Get.snackbar("500", 'll');
        break;
      case 503:
        ServiceExceptions('service unavailable');
        //Get.snackbar("503", 'll');
        break;
      case 1020:
        Accessdeniedexception('Access denied');
        // Get.snackbar("1020", 'll');

        break;

      //the 500ponse will be decoded and then assigned to the variable

      default:
        FetchdataExceptions('Error occued while fetching data' +
            response.statusCode.toString());
    }
  }

  @override
  Future PostApi(data, String Url) {
    // TODO: implement PostApi
    throw UnimplementedError();
  }
}
//   @override
//   //this is post api function
//   Future PostApi(var data, String Url) async {
//     //  This condition   if(kDebugMode) checks that if the app is in debug mode then it will execute
// // thebody otherwise not
//     if (kDebugMode) {
//       print(Url);
//     }

// // a variable that isuse for storing the responce
//     dynamic responsejson;

//     try {
//       final response = await http
//           .post(Uri.parse(Url), body: data)
//           .timeout(Duration(seconds: 20));

//       responsejson = Returnresponse(response);
//     }

//     //Socket execption means that internet is unavailable
//     on SocketException {
//       throw InternetExceptions('');
//     } on RequestTimeout {
//       throw RequestTimeout('');
//     }
//     if (kDebugMode) {
//       print(responsejson);
//     }
//     return responsejson;
//   }
// }










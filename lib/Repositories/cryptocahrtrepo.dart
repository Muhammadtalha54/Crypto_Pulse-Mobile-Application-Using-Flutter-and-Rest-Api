import 'dart:convert';

import 'package:crypto_tracker_1/Data/Network/Network_api_services.dart';

import 'package:flutter/material.dart';

import '../Resources/App_urls/App_urls.dart';

class CryptoChart_Repository {
  final _apiServices = NetworkApiServices();

  Future<List<List<dynamic>>> getChartdata(String name) async {
    try {
      Appurls.coinid = name.toString().toLowerCase();
      String url = Appurls.Ohlcchart;
      dynamic responce = await _apiServices.getApi(url);
      // print(url);
      // print('Raw response: $responce');
      // print('Response type: ${responce.runtimeType}');

      if (responce is List) {
        // Check if the first item in the list is also a List
        if (responce.isNotEmpty && responce.first is List) {
          return responce.cast<List<dynamic>>();
        } else {
          throw Exception(
              'Expected a list of lists but received something else');
        }
      } else {
        throw Exception('Response is not a list');
      }
    } catch (e) {
//     // Handle exceptions such as network errors
      print('Error fetching data: $e');
      // debugPrint('1');
      return [];
    }
  }
}

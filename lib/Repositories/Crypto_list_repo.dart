import 'package:crypto_tracker_1/Data/Network/Network_api_services.dart';

import 'package:flutter/material.dart';

import '../Resources/App_urls/App_urls.dart';

class Cryptolist_Repository {
  final _apiServices = NetworkApiServices();
  Future<List<dynamic>> getMarkets() async {
    try {
      dynamic responce = await _apiServices.getApi(Appurls.Coinslistusd);
      List<dynamic> apirespponce = responce as List<dynamic>;

      return responce;
    } catch (e) {
//     // Handle exceptions such as network errors
      // print('Error fetching user list: $e');
      // debugPrint('1');
      return [];
    }
  }
}
























//   // Future<Userlistmodel> Userlistapipi() async {
//   //   dynamic responce =await _apiServices.getApi(Appurls.userlistapi);
//   //   return Userlistmodel.fromJson(responce);
//   List<Crypto_list_model> markets=[];

//   Future<Crypto_list_model?> Cryptolistapipi() async {
//     try {
//       List<dynamic> _markets=await _apiServices.getApi(Appurls.Coinslist);



//       List<Crypto_list_model> temp=[];
//       for (var market in _markets){
//         Crypto_list_model crypto= Crypto_list_model.fromJson(market);
//         temp.add(crypto);
//         markets=temp;

//       }
      
//       //dynamic response = await _apiServices.getApi(Appurls.Coinslist);
//     //   if (response != null && response is Map<String, dynamic>) {
//     //     return Crypto_list_model.fromJson(response);
//     //   } else {    //     // Handle invalid response format
//     //     print('Invalid response format');
//     //     return null;
//       }
//      catch (e) {
//       // Handle exceptions such as network errors
//       print('Error fetching user list: $e');
//      return null;
//     }
//   }
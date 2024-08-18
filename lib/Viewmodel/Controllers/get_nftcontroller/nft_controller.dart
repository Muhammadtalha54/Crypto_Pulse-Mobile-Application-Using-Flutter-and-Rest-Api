import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NFTController extends GetxController {
  // Observable for NFT list
  var nftList = <dynamic>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  // Fetch NFT list
  Future<void> fetchNFTList(String address, String chain) async {
    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse('http://192.168.45.253:5002/get_user_nfts?address=$address&chain=$chain'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        nftList.value = jsonData['result'];
      } else {
        errorMessage.value = 'Failed to load NFT list';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}

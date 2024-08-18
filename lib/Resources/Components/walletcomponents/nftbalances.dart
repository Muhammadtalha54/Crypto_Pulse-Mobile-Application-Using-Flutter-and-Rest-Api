import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Viewmodel/Controllers/get_nftcontroller/nft_controller.dart';
// Import the GetX controller

class NFTListPage extends StatelessWidget {
  final String address;
  final String chain;

  const NFTListPage({
    Key? key,
    required this.address,
    required this.chain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NFTController nftController = Get.put(NFTController());

    // Fetch the NFT list when the page is loaded
    nftController.fetchNFTList(address, chain);

    return Obx(() {
      if (nftController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (nftController.errorMessage.value.isNotEmpty) {
        return Center(
          child: Text(
            nftController.errorMessage.value,
            style: const TextStyle(color: Colors.red),
          ),
        );
      }

      if (nftController.nftList.isNotEmpty) {
        return ListView(
          children: nftController.nftList.map((nft) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    nft['name'] ?? 'No Name',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 200, // Adjust the height as needed
                    child: nft['normalized_metadata']['image'] != null
                        ? Image.network(
                            nft['normalized_metadata']['image'],
                            fit: BoxFit.contain,
                          )
                        : const Center(
                            child: Text('No Image Available'),
                          ),
                  ),
                  Text(
                    nft['normalized_metadata']['description'] ??
                        'No Description',
                  ),
                ],
              ),
            );
          }).toList(),
        );
      } else {
        return const Center(
          child: Text(
            'No NFT found',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        );
      }
    });
  }
}

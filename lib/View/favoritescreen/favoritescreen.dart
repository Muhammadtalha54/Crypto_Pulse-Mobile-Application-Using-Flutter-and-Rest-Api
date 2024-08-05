import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';
import 'package:crypto_tracker_1/Resources/Apptheme/Themecontroller.dart';
import 'package:crypto_tracker_1/Resources/Components/Header.dart';
import 'package:crypto_tracker_1/Resources/Components/Showdata.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/Cryptolist_controller/cryptolistcontroller.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/Favoritecontroler/favoritecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../Viewmodel/Controllers/chartscontroller/chartscontroller.dart';

class Favoritescreen extends StatefulWidget {
  const Favoritescreen({super.key});

  @override
  State<Favoritescreen> createState() => _FavoritescreenState();
}

class _FavoritescreenState extends State<Favoritescreen> {
  final cryptolistcontroller1 = Get.put(cryptolistcontroller());
  final favoroitecontroller1 = Get.put(favoroitecontroller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favoroitecontroller1.fetch_favoriteslist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        cryptoHeader(
          trackerText: "Favorite CryptoCurrency",
          icon: Icons.favorite,
        ),
        Obx(() {
          RxList<Crypto_list_model> favoriteCrypto =
              favoroitecontroller1.favoitecryptos;

          if (favoriteCrypto.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: favoriteCrypto.length,
                itemBuilder: (context, index) {
                  Crypto_list_model crypto = favoriteCrypto[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/Detailspage', arguments: {
                          'id': crypto.id!,
                          'name': crypto.name!
                        });
                        // Navigate or handle tap
                      },
                      child: Showcryptodata(
                        onpress: () {
                          // Handle add to favorites
                        },
                        onTap: () {
                          // Handle remove from favorites
                        },
                        cryptocurrency: crypto,
                        imageurl: crypto.image!,
                        cryptoname: crypto.name!,
                        cryptsymbol: crypto.symbol!,
                        price: crypto.currentPrice!,
                        height: Get.height * 0.1,
                        width: Get.width * 0.9,
                        pricechange: crypto.priceChange24h!,
                        prices: crypto.sparklineIn7d?.price,
                        pricechangeprecentage: crypto.priceChangePercentage24h!,
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text("No favorites"),
            );
          }
        }),
      ],
    ));
  }
}

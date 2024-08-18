import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/themecontroller/Themecontroller.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/Header.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/Showdata.dart';
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
  double itemsize = Get.height * 0.15;
  final cryptolistcontroller1 = Get.put(cryptolistcontroller());
  final favoroitecontroller1 = Get.put(favoroitecontroller());
  final scrollcontroller = ScrollController();

  void onlisten() {
    // print('scrollcontroller:${scrollcontroller.offset}');
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    scrollcontroller.addListener(onlisten);
    super.initState();
    favoroitecontroller1.fetch_favoriteslist();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollcontroller.removeListener(onlisten);
    super.dispose();
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
              child: Padding(
                padding: EdgeInsets.all(15),
                child: CustomScrollView(
                  controller: scrollcontroller,
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      final favorite = favoriteCrypto[index];
                      final itempositionedoffset = index * itemsize;
                      final difference =
                          scrollcontroller.offset - itempositionedoffset;
                      final percent = 1 - (difference / (itemsize));
                      //  if (index == 0) print(difference);
                      double opacity = percent;
                      double scale = percent;

                      if (opacity > 1.0) opacity = 1.0;
                      if (opacity < 0.0) opacity = 0.0;
                      if (percent > 1.0) scale = 1.0;

                      return InkWell(
                        onTap: () {
                          Get.toNamed('/Detailspage', arguments: {
                            'id': favorite.id!,
                            'name': favorite.name!
                          });
                        },
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(scale, 1.0),
                          child: Showcryptodata(
                              onpress: () {
                                cryptolistcontroller1.addfavorite(favorite);
                              },
                              onTap: () {
                                cryptolistcontroller1.removefavorite(favorite);
                              },
                              opacity1: opacity,
                              cryptocurrency: favorite,
                              imageurl: favorite.image!,
                              cryptoname: favorite.name!,
                              cryptsymbol: favorite.symbol!,
                              price: favorite.currentPrice!,
                              height: Get.height * 0.15,
                              width: Get.width * 0.9,
                              pricechange: favorite.priceChange24h!,
                              prices: favorite.sparklineIn7d?.price,
                              pricechangeprecentage:
                                  favorite.priceChangePercentage24h!),
                        ),
                      );
                    }, childCount: favoriteCrypto.length))
                  ],
                ),
              ),
              // child: ListView.builder(
              //   physics: BouncingScrollPhysics(),
              //   itemCount: favoriteCrypto.length,
              //   itemBuilder: (context, index) {
              //     Crypto_list_model crypto = favoriteCrypto[index];
              //     return Padding(
              //       padding: const EdgeInsets.only(left: 20, right: 20),
              //       child: InkWell(
              //         onTap: () {
              //           Get.toNamed('/Detailspage', arguments: {
              //             'id': crypto.id!,
              //             'name': crypto.name!
              //           });
              //           // Navigate or handle tap
              //         },
              //         child: Showcryptodata(
              //           onpress: () {
              //             // Handle add to favorites
              //           },
              //           onTap: () {
              //             // Handle remove from favorites
              //           },
              //           cryptocurrency: crypto,
              //           imageurl: crypto.image!,
              //           cryptoname: crypto.name!,
              //           cryptsymbol: crypto.symbol!,
              //           price: crypto.currentPrice!,
              //           height: Get.height * 0.15,
              //           width: Get.width * 0.9,
              //           pricechange: crypto.priceChange24h!,
              //           prices: crypto.sparklineIn7d?.price,
              //           pricechangeprecentage: crypto.priceChangePercentage24h!,
              //         ),
              //       ),
              //     );
              //   },
              // ),
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

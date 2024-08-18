// // import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';
// // import 'package:crypto_tracker_1/Resources/Components/candles.dart';
// // import 'package:flutter/material.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:get/get.dart';

// // class ReusableCarousel extends StatelessWidget {
// //   final RxList<Crypto_list_model> cryptoitems; // Observable list
// //   final double height;
// //   final double width;
// //   final int initialPage;
// //   final Duration autoPlayInterval;
// //   final Duration autoPlayAnimationDuration;
// //   final bool autoPlay;

// //   ReusableCarousel({
// //     this.height = 200.0,
// //     this.initialPage = 0,
// //     this.autoPlayInterval = const Duration(seconds: 3),
// //     this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
// //     this.autoPlay = true,
// //     required this.width,
// //     required this.cryptoitems,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: height,
// //       width: width,
// //       child: Obx(() {
// //         return CarouselSlider(
// //           options: CarouselOptions(
// //             height: height,
// //             aspectRatio: 16 / 9,
// //             viewportFraction: 0.8,
// //             initialPage: initialPage,
// //             enableInfiniteScroll: true,
// //             reverse: false,
// //             autoPlay: autoPlay,
// //             autoPlayInterval: autoPlayInterval,
// //             autoPlayAnimationDuration: autoPlayAnimationDuration,
// //             autoPlayCurve: Curves.ease,
// //             enlargeCenterPage: true,
// //             enlargeFactor: 0.3,
// //             scrollDirection: Axis.horizontal,
// //           ),
// //           items: cryptoitems.map((cryptoitem) {
// //             return Builder(
// //               builder: (BuildContext context) {
// //                 return Candlesdata(
// //                   height: Get.height * 0.2,
// //                   width: Get.width * 0.6,
// //                   imageurl: cryptoitem.image,
// //                   name: cryptoitem.name,
// //                   percentage: cryptoitem.priceChangePercentage24h,
// //                   marketcap: cryptoitem.marketCap?.toString(),
// //                   rank: cryptoitem.marketCapRank?.toString(),
// //                 );
// //               },
// //             );
// //           }).toList(),
// //         );
// //       }),
// //     );
// //   }
// // }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';

import 'package:crypto_tracker_1/Resources/Components/widgets/candles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReusableCarousel extends StatelessWidget {
  final RxList<Crypto_list_model> cryptoitems; // Observable list
  final double height;
  final double width;
  final double containerheight;
  final double containerwidth;
  final int initialPage;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;
  final bool autoPlay;

  ReusableCarousel({
    this.height = 200.0,
    this.initialPage = 0,
    this.autoPlayInterval = const Duration(seconds: 5),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 3000),
    this.autoPlay = true,
    required this.width,
    required this.cryptoitems,
    required this.containerheight,
    required this.containerwidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerheight,
      width: containerwidth,
      child: CarouselSlider(
        options: CarouselOptions(
          height: height,
          aspectRatio: 16 / 9,
          viewportFraction: 0.7,
          initialPage: initialPage,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: autoPlay,
          autoPlayInterval: autoPlayInterval,
          autoPlayAnimationDuration: autoPlayAnimationDuration,
          autoPlayCurve: Curves.ease,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
        items: cryptoitems.map((cryptoitem) {
          return Builder(
            builder: (BuildContext context) {
              // return Container();
              return Candlesdata(
                height: height * 0.18,
                width: width * 0.65,
                imageurl: cryptoitem.image ?? '',
                name: cryptoitem.name ?? 'No Name',
                percentage: cryptoitem.priceChangePercentage24h ?? 0.0,
                marketcap: cryptoitem.marketCap?.toString() ?? 'N/A',
                rank: cryptoitem.marketCapRank?.toString() ?? 'N/A',
                ontap: () {
                  Get.toNamed('/Detailspage2', arguments: {
                    'id': cryptoitem.id,
                    'name': cryptoitem.name
                  });
                },
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

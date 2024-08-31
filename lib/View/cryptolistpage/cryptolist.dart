import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/themecontroller/Themecontroller.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/Header.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/Internet_Exception_widget.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/Showdata.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/candles.dart';
import 'package:crypto_tracker_1/Resources/Components/slider/caraouselslider.dart';
import 'package:crypto_tracker_1/Resources/Components/widgets/heading.dart';
import 'package:crypto_tracker_1/View/Detailspage/Detailspage.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/caraouselcontroller/caraouselcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/Cryptolist_controller/cryptolistcontroller.dart';
import '../../Data/Responce/Status.dart';

class Cryptolistscreen extends StatefulWidget {
  const Cryptolistscreen({super.key});

  @override
  State<Cryptolistscreen> createState() => _CryptolistscreenState();
}

class _CryptolistscreenState extends State<Cryptolistscreen> {
  final themecontroller themecontrol = Get.put(themecontroller());
  final scrollcontroller = ScrollController();

  // void onlisten() {
  //   // print('scrollcontroller:${scrollcontroller.offset}');
  //   setState(() {});
  // }

  @override
  void initState() {
    // TODO: implement initState
    // scrollcontroller.addListener(onlisten);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // scrollcontroller.removeListener(onlisten);
    super.dispose();
  }

  @override
  final cryptolistcontroller1 = Get.put(cryptolistcontroller());

  @override
  Widget build(BuildContext context) {
    print(cryptolistcontroller1.Markets.length);

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary, // Primary color from theme
            Theme.of(context)
                .colorScheme
                .secondary, // Secondary color from theme
          ],
          begin: Alignment.topLeft, // Gradient direction
          end: Alignment.bottomRight,
          stops: [0.0, 0.74], // Gradient stops
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Obx(
              () {
                return Container(
                  height: Get.height * 0.13,
                  width: Get.width,
                  child: cryptoHeader(
                    onIconTap: () {
                      themecontrol.toggleTheme();
                    },
                    icon: themecontrol.isDarkmode.value == true
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    iconColor: themecontrol.isDarkmode.value == true
                        ? Colors.white
                        : Colors.black,
                    welcomeText: "Welcome Back",
                    trackerText: "Crypto Tracker",
                  ),
                );
              },
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Heading(
              heading: 'OHLC Charts',
            ),

            Obx(() {
              if (cryptolistcontroller1.rxRequestStatus.value ==
                  Status.COMPLETED) {
                if (cryptolistcontroller1.Markets.isNotEmpty) {
                  return ReusableCarousel(
                    cryptoitems: cryptolistcontroller1.Markets,
                    width: Get.width,
                    autoPlay: true,
                    height: Get.height * 0.26,
                    initialPage: 1,
                    containerheight: Get.height * 0.26,
                    containerwidth: Get.width,
                  );
                } else {
                  return Center(child: Text('No items available in carousel'));
                }
              } else if (cryptolistcontroller1.rxRequestStatus.value ==
                  Status.LOADING) {
                return Center(
                    child: CircularProgressIndicator(color: Colors.blue));
              } else {
                return Center(child: Text('Error loading data'));
              }
            }),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Heading(
              heading: 'Markets',
            ),
            // height: Get.height,
            Expanded(
              child: Container(
                child: Obx(() {
                  switch (cryptolistcontroller1.rxRequestStatus.value) {
                    case Status.LOADING:
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );

                    case Status.ERROR:
                      if (cryptolistcontroller1.error.value ==
                          'No internet connection') {
                        return Internet_exception_widget(
                          onpress: () {
                            cryptolistcontroller1.fetchdata();
                          },
                        );
                      } else {
                        return Text(
                            cryptolistcontroller1.error.value.toString());
                      }

                    case Status.COMPLETED:

                      // height: ge,

                      return RefreshIndicator(
                        color: Colors.blue,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: cryptolistcontroller1.Markets.length,
                            itemBuilder: (context, index) {
                              Crypto_list_model cryptocurrency =
                                  cryptolistcontroller1.Markets[index];
                              return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed('/Detailspage', arguments: {
                                        'id': cryptocurrency.id!,
                                        'name': cryptocurrency.name!
                                      });
                                    },
                                    child: Showcryptodata(
                                        onpress: () {
                                          cryptolistcontroller1
                                              .addfavorite(cryptocurrency);
                                        },
                                        onTap: () {
                                          cryptolistcontroller1
                                              .removefavorite(cryptocurrency);
                                        },
                                        opacity1: 1.0,
                                        cryptocurrency: cryptocurrency,
                                        imageurl: cryptocurrency.image!,
                                        cryptoname: cryptocurrency.name!,
                                        cryptsymbol: cryptocurrency.symbol!,
                                        price: cryptocurrency.currentPrice!,
                                        height: Get.height * 0.15,
                                        width: Get.width * 0.9,
                                        pricechange:
                                            cryptocurrency.priceChange24h!,
                                        prices:
                                            cryptocurrency.sparklineIn7d?.price,
                                        pricechangeprecentage: cryptocurrency
                                            .priceChangePercentage24h!),
                                  ));
                            }),
                        onRefresh: () async {
                          await cryptolistcontroller1.fetchdata();
                        },
                      );
                  }
                }),
              ),
            ),
          ]),
    ));
  }
}

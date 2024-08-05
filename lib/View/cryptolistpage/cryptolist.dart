import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';
import 'package:crypto_tracker_1/Resources/Apptheme/Themecontroller.dart';
import 'package:crypto_tracker_1/Resources/Components/Header.dart';
import 'package:crypto_tracker_1/Resources/Components/Internet_Exception_widget.dart';
import 'package:crypto_tracker_1/Resources/Components/Showdata.dart';
import 'package:crypto_tracker_1/View/Detailspage/Detailspage.dart';
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
  final cryptolistcontroller1 = Get.put(cryptolistcontroller());

  final themecontroller themecontrol = Get.put(themecontroller());
  @override
  Widget build(BuildContext context) {
    //   print(cryptolistcontroller1.Markets.length);
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Obx(
            () {
              return cryptoHeader(
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
              );
            },
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
                      return Text(cryptolistcontroller1.error.value.toString());
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
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed('/Detailspage',
                                        arguments: {'id': cryptocurrency.id!,
                                        'name':cryptocurrency.name!});
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
                                      cryptocurrency: cryptocurrency,
                                      imageurl: cryptocurrency.image!,
                                      cryptoname: cryptocurrency.name!,
                                      cryptsymbol: cryptocurrency.symbol!,
                                      price: cryptocurrency.currentPrice!,
                                      height: Get.height * 0.1,
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
        ]));
  }
}

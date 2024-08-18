import 'package:crypto_tracker_1/Resources/Components/charts/OHLCchart.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/chartscontroller/chartscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Resources/Components/widgets/detailsrow.dart';
import '../../Viewmodel/Controllers/Cryptolist_controller/cryptolistcontroller.dart';

class Detailspage2 extends StatefulWidget {
  const Detailspage2({super.key});

  @override
  State<Detailspage2> createState() => _Detailspage2State();
}

class _Detailspage2State extends State<Detailspage2> {
  final cryptobyid = Get.put(cryptolistcontroller());
  final cryptochart = Get.put(Chartscontroller());

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>?;
    if (args == null) {
      throw Exception('Arguments are null');
    } else {
      final id = args['id'];
      final name = args['name'].toString().toLowerCase();
      if (id != null) {
        cryptobyid.fetch_crypto_by_id(id);
        cryptochart.fetchchartdata(name);
      } else {
        throw Exception('ID is null');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Obx(() {
        final crypto = cryptobyid.cryptoDetails.value;
        final chart = cryptochart.Chartdata;

        if (crypto.id == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Container(
              height: Get.height,
              width: Get.width * 0.9,
              child: ListView(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(crypto.image!),
                    ),
                    title: Text(
                        "${crypto.name!}(${crypto.symbol!.toUpperCase()})",
                        style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Text(
                        "\$ " + crypto.currentPrice!.toStringAsFixed(3),
                        style: Theme.of(context).textTheme.headlineMedium),
                    trailing: (crypto.isfavorite == false)
                        ? InkWell(
                            onTap: () {
                              cryptobyid.addfavorite(crypto);
                            },
                            child: Icon(
                              Icons.favorite_border,
                              color: Theme.of(context).iconTheme.color,
                              size: 30,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              cryptobyid.removefavorite(crypto);
                            },
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                  ),
                  // Added a check to display message if no data is available
                  SizedBox(
                    height: Get.height * 0.5,
                    child: chart.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.blue,
                          ))
                        : OHLCChart(
                            dataSource: chart,
                          ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  ListTile(
                    title: Text("Pricechange(24h)",
                        style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Builder(builder: (context) {
                      double pricechange = crypto.priceChange24h!;
                      double pricechangepercentage =
                          crypto.priceChangePercentage24h!;
                      if (pricechange < 0) {
                        return Text(
                          "${pricechangepercentage.toStringAsFixed(3)}%(${pricechange.toStringAsFixed(2)})",
                          style: Theme.of(context).textTheme.labelSmall,
                        );
                      } else {
                        return Text(
                          "+ ${pricechangepercentage.toStringAsFixed(3)}%(${pricechange.toStringAsFixed(3)})",
                          style: Theme.of(context).textTheme.labelMedium,
                        );
                      }
                    }),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Detailsrow(
                      title: "Market Cap",
                      detail: "\$ " + crypto.marketCap!.toStringAsFixed(4),
                      title2: "Market Cap Rank",
                      detail2: "\# " + crypto.marketCapRank!.toString()),
                  SizedBox(height: Get.height * 0.02),
                  Detailsrow(
                      title: "Low 24h",
                      detail: "\$ " + crypto.low24h!.toStringAsFixed(4),
                      title2: "High 24h ",
                      detail2: "\$ " + crypto.high24h!.toStringAsFixed(4)),
                  SizedBox(height: Get.height * 0.02),
                  Detailsrow(
                      title: "All Time Low",
                      detail: "\$ " + crypto.atl!.toStringAsFixed(4),
                      title2: " All Time High ",
                      detail2: "\$ " + crypto.ath!.toStringAsFixed(4)),
                  SizedBox(height: Get.height * 0.02),
                  Detailsrow(
                      title: "Total volume ",
                      detail: "\$ " + crypto.totalVolume!.toStringAsFixed(4),
                      title2: "Max supply",
                      detail2: "\$ " + crypto.maxSupply.toString())
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}

import 'package:crypto_tracker_1/Model/Home/Cryptolistmodel.dart';
import 'package:crypto_tracker_1/Model/cryptochart/OHLCchartmodel.dart';
import 'package:crypto_tracker_1/Resources/Components/OHLCchart.dart';
import 'package:crypto_tracker_1/Resources/Components/detailsrow.dart';
import 'package:crypto_tracker_1/Resources/Components/sparklinechart.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/Cryptolist_controller/cryptolistcontroller.dart';
import 'package:crypto_tracker_1/Viewmodel/Controllers/chartscontroller/chartscontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({
    super.key,
  });
  //final String id;

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  final cryptobyid = Get.put(cryptolistcontroller());
  //lazyPut
  final cryptochart = Get.put(Chartscontroller());

  @override
  void initState() {
    super.initState();
    // print('Detailspage initState called');
    final args = Get.arguments as Map<String, dynamic>?;
    if (args == null) {
      //print('Arguments are null');
      throw Exception('Arguments are null');
    } else {
      final id = args['id'];
      final name = args['name'].toString().toLowerCase();
      if (id != null) {
        cryptobyid.fetch_crypto_by_id(id);
        cryptochart.fetchchartdata(name);
        print(name);
      } else {
        //debugprint('ID is null');
        throw Exception('ID is null');
      }
    }
  }

  late final List<double>? prices;

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
          List chart = cryptochart.Chartdata;
          print(chart);

          if (crypto.id == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Container(
                height: Get.height,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    // Sparklinechart(
                    //   height: Get.height * 0.3,
                    //   width: Get.width,
                    //   prices: crypto.sparklineIn7d?.price,
                    //   linecolornegative: Color.fromARGB(255, 212, 17, 3),
                    //   linecolorpositive: Color.fromARGB(255, 3, 122, 9),
                    //   negativeColors: [
                    //     Color.fromARGB(173, 225, 37, 24),
                    //     Color.fromARGB(255, 247, 169, 164)
                    //   ],
                    //   positiveColors: [
                    //     Color.fromARGB(183, 59, 156, 62),
                    //     Color.fromARGB(255, 174, 234, 177),
                    //   ],
                    // ),
                    OHLCChart(dataSource: cryptochart.Chartdata),

                    SizedBox(
                      height: Get.height * 0.02,
                    ),
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
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Detailsrow(
                        title: "Market Cap",
                        detail: "\$ " + crypto.marketCap!.toStringAsFixed(4),
                        title2: "Market Cap Rank",
                        detail2: "\# " + crypto.marketCapRank!.toString()),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Detailsrow(
                        title: "Low 24h",
                        detail: "\$ " + crypto.low24h!.toStringAsFixed(4),
                        title2: "High 24h ",
                        detail2: "\$ " + crypto.high24h!.toStringAsFixed(4)),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Detailsrow(
                        title: "All Time Low",
                        detail: "\$ " + crypto.atl!.toStringAsFixed(4),
                        title2: " All Time High ",
                        detail2: "\$ " + crypto.ath!.toStringAsFixed(4)),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Detailsrow(
                        title: "Total volume ",
                        detail: "\$ " + crypto.totalVolume!.toStringAsFixed(4),
                        title2: "Max supply",
                        detail2: "\$ " + crypto.maxSupply.toString()),
                  ],
                ),
              ),
            );
          }
        }));
  }
}

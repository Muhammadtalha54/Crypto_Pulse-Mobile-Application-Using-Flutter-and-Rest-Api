import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Candlesdata extends StatelessWidget {
  const Candlesdata(
      {super.key,
      required this.height,
      required this.width,
      this.name,
      this.percentage,
      this.rank,
      this.marketcap,
      this.imageurl,
      this.ontap});
  final String? imageurl;
  final double height;
  final double width;
  final String? name;
  final String? rank;
  final String? marketcap;

  final VoidCallback? ontap;

  final double? percentage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        elevation: 3,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // gradient: LinearGradient(
            //   colors: [
            //     Theme.of(context)
            //         .colorSchemeAS
            //         .primaryContainer, // Primary color from theme
            //     Theme.of(context)
            //         .colorScheme
            //         .secondaryContainer, // Secondary color from theme
            //   ],
            //   begin: Alignment.topLeft, // Gradient direction
            //   end: Alignment.bottomRight,
            //   stops: [0.5, 0.9],
            // )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: Get.height * 0.04,
                  width: Get.width * 0.9,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 195, 195, 195),
                      radius: 14,
                      backgroundImage: imageurl != null
                          ? NetworkImage(imageurl!)
                          : null, // Handle null URL
                    ),
                    title: Text(
                      name ?? 'No Name',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: Text(
                      rank != null ? "# $rank" : 'No Rank',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )),
              Container(
                height: Get.height * 0.1,
                width: Get.width * 0.9,
                child: Image.asset(
                  "assets/Icon/candles.gif",
                ),
              ),
              Container(
                  height: Get.height * 0.04,
                  width: Get.width * 0.9,
                  child: ListTile(
                      title: Text(
                        marketcap != null ? "\$ $marketcap" : 'No Market Cap',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      trailing: Builder(builder: (context) {
                        double pricechangepercentage = percentage!;
                        if (percentage != null) {
                          double pricechangepercentage = percentage!;
                          return Text(
                            pricechangepercentage < 0
                                ? "${pricechangepercentage.toStringAsFixed(2)}%"
                                : "+ ${pricechangepercentage.toStringAsFixed(2)}%",
                            style: pricechangepercentage < 0
                                ? Theme.of(context).textTheme.labelSmall
                                : Theme.of(context).textTheme.labelMedium,
                          );
                        } else {
                          return Text(
                            'N/A',
                            style: Theme.of(context).textTheme.labelMedium,
                          );
                        }
                      }))),
            ],
          ),
        ),
      ),
    );
  }
}

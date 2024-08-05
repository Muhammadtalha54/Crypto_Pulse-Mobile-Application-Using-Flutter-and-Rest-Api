import 'package:crypto_tracker_1/Model/cryptochart/OHLCchartmodel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OHLCChart extends StatelessWidget {
  final List<OHLC_chart_model> dataSource;

  OHLCChart({required this.dataSource});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      series: <CandleSeries<OHLC_chart_model, DateTime>>[
        CandleSeries<OHLC_chart_model, DateTime>(
          dataSource: dataSource,
          xValueMapper: (OHLC_chart_model data, _) =>
              DateTime.fromMillisecondsSinceEpoch(data.timestamp),
          lowValueMapper: (OHLC_chart_model data, _) => data.low,
          highValueMapper: (OHLC_chart_model data, _) => data.high,
          openValueMapper: (OHLC_chart_model data, _) => data.open,
          closeValueMapper: (OHLC_chart_model data, _) => data.close,
          //  borderColor: Colors.blue,
          borderWidth: 2,
          // color: Colors.blue,
          bearColor: Colors.red,
          bullColor: Colors.green,
        ),
      ],
    );
  }
}

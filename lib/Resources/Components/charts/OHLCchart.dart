import 'package:crypto_tracker_1/Model/cryptochart/OHLCchartmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OHLCChart extends StatefulWidget {
  final List<OHLC_chart_model> dataSource;
  final double? open;
  final double? high;
  final double? low;
  final double? close;

  OHLCChart({
    required this.dataSource,
    this.open,
    this.high,
    this.low,
    this.close,
  });

  @override
  State<OHLCChart> createState() => _OHLCChartState();
}

class _OHLCChartState extends State<OHLCChart> {
  late TrackballBehavior _trackballbehaviour;
  late double minValue;
  late double maxValue;
  @override
  void initState() {
    // TODO: implement initState
    _trackballbehaviour = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    _calculateMinMaxValues();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OHLCChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Recalculate min and max values if dataSource changes
    if (widget.dataSource != oldWidget.dataSource) {
      _calculateMinMaxValues();
    }
  }

  void _calculateMinMaxValues() {
    if (widget.dataSource.isNotEmpty) {
      double minLow = widget.dataSource
          .map((data) => data.low)
          .reduce((a, b) => a < b ? a : b);
      double maxHigh = widget.dataSource
          .map((data) => data.high)
          .reduce((a, b) => a > b ? a : b);

      // Setting minimum and maximum values based on the data
      minValue = minLow - 500;
      maxValue = maxHigh + 500;
      // print(dataxource)
      print("minValue: $minValue");
      print("maxValue: $maxValue");
    } else {
      minValue = -100;
      maxValue = 10000; // Default values if dataSource is empty
    }
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat('d/M'),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        intervalType: DateTimeIntervalType.days,
        interval: 1,
      ),
      primaryYAxis: NumericAxis(
          minimum: minValue,
          maximum: maxValue,
          interval: (maxValue - minValue) / 10,
          numberFormat: NumberFormat.simpleCurrency(decimalDigits: 1)),
      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
        zoomMode: ZoomMode.x,
        enableSelectionZooming: true,
      ),
      trackballBehavior: _trackballbehaviour,
      series: <CandleSeries<OHLC_chart_model, DateTime>>[
        CandleSeries<OHLC_chart_model, DateTime>(
          dataSource: widget.dataSource,
          xValueMapper: (OHLC_chart_model data, _) =>
              DateTime.fromMillisecondsSinceEpoch(data.timestamp),
          lowValueMapper: (OHLC_chart_model data, _) => data.low,
          highValueMapper: (OHLC_chart_model data, _) => data.high,
          openValueMapper: (OHLC_chart_model data, _) => data.open,
          closeValueMapper: (OHLC_chart_model data, _) => data.close,
          // borderColor: Colors.blue,
          borderWidth: 4,
          bearColor: Colors.red,
          bullColor: Colors.green,
        ),
      ],
    );
  }
}

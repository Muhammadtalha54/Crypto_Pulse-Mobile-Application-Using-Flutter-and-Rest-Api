import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TrackballChart extends StatefulWidget {
  final List<double>? prices;
  final double height;
  final double width;
  final Color? linecolorpositive;
  final Color? linecolornegative;
  final Color? shadowcolorcolor;
  final List<Color>? positiveColors;
  final List<Color>? negativeColors;
  final Color? tooltipTextColor; // Color for tooltip text
  final Color? tooltipBgColor; // Color for tooltip background

  const TrackballChart({
    Key? key,
    this.prices,
    required this.height,
    required this.width,
    this.linecolorpositive,
    this.linecolornegative,
    this.shadowcolorcolor,
    this.positiveColors,
    this.negativeColors,
    this.tooltipTextColor,
    this.tooltipBgColor,
  }) : super(key: key);

  @override
  State<TrackballChart> createState() => _TrackballChartState();
}

class _TrackballChartState extends State<TrackballChart> {
  @override
  Widget build(BuildContext context) {
    bool isPositiveFlow = widget.prices != null &&
        widget.prices!.isNotEmpty &&
        (widget.prices!.last - widget.prices!.first) >= 0;

    // Set colors based on the flow
    Color lineColor =
        isPositiveFlow ? widget.linecolorpositive! : widget.linecolornegative!;
    List<Color> fillColors =
        isPositiveFlow ? widget.positiveColors! : widget.negativeColors!;
    // Default c

    if (widget.prices == null || widget.prices!.isEmpty) {
      return Container(
        height: widget.height,
        width: widget.width,
        child: Center(
          child: Text('No data available'),
        ),
      );
    }

    return Container(
      height: widget.height,
      width: widget.width,
      child: LineChart(LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(widget.prices!.length,
                  (index) => FlSpot(index.toDouble(), widget.prices![index])),
              isCurved: true,
              color: lineColor, // The line color
              dotData: FlDotData(
                show: false,
              ), // Show data points
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: fillColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Color.fromARGB(255, 74, 66, 66),
              getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                return lineBarsSpot.map((spot) {
                  return LineTooltipItem(
                    "\$ " + '${spot.y}',
                    TextStyle(color: Colors.white, fontSize: 15),
                  );
                }).toList();
              },
            ),
            touchSpotThreshold: 8,
            touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
              // Handle touch events if needed
            },
          ),
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(
            show: true,
          ))),
    );
  }
}

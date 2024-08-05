import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Sparklinechart extends StatefulWidget {
  const Sparklinechart(
      {Key? key,
      this.linecolorpositive,
      this.prices,
      this.linecolornegative,
      this.shadowcolorcolor,
      required this.height,
      required this.width,
      this.positiveColors,
      this.negativeColors})
      : super(key: key);
  final Color? linecolorpositive;
  final Color? linecolornegative;
  final Color? shadowcolorcolor;
  final List<Color>? positiveColors;
  final List<Color>? negativeColors;
  final List<double>? prices;
  final double height, width;

  @override
  State<Sparklinechart> createState() => _SparklinechartState();
}

class _SparklinechartState extends State<Sparklinechart> {
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

    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(),
      child: Sparkline(
          data: widget.prices!,
          lineColor: lineColor,
          pointColor: Color.fromARGB(255, 0, 0, 0),
          pointSize: 20.0,
          fillMode: FillMode.below,
          fillGradient: LinearGradient(
              colors: fillColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}

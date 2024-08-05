class OHLC_chart_model {
  final int timestamp;
  final double open;
  final double high;
  final double low;
  final double close;

   OHLC_chart_model({
    required this.timestamp,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  factory  OHLC_chart_model.fromList(List<dynamic> data) {
    return  OHLC_chart_model(
      timestamp: data[0] as int,
      open: data[1] as double,
      high: data[2] as double,
      low: data[3] as double,
      close: data[4] as double,
    );
  }

  @override
  String toString() {
    return ' OHLC_chart_model(timestamp: $timestamp, open: $open, high: $high, low: $low, close: $close)';
  }
}

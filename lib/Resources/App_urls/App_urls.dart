import 'dart:convert';

class Appurls {
// base url is set so thst it will be easy to use instead of using each time
  static const String coinbaseurl = 'https://api.coingecko.com';
  static const String Coinslistusd =
      '$coinbaseurl/api/v3/coins/markets?vs_currency=usd&per_page=20&sparkline=true&price_change_percentage=7d';

  static const String Coinslistpkr =
      '$coinbaseurl/api/v3/coins/markets?vs_currency=pkr&per_page=200&precision=4';

  ///name of coin
  static String coinid = '';

  static String Coinschartdata =
      '$coinbaseurl/api/v3/coins/$coinid/market_chart?vs_currency=usd&days=14';

  static String Ohlcchart =
      '$coinbaseurl/api/v3/coins/$coinid/ohlc?vs_currency=usd&days=14&precision=4';
}

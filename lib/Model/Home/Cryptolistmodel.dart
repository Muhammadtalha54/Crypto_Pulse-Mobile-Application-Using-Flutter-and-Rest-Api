import 'package:get/get.dart';

class Crypto_list_model {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  int? marketCapRank;

  double? totalVolume;
  double? high24h;
  double? low24h;
  double? priceChange24h;
  double? priceChangePercentage24h;
  double? marketCapChange24h;
  double? marketCapChangePercentage24h;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  double? ath;
  double? athChangePercentage;
  String? athDate;
  double? atl;
  double? atlChangePercentage;
  String? atlDate;

  String? lastUpdated;
  SparklineIn7d? sparklineIn7d;
  double? priceChangePercentage7dInCurrency;
  RxBool isfavorite = false.obs;

  Crypto_list_model(
      {this.id,
      this.symbol,
      this.name,
      this.image,
      this.currentPrice,
      this.marketCap,
      this.marketCapRank,
      this.totalVolume,
      this.high24h,
      this.low24h,
      this.priceChange24h,
      this.priceChangePercentage24h,
      this.marketCapChange24h,
      this.marketCapChangePercentage24h,
      this.circulatingSupply,
      this.totalSupply,
      this.maxSupply,
      this.ath,
      this.athChangePercentage,
      this.athDate,
      this.atl,
      this.atlChangePercentage,
      this.atlDate,
      this.lastUpdated,
      this.sparklineIn7d,
      this.priceChangePercentage7dInCurrency});

  Crypto_list_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = _parseDouble(json['current_price']);
    marketCap = _parseDouble(json['market_cap']);
    marketCapRank = json['market_cap_rank'];
    totalVolume = _parseDouble(json['total_volume']);
    high24h = _parseDouble(json['high_24h']);
    low24h = _parseDouble(json['low_24h']);
    priceChange24h = _parseDouble(json['price_change_24h']);
    priceChangePercentage24h =
        _parseDouble(json['price_change_percentage_24h']);
    marketCapChange24h = _parseDouble(json['market_cap_change_24h']);
    marketCapChangePercentage24h =
        _parseDouble(json['market_cap_change_percentage_24h']);
    totalSupply = _parseDouble(json['total_supply']);
    maxSupply = _parseDouble(json['max_supply']);
    ath = _parseDouble(json['ath']);
    athChangePercentage = _parseDouble(json['ath_change_percentage']);
    athDate = json['ath_date'];
    atl = _parseDouble(json['atl']);
    atlChangePercentage = _parseDouble(json['atl_change_percentage']);
    atlDate = json['atl_date'];

    lastUpdated = json['last_updated'];
    sparklineIn7d = json['sparkline_in_7d'] != null
        ? new SparklineIn7d.fromJson(json['sparkline_in_7d'])
        : null;
    priceChangePercentage7dInCurrency =
        json['price_change_percentage_7d_in_currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['image'] = this.image;
    data['current_price'] = this.currentPrice;
    data['market_cap'] = this.marketCap;
    data['market_cap_rank'] = this.marketCapRank;

    data['total_volume'] = this.totalVolume;
    data['high_24h'] = this.high24h;
    data['low_24h'] = this.low24h;
    data['price_change_24h'] = this.priceChange24h;
    data['price_change_percentage_24h'] = this.priceChangePercentage24h;
    data['market_cap_change_24h'] = this.marketCapChange24h;
    data['market_cap_change_percentage_24h'] =
        this.marketCapChangePercentage24h;
    data['circulating_supply'] = this.circulatingSupply;
    data['total_supply'] = this.totalSupply;
    data['max_supply'] = this.maxSupply;
    data['ath'] = this.ath;
    data['ath_change_percentage'] = this.athChangePercentage;
    data['ath_date'] = this.athDate;
    data['atl'] = this.atl;
    data['atl_change_percentage'] = this.atlChangePercentage;
    data['atl_date'] = this.atlDate;

    data['last_updated'] = this.lastUpdated;
    if (this.sparklineIn7d != null) {
      data['sparkline_in_7d'] = this.sparklineIn7d!.toJson();
    }
    data['price_change_percentage_7d_in_currency'] =
        this.priceChangePercentage7dInCurrency;
    return data;
  }

  double? _parseDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value);
    } else if (value is num) {
      return value.toDouble();
    } else {
      return null;
    }
  }
}

class SparklineIn7d {
  List<double>? price;

  SparklineIn7d({this.price});

  SparklineIn7d.fromJson(Map<String, dynamic> json) {
    price = json['price'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    return data;
  }
}

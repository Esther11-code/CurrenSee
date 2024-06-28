class CountryInfoModel {
  String? code;
  double? exchangeRate;
  String? name;
  String? symbol;
  bool? displaySymbolOnRight;

  CountryInfoModel(
      {this.code,
      this.exchangeRate,
      this.name,
      this.symbol,
      this.displaySymbolOnRight});

  CountryInfoModel.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    exchangeRate = json['ExchangeRate'];
    name = json['Name'];
    symbol = json['Symbol'];
    displaySymbolOnRight = json['DisplaySymbolOnRight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Code'] = code;
    data['ExchangeRate'] = exchangeRate;
    data['Name'] = name;
    data['Symbol'] = symbol;
    data['DisplaySymbolOnRight'] = displaySymbolOnRight;
    return data;
  }
}

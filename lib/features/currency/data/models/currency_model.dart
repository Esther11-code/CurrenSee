class Country {
  String? flag;
  String? countryName;
  String? currency;
  String? code;
  String? symbol;
  String? symbolImage;

  Country(
      {this.flag,
      this.countryName,
      this.currency,
      this.code,
      this.symbol,
      this.symbolImage});

  Country.fromJson(Map<String, dynamic> json) {
    flag = json['Flag'];
    countryName = json['CountryName'];
    currency = json['Currency'];
    code = json['Code'];
    symbol = json['Symbol'];
    symbolImage = json['SymbolImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Flag'] = flag;
    data['CountryName'] = countryName;
    data['Currency'] = currency;
    data['Code'] = code;
    data['Symbol'] = symbol;
    data['SymbolImage'] = symbolImage;
    return data;
  }
}
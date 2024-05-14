class ExchangeRate {
  String country;
  String currency;
  int sellingPrice;
  int buyingPrice;

  ExchangeRate(
      {required this.buyingPrice,
      required this.country,
      required this.currency,
      required this.sellingPrice});

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => ExchangeRate(
        country: json["Country"],
        currency: json["Currency"],
        buyingPrice: json["BuyingPrice"],
        sellingPrice: json["SellingPrice"],
      );

  Map<String, dynamic> toJson() => {
        "Country": country,
        "Currency": currency,
        "BuyingPrice": buyingPrice,
        "SellingPrice": sellingPrice,
      };
}

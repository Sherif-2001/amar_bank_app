import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String type;
  final String nameOfProduct;
  final String amountOfMoney;
  final Timestamp time;

  Product(
      {required this.type,
      required this.amountOfMoney,
      required this.nameOfProduct,
      required this.time});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      type: json["Type"],
      amountOfMoney: json["AmountOfMoney"],
      nameOfProduct: json["NameOfProduct"],
      time: json["Time"]);

  Map<String, dynamic> toJson() => {
        "Type": type,
        "AmountOfMoney": amountOfMoney,
        "NameOfProduct": nameOfProduct,
        "Time": time
      };
}

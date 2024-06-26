import 'package:amar_bank_app/models/product.dart';
import 'package:amar_bank_app/models/transfer.dart';

class UserData {
  final String nationalId;
  final String cardNum;
  final String cardPin;
  final String expiryDate;
  final String email;
  final String username;
  final String password;
  final String address;
  final int balance;
  List<Transfer> transfers;
  List<Product> products;

  UserData(
      {required this.address,
      required this.balance,
      required this.cardNum,
      required this.cardPin,
      required this.email,
      required this.expiryDate,
      required this.nationalId,
      required this.password,
      required this.username,
      this.transfers = const [],
      this.products = const []});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        address: json["Address"],
        balance: json["Balance"],
        cardNum: json["CardNumber"],
        cardPin: json["CardPin"],
        email: json["Email"],
        expiryDate: json["ExpiryDate"],
        nationalId: json["NationalId"],
        password: json["Password"],
        username: json["Username"],
        transfers: (json['Transfers'] as List<dynamic> ?? [])
            .map((item) => Transfer.fromJson(item))
            .toList(),
        products: (json['Products'] as List<dynamic> ?? [])
            .map((item) => Product.fromJson(item))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "NationalId": nationalId,
        "CardNumber": cardNum,
        "CardPin": cardPin,
        "ExpiryDate": expiryDate,
        "Email": email,
        "Username": username,
        "Address": address,
        "Password": password,
        "Balance": balance,
        "Transfers": transfers.map((item) => item.toJson()).toList(),
        "Products": products.map((item) => item.toJson()).toList()
      };
}

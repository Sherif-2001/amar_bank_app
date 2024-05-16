import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final String senderCardNumber;
  final String receiverCardNumber;
  final int amountOfMoney;
  final Timestamp time;

  Transaction(
      {required this.amountOfMoney,
      required this.receiverCardNumber,
      required this.senderCardNumber,
      required this.time});

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
      senderCardNumber: json["SenderCardNumber"],
      receiverCardNumber: json["ReceiverCardNumber"],
      amountOfMoney: json["AmountOfMoney"],
      time: json["Time"]);

  Map<String, dynamic> toJson() => {
        "SenderCardNumber": senderCardNumber,
        "ReceiverCardNumber": receiverCardNumber,
        "AmountOfMoney": amountOfMoney,
        "Time": time
      };
}

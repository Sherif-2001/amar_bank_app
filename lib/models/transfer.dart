import 'package:cloud_firestore/cloud_firestore.dart';

class Transfer {
  final String senderCardNumber;
  final String receiverCardNumber;
  final int amountOfMoney;
  final Timestamp time;

  Transfer(
      {required this.amountOfMoney,
      required this.receiverCardNumber,
      required this.senderCardNumber,
      required this.time});

  factory Transfer.fromJson(Map<String, dynamic> json) => Transfer(
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

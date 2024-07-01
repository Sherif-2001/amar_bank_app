import 'dart:math';

import 'package:amar_bank_app/models/user_data.dart';
import 'package:amar_bank_app/services/database_helper.dart';
import 'package:amar_bank_app/widgets/const_and_value_template.dart';
import 'package:flutter/material.dart';

class BillPage extends StatefulWidget {
  const BillPage({this.subscriptionId = "00000", super.key});

  final String subscriptionId;
  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final temp = Random().nextInt(400) + 100;

  UserData _userData = UserData(
      address: "",
      balance: 0,
      cardNum: "",
      cardPin: "",
      email: "",
      expiryDate: "",
      nationalId: "",
      password: "",
      username: "");

  void payBill() async {
    await DatabaseHelper().payBill(temp);
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    await DatabaseHelper()
        .getCurrentUserData()
        .then((value) => _userData = value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Bill',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.yellow[100],
        width: screenwidth,
        height: screenheight,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ConstAndValueTemplate(
                // remove const and replace with actual values
                'CONSUMER NAME',
                _userData.username),
            ConstAndValueTemplate('AREA', _userData.address),
            ConstAndValueTemplate('SUBSCRIPTION ID', widget.subscriptionId),
            ConstAndValueTemplate('BILL VALUE', temp.toString()),
            InkWell(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                //const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 8.0,
                          spreadRadius: 2.0)
                    ],
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                height: 60,
                child: const Center(
                    child: Text("Pay",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold))),
              ),
              onTap: () {
                if (_userData.balance < temp) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.yellow[100],
                        title: const Center(child: Text("Not Enough Balance")),
                        content: MaterialButton(
                          color: Colors.black,
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  payBill();
                  setState(
                    () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.yellow[100],
                            title: const Center(
                                child: Text(
                                    "Are you sure that you want to pay this bill?")),
                            content: MaterialButton(
                              color: Colors.black,
                              onPressed: () async {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'yes',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

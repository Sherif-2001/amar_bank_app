import 'package:amar_bank_app/models/user_data.dart';
import 'package:amar_bank_app/services/auth.dart';
import 'package:amar_bank_app/services/database_helper.dart';
import 'package:amar_bank_app/widgets/service_card.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  UserData data = UserData(
      address: "",
      balance: 0,
      cardNum: "",
      cardPin: "",
      email: "",
      expiryDate: "",
      nationalId: "",
      password: "",
      username: "");
  void getCurrentUserData() async {
    data = await DatabaseHelper().getCurrentUserData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed('/chat_bot');
              });
            },
            child: SizedBox(
              width: 40,
              height: 40,
              child: Image.asset("Images/ChatBot.png"),
            )),
        drawer: Drawer(
          backgroundColor: Colors.yellow[100],
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
                accountName: Text(data.username
                    //'User Name: $username'
                    ),
                accountEmail: Text(data.email),
                decoration: const BoxDecoration(color: Colors.black),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    InkWell(
                      child: const Row(
                        children: [
                          Text(
                            'Log out\t\t',
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.logout_outlined,
                            size: 30,
                          )
                        ],
                      ),
                      onTap: () async {
                        await Auth().signOut().then((value) =>
                            Navigator.of(context)
                                .pushReplacementNamed('/start'));
                      },
                    ),
                    const Divider(
                      thickness: 5,
                    ),
                    InkWell(
                      child: const Row(
                        children: [
                          Text(
                            'My transactions\t\t',
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.transfer_within_a_station_sharp,
                            size: 30,
                          )
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          //اكشن زرار الtransactions
                          Navigator.pushNamed(context, '/transactions');
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'HOME',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.yellow[100],
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: ListView(
            children: [
              Container(
                width: screenwidth / 1.2,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 8.0,
                          spreadRadius: 2.0)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenwidth / 2.2,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                        child: Text(
                          "Balance",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: screenwidth / 2.2,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          data.balance.toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: screenwidth / 1.2,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 8.0,
                          spreadRadius: 2.0)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenwidth / 2.2,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                        child: Text(
                          "Card Expiry Date",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: screenwidth / 2.2,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          data.expiryDate,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child:
                        const ServiceCard('Images/electricity.png', 'Elec pay'),
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushReplacementNamed('/elec_pay');
                      });
                    },
                  ),
                  InkWell(
                    child: const ServiceCard('Images/gas.png', 'Gas pay'),
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushReplacementNamed('/gas_pay');
                      });
                    },
                  ),
                  InkWell(
                    child: const ServiceCard('Images/water.png', 'Water pay'),
                    onTap: () {
                      setState(() {
                        Navigator.of(context)
                            .pushReplacementNamed('/water_pay');
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const ServiceCard('Images/atm.png', 'Branch/ATM'),
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushNamed('/atm_or_branch');
                      });
                    },
                  ),
                  InkWell(
                    child:
                        const ServiceCard('Images/money.png', 'Exchange Rate'),
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushNamed("/currency_rate");
                      });
                    },
                  ),
                  InkWell(
                    child: const ServiceCard('Images/FAQs.png', 'FAQs'),
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushNamed('/faqs');
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const ServiceCard('Images/product.png', 'Products'),
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushNamed('/aftr-log-prod');
                      });
                    },
                  ),
                  InkWell(
                    child:
                        const ServiceCard('Images/loan.png', 'Loan Calculator'),
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushNamed('/loan_calc');
                      });
                    },
                  ),
                  InkWell(
                    child: const ServiceCard('Images/transfer.png', 'Transfer'),
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushReplacementNamed('/transfer');
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

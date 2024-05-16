import 'package:amar_bank_app/widgets/acc_card.dart';
import 'package:amar_bank_app/widgets/cert_card.dart';
import 'package:amar_bank_app/widgets/time_deposit_card.dart';
import 'package:flutter/material.dart';

class AfterLogProducts extends StatefulWidget {
  const AfterLogProducts({super.key});

  @override
  State<AfterLogProducts> createState() => _AfterLogProductsState();
}

class _AfterLogProductsState extends State<AfterLogProducts> {
  int selectedindex = 0;
  List<Widget> wedPages = [
    //accounts  page
    ListView(
      children: [
        Column(children: [
          SizedBox(
            width: 200,
            height: 300,
            child: Column(
              children: [
                Image.asset("Images/account.png"),
                const Text(
                  "Accounts",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
              child: const Text(
                "Accounts which you can use to withdraw and deposit your money",
                style: TextStyle(color: Colors.grey, fontSize: 17),
              )),
          const AccCard("Saving account", 3000, 8.34, 10.44,
              "Monthly,Quarterly,Annually", "Not available"),
          const AccCard("Current Account", 5000, 8.34, 10.44,
              "Monthly,Quarterly,Annually", "Not available"),
          const AccCard("Current with daily interest", 50000, 8.34, 10.44,
              "Monthly,Quarterly,Annually", "available"),
          const AccCard("Saving account", 100000, 8.34, 10.44,
              "Monthly,Quarterly,Annually", "available"),
        ])
      ],
    ),
    //certificate page
    ListView(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 200,
              height: 300,
              child: Column(
                children: [
                  Image.asset("Images/certificate.png"),
                  const Text(
                    "Certificate",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  const Text(
                    "Deposit",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
            child: const Text(
              "Along-term investment with the highest return to suityour needs in terms of duration and value",
              style: TextStyle(color: Colors.grey, fontSize: 17),
            )),
        const CertCard("Suez channel", 1000, 10, "Monthly", "3 Year",
            "at the end of tenor"),
        const CertCard("Ibn-Mis", 50000, 19.55, "qarterly", "3 Year",
            "at the end of tenor"),
        const CertCard("Amar-For-All", 12000, 15.23, "Monthly", "3 Year",
            "at the end of tenor"),
      ],
    ),
    //tme deposit page
    ListView(children: [
      Column(
        children: [
          SizedBox(
              width: 200,
              height: 300,
              child: Column(children: [
                Image.asset("Images/time.png"),
                const Text(
                  "Time",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                const Text(
                  "Deposit",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ]))
        ],
      ),
      Container(
          margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
          child: const Text(
            "Invest your money at cometitve inerest rates and flexible by choosing any time deposit stating from 7 days",
            style: TextStyle(color: Colors.grey, fontSize: 17),
          )),
      const TimeDepositCard(
          "Time Deposit", 1000, 5.999, 8.324, "7 Days", "---", 1000000),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "What Do You Want To Apply",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: wedPages.elementAt(selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedindex,
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: "Accounts", icon: Icon(Icons.account_balance)),
          BottomNavigationBarItem(
              label: "Certificate", icon: Icon(Icons.inventory_2_outlined)),
          BottomNavigationBarItem(
              label: "Time Deposit", icon: Icon(Icons.more_time_outlined)),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////

class ApplyButton extends StatefulWidget {
  const ApplyButton({super.key});

  @override
  State<ApplyButton> createState() => _ApplyButtonState();
}

class _ApplyButtonState extends State<ApplyButton> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 2.0)
          ],
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      height: screenheight / 20,
      width: 70,
      child: const Center(
        child: Text(
          'Apply',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
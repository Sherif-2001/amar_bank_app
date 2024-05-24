import 'package:amar_bank_app/services/auth.dart';
import 'package:amar_bank_app/widgets/acc_card.dart';
import 'package:amar_bank_app/widgets/button_login_to_apply.dart';
import 'package:amar_bank_app/widgets/cert_card.dart';
import 'package:amar_bank_app/widgets/time_deposit_card.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int selectedIndex = 0;
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
              "Monthly,Quarterly,Annually", "Available"),
          const AccCard("Saving account", 100000, 8.34, 10.44,
              "Monthly,Quarterly,Annually", "Available"),
          (Auth().currentUser == null
              ? const ButtonLoginToApply()
              : Container()) //الزراراللي بينقل علي صفحةال start
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
        (Auth().currentUser == null
            ? const ButtonLoginToApply()
            : Container()) //الزراراللي بينقل علي صفحةال start
      ],
    ),
    //tme deposit page
    ListView(children: [
      Column(
        children: [
          SizedBox(
            width: 200,
            height: 300,
            child: Column(
              children: [
                Image.asset("Images/time.png"),
                const Text(
                  "Time",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                const Text(
                  "Deposit",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
            ),
          )
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
      (Auth().currentUser == null
          ? const ButtonLoginToApply()
          : Container()) //الزراراللي بينقل علي صفحةال start
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushReplacementNamed(context, "/user_home_page");
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[100],
          centerTitle: true,
          title: const Text(
            "What Do You Want To Apply",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        body: wedPages.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow[100],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
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
      ),
    );
  }
}

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
          AccCard("Saving account", 3000, 8.34, 10.44,
              "Monthly,Quarterly,Annually", "Not available"),
          AccCard("Current Account", 5000, 8.34, 10.44,
              "Monthly,Quarterly,Annually", "Not available"),
          AccCard("Current with daily interest", 50000, 8.34, 10.44,
              "Monthly,Quarterly,Annually", "available"),
          AccCard("Saving account", 100000, 8.34, 10.44,
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
        CertCard("Suez channel", 1000, 10, "Monthly", "3 Year",
            "at the end of tenor"),
        CertCard("Ibn-Mis", 50000, 19.55, "qarterly", "3 Year",
            "at the end of tenor"),
        CertCard("Amar-For-All", 12000, 15.23, "Monthly", "3 Year",
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
      TimeDeCard("Time Deposit", 1000, 5.999, 8.324, "7 Days", "---", 1000000),
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
class TimeDeCard extends StatefulWidget {
  late String t; //title
  late int minAm; //minimum ammount
  late double r1, r2; // rate
  late String minPer; //minimum period
  late String maxPer; // maximumperiod
  late int maxAm; // maximum amount

  TimeDeCard(this.t, this.minAm, this.r1, this.r2, this.minPer, this.maxPer,
      this.maxAm,
      {super.key});

  @override
  State<TimeDeCard> createState() => _TimeDeCardState();
}

class _TimeDeCardState extends State<TimeDeCard> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 8.0, spreadRadius: 2.0)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: screenwidth,
      height: screenheight / 2.6,
      child: Card(
          color: Colors.yellow[100],
          child: Container(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Column(
                children: [
                  SizedBox(
                      height: screenheight / 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(widget.t,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 30)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Minimum Amount: EGP ${widget.minAm}',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                            ],
                          )
                        ],
                      )),
                  const Divider(
                    thickness: 6,
                    endIndent: 10,
                  ),
                  SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("INTEREST RATE"),
                              Text("MINIMUM PERIOD"),
                              Text("MAXIMUM PERIOD"),
                              Text("MAXIMUM AMOUNT")
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('${widget.r1} % - ',
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 15)),
                                  Text('${widget.r2} %',
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 15)),
                                  //${widget.r2}%
                                ],
                              ),
                              Text(widget.minPer,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 15)),
                              Text(widget.maxPer,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 15)),
                              Text('EGP ${widget.maxAm}',
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 15))
                            ],
                          )
                        ],
                      )),
                  InkWell(
                    child: const ApplyButton(),
                    onTap: () {
                      setState(() {
                        //اكشن زرار التقديم علي time deposit
                      });
                    },
                  )
                ],
              ))),
    );
  }
}

//////////////////////////////////////
class CertCard extends StatefulWidget {
  late String t; //title
  late int min; //minimum
  late double r; // rate
  late String y; // type
  late String te; // tenor
  late String ren; // renew
  CertCard(this.t, this.min, this.r, this.y, this.te, this.ren, {super.key});

  @override
  State<CertCard> createState() => _CertCardState();
}

class _CertCardState extends State<CertCard> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 8.0, spreadRadius: 2.0)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: screenwidth,
      height: screenheight / 2.6,
      child: Card(
          color: Colors.yellow[100],
          child: Container(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Column(
                children: [
                  SizedBox(
                      height: screenheight / 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(widget.t,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 30)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Minimum Amount: EGP ${widget.min}',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                            ],
                          )
                        ],
                      )),
                  const Divider(
                    thickness: 6,
                    endIndent: 10,
                  ),
                  SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("INTEREST RATE"),
                              Text("INTEREST TYPE"),
                              Text("CERTIFICATE TENOR"),
                              Text("RENEW")
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${widget.r} %',
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 15)),
                              Text(widget.y,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 15)),
                              Text(widget.te,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 15)),
                              Text(widget.ren,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 15))
                            ],
                          )
                        ],
                      )),
                  InkWell(
                    child: const ApplyButton(),
                    onTap: () {
                      setState(() {
                        //اكشن زرار التقديم علي certificate
                      });
                    },
                  )
                ],
              ))),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
class AccCard extends StatefulWidget {
  late String t; //title
  late int min; //minimum
  late double r1;
  late double r2; // rate
  late String y; // type
  late String i; //دفتر الشيكات

  AccCard(this.t, this.min, this.r1, this.r2, this.y, this.i, {super.key});

  @override
  State<AccCard> createState() => _AccCardState();
}

class _AccCardState extends State<AccCard> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 8.0, spreadRadius: 2.0)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: screenwidth,
      height: screenheight / 2.6,
      child: Card(
          color: Colors.yellow[100],
          child: Container(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Column(
                children: [
                  SizedBox(
                      height: screenheight / 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(widget.t,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 30)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Minimum Amount: EGP ${widget.min}',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                            ],
                          )
                        ],
                      )),
                  const Divider(
                    thickness: 6,
                    endIndent: 10,
                  ),
                  SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("INTEREST RATE"),
                              Text("INTEREST TYPE"),
                              Text("CHEQUE BOOK")
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('${widget.r1} % - ',
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 15)),
                                  Text('${widget.r2} %',
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 15)),
                                  //${widget.r2}%
                                ],
                              ),
                              Text(widget.y,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 15)),
                              Text(widget.i,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 15))
                            ],
                          )
                        ],
                      )),
                  InkWell(
                    child: const ApplyButton(),
                    onTap: () {
                      setState(() {
                        //اكشن زرار التقديم علي account
                      });
                    },
                  )
                ],
              ))),
    );
  }
}

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

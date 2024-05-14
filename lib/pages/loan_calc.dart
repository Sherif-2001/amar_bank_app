import 'package:flutter/material.dart';

class LoanCalc extends StatefulWidget {
  const LoanCalc({super.key});
  @override
  State<LoanCalc> createState() => _LoanCalcState();
}

class _LoanCalcState extends State<LoanCalc> {
  int loanAmount = 5000;
  int loanPeriod = 6;
  double interestRate = 21.0;
  late int monthlyPayment, totalInterest, totalPayment;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        width: screenwidth,
        height: screenheight,
        color: Colors.yellow[100],
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text('LOAN CALCULATOR',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 8.0, spreadRadius: 2.0)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              width: screenwidth / 1.2,
              height: screenheight / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(40),
                        width: screenwidth / 1.19,
                        height: screenheight / 5.5,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8.0,
                                  spreadRadius: 2.0)
                            ],
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'YOUR MONTHLY PAYMENT',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${((loanAmount * interestRate / 100) + loanAmount) ~/ loanPeriod}',
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: screenwidth / 2.4,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8.0,
                                  spreadRadius: 2.0)
                            ],
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          children: [
                            const Text('TOTAL INTEREST',
                                style: TextStyle(color: Colors.white)),
                            Text('${loanAmount * interestRate ~/ 100}',
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: screenwidth / 2.4,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8.0,
                                  spreadRadius: 2.0)
                            ],
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          children: [
                            const Text('TOTAL PAYBLE',
                                style: TextStyle(color: Colors.white)),
                            Text(
                              ' ${((loanAmount * interestRate / 100) + loanAmount).toInt()} ',
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('loan amount start from 5000',
                          style: TextStyle(fontSize: 15)),
                      Container(
                          padding: const EdgeInsets.all(3),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 8.0,
                                    spreadRadius: 2.0)
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Text("$loanAmount",
                              style: const TextStyle(fontSize: 30)))
                    ],
                  ),
                  Slider(
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      min: 5000,
                      max: 1500000,
                      divisions: 1495,
                      value: loanAmount.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          loanAmount = value.toInt();
                        });
                      })
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('loan period start from 6 month',
                          style: TextStyle(fontSize: 15)),
                      Container(
                          padding: const EdgeInsets.all(3),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 8.0,
                                    spreadRadius: 2.0)
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Text("$loanPeriod",
                              style: const TextStyle(fontSize: 30)))
                    ],
                  ),
                  Slider(
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      min: 6,
                      max: 120,
                      divisions: 114,
                      value: loanPeriod.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          loanPeriod = value.toInt();
                        });
                      })
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('interest rate start from 21.0 %',
                          style: TextStyle(fontSize: 15)),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.all(3),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 8.0,
                                    spreadRadius: 2.0)
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Text("$interestRate %",
                              style: const TextStyle(fontSize: 30)))
                    ],
                  ),
                  Slider(
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      min: 21.0,
                      max: 25.5,
                      divisions: 6,
                      value: interestRate,
                      onChanged: (value) {
                        setState(() {
                          interestRate = value;
                        });
                      })
                ],
              ),
            ),
            const Text(
                'The loan calculators are intended to be an estimate guide only,The results should not be considered as a final approval for aloan.To fiend the exact amounts and interest rates,please visit us',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

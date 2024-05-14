import 'package:amar_bank_app/models/exchange_rate.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({required this.rate, super.key});

  final ExchangeRate rate;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 10.0, spreadRadius: 6.0)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: screenheight / 7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 70, height: 60, child: Image.asset(
              //1
              "Images/${rate.country}.png")),
          Column(
            children: [
              const SizedBox(height: 20),
              Text(
                  //2
                  rate.country,
                  style: const TextStyle(fontSize: 20)),
              Text(
                //3
                rate.currency,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 8.0,
                          spreadRadius: 2.0)
                    ],
                    borderRadius: BorderRadius.circular(4)),
                width: 50,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Sell',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    //4
                    Text(
                      rate.sellingPrice.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 8.0,
                          spreadRadius: 2.0)
                    ],
                    borderRadius: BorderRadius.circular(4)),
                width: 50,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Buy',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    //5
                    Text(
                      rate.buyingPrice.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

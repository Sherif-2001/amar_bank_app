import 'package:flutter/material.dart';

class Table extends StatelessWidget {
  final int x, y, z, v, d;
  late int demand;

  Table(this.x, this.z, this.y, this.v, this.d, {super.key});
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: screenwidth / 2.3,
                      margin:
                          const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                      child: const Column(
                        children: [
                          Text(
                            'consumption',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: screenwidth / 2.3,
                      margin:
                          const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                      child: const Column(
                        children: [
                          Text(
                            'stamp duty',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: screenwidth / 2.3,
                      margin:
                          const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                      child: const Column(
                        children: [
                          Text(
                            'customer srvice',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: screenwidth / 2.3,
                      margin:
                          const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                      child: const Column(
                        children: [
                          Text(
                            'cleanin fees',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: screenwidth / 2.3,
                      margin:
                          const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                      child: Column(
                        children: [
                          Text(
                            '$x',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: screenwidth / 2.3,
                      margin:
                          const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                      child: Column(
                        children: [
                          Text(
                            '$y',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: screenwidth / 2.3,
                      margin:
                          const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                      child: Column(
                        children: [
                          Text(
                            '$z',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: screenwidth / 2.3,
                      margin:
                          const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                      child: Column(
                        children: [
                          Text(
                            '$v',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'demand : ${demand = x + y + z + v + d}',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

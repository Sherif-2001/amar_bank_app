import 'package:flutter/material.dart';

class AccCard extends StatefulWidget {
  final String t; //title
  final int min; //minimum
  final double r1;
  final double r2; // rate
  final String y; // type
  final String i; //دفتر الشيكات

  const AccCard(this.t, this.min, this.r1, this.r2, this.y, this.i,
      {super.key});

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
      height: screenheight / 3,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
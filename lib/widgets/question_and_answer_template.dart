import 'package:flutter/material.dart';

class QuestionAndAnswerTemplate extends StatelessWidget {
  final String Q, A;
  const QuestionAndAnswerTemplate(this.Q, this.A, {super.key});
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    'Q : $Q',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          Row(
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
                width: screenwidth / 1.1,
                margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Ans : $A',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

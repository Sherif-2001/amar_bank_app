import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'TRANSACTIONS',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransCard('Apply on tahia misr certificate', '14/10/2024'),
            TransCard('Apply on tahia misr certificate', '14/10/2024'),
            TransCard('Apply on tahia misr certificate', '14/10/2024'),
            TransCard('Apply on tahia misr certificate', '14/10/2024'),
            TransCard('Apply on tahia misr certificate', '14/10/2024'),
            TransCard('Apply on tahia misr certificate', '14/10/2024'),
          ],
        ),
      ),
    );
  }
}

class TransCard extends StatelessWidget {
  late String x, y;

  TransCard(this.x, this.y, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 2.0)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(x, style: const TextStyle(fontSize: 15)),
          Text(y,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

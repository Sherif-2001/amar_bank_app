import 'package:amar_bank_app/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
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
            TransactionCard('Apply on tahia misr certificate', '14/10/2024'),
            TransactionCard('Apply on tahia misr certificate', '14/10/2024'),
            TransactionCard('Apply on tahia misr certificate', '14/10/2024'),
            TransactionCard('Apply on tahia misr certificate', '14/10/2024'),
            TransactionCard('Apply on tahia misr certificate', '14/10/2024'),
            TransactionCard('Apply on tahia misr certificate', '14/10/2024'),
          ],
        ),
      ),
    );
  }
}

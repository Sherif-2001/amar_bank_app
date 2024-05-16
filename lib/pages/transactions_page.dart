import 'package:amar_bank_app/services/database_helper.dart';
import 'package:amar_bank_app/widgets/transfer_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  int selectedIndex = 0;
  List<Widget> wedPages = [
    FutureBuilder(
      future: DatabaseHelper().getCurrentUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.transfers.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "There are no transfer.\nYou can transfer money to another account from home page",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.transfers.length,
              itemBuilder: (context, index) {
                final currentTransfer = snapshot.data!.transfers[index];
                return TransferCard(
                  currentTransfer.amountOfMoney.toString(),
                  currentTransfer.senderCardNumber,
                  currentTransfer.receiverCardNumber,
                  DateFormat.yMMMd().add_jm().format(
                        currentTransfer.time.toDate(),
                      ),
                );
              },
            );
          }
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong. Please try again later"),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ),
    FutureBuilder(
      future: DatabaseHelper().getCurrentUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.products.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "There are no products.\nTry to apply for them from home page",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.products.length,
              itemBuilder: (context, index) {
                final currentTransfer = snapshot.data!.products[index];
                return TransferCard(
                  currentTransfer.amountOfMoney.toString(),
                  currentTransfer.nameOfProduct,
                  currentTransfer.type,
                  DateFormat.yMMMd().add_jm().format(
                        currentTransfer.time.toDate(),
                      ),
                );
              },
            );
          }
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong. Please try again later"),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'TRANSACTIONS',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
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
              label: "Transfers",
              icon: Image(
                image: AssetImage("Images/transfer.png"),
                width: 40,
              )),
          BottomNavigationBarItem(
            label: "Products",
            icon: Image(
              image: AssetImage("Images/product.png"),
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}

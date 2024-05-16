//سعر بيع و شراء
import 'package:amar_bank_app/services/database_helper.dart';
import 'package:amar_bank_app/widgets/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/exchange_rate.dart';

class CurrencyExchangeRate extends StatefulWidget {
  const CurrencyExchangeRate({super.key});

  @override
  State<CurrencyExchangeRate> createState() => _CurrencyExchangeRateState();
}

class _CurrencyExchangeRateState extends State<CurrencyExchangeRate> {
  List<ExchangeRate> exchangeRates = [];
  @override
  void initState() {
    super.initState();
    getExchangeRates();
  }

  void getExchangeRates() async {
    exchangeRates = await DatabaseHelper().getCurrenciesData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'EXCHANGE RATE',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenheight / 6,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'LAST UPDATE ${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'EGYPTIAN POUND EXCHANGE RATE',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenheight / 1.5,
              child: ListView.builder(
                itemCount: exchangeRates.length,
                itemBuilder: (context, index) {
                  return CurrencyCard(rate: exchangeRates[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}




  // CurrencyCard('USA.png', 'USA', "USD", '31', '32'),
  // CurrencyCard('EUR.png', 'EUR', "Euro", '31', '32'),
  // CurrencyCard('SAR.png', 'SAR', "Saudi Rial", '31', '32'),
  // CurrencyCard('GBP.png', 'GBP', "Britch Pound", '31', '32'),
  // CurrencyCard('AED.png', 'AED', "Emirates Dirham", '31', '32'),
  // CurrencyCard('CHF.png', 'CHF', "Swiss Franc", '31', '32'),
  // CurrencyCard('AUD.png', 'AUD', "Australian Dollar", '31', '32'),
  // CurrencyCard('BHD.png', 'BHD', "Bahraini Dinar", '31', '32'),
  // CurrencyCard('CAD.png', 'CAD', "Canadian Dollar", '31', '32'),
  // CurrencyCard('CNY.png', 'CNY', "Chinese Yuan", '31', '32'),
  // CurrencyCard('DKK.png', 'DKK', "Danish krone", '31', '32'),
  // CurrencyCard('JOD.png', 'JOD', "Jordanian Dinar", '31', '32'),
  // CurrencyCard('JPY.png', 'JPY', "Japanese yen", '31', '32'),
  // CurrencyCard('KWD.png', 'KWD', "Kuwaiti Dinar", '31', '32'),
  // CurrencyCard('NOK.png', 'NOK', "Norwegian Krone", '31', '32'),
  // CurrencyCard('OMR.png', 'OMR', "Omani Rial", '31', '32'),
  // CurrencyCard('QAR.png', 'QAR', "qatari rial", '31', '32'),
  // CurrencyCard('SEK.png', 'SEK', "swedish krona", '31', '32'),

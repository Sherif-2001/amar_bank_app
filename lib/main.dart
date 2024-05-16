//blue[900],yellow[100], title app bar size: 30

import 'package:amar_bank_app/firebase_options.dart';
import 'package:amar_bank_app/pages/after_log_products.dart';
import 'package:amar_bank_app/pages/bill_page.dart';
import 'package:amar_bank_app/pages/electric_pay.dart';
import 'package:amar_bank_app/pages/registeration_page.dart';
import 'package:amar_bank_app/pages/transfer_page.dart';
import 'package:amar_bank_app/pages/water_pay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'pages/atm_branch_maps.dart';
import 'pages/currency_exchange_rate.dart';
import 'pages/faqs.dart';
import 'pages/forget_pass_or_user.dart';
import 'pages/loan_calc.dart';
import 'pages/TEST_PAGEEEEEEEE.dart';
import 'pages/products_page.dart';
import 'pages/start_page.dart';
import 'pages/transactions_page.dart';
import 'pages/chat_bot.dart';
import 'pages/gas_pay.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/user_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const StartPage()
          : const UserHomePage(),
      routes: {
        '/start': (context) => const StartPage(),
        '/reg_sign_up': (context) => const RegisterationPage(),
        '/product': (context) => const ProductsPage(),
        '/faqs': (context) => const FAQS(),
        '/user_home_page': (context) => const UserHomePage(),
        '/atm_or_branch': (context) => const ATMBranch(),
        '/currency_rate': (context) => const CurrencyExchangeRate(),
        '/chat_bot': (context) => const ChatBot(),
        '/forget_p_u': (context) => const ForgetPasswordAndUser(),
        '/loan_calc': (context) => const LoanCalc(),
        '/elec_pay': (context) => const ElectricPay(),
        '/elec_bill': (context) => const BillPage(),
        '/gas_pay': (context) => const GasPay(),
        '/water_pay': (context) => const WaterPay(),
        '/aftr-log-prod': (context) => const AfterLogProducts(),
        '/transfer': (context) => const TransferPage(),
        '/transactions': (context) => const TransactionsPage(),
        'test': (context) => const test()
      },
    );
  }
}

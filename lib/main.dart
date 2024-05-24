//blue[900],yellow[100], title app bar size: 30

import 'package:amar_bank_app/firebase_options.dart';
import 'package:amar_bank_app/pages/bill_page.dart';
import 'package:amar_bank_app/pages/pay_page.dart';
import 'package:amar_bank_app/pages/registeration_page.dart';
import 'package:amar_bank_app/pages/transfer_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/atm_branch_maps.dart';
import 'pages/currency_exchange_rate.dart';
import 'pages/faqs.dart';
import 'pages/forget_password_page.dart';
import 'pages/loan_calc.dart';
import 'pages/TEST_PAGEEEEEEEE.dart';
import 'pages/products_page.dart';
import 'pages/start_page.dart';
import 'pages/transactions_page.dart';
import 'pages/chat_bot.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/user_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
        '/forget_p_u': (context) => const ForgetPasswordPage(),
        '/loan_calc': (context) => const LoanCalc(),
        '/pay': (context) => const PayPage(companyType: "Electricity"),
        '/elec_bill': (context) => const BillPage(),
        '/transfer': (context) => const TransferPage(),
        '/transactions': (context) => const TransactionsPage(),
        'test': (context) => const test()
      },
    );
  }
}

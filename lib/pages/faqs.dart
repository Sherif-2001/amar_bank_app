import 'package:amar_bank_app/widgets/question_and_answer_template.dart';
import 'package:flutter/material.dart';

class FAQS extends StatefulWidget {
  const FAQS({super.key});
  @override
  State<FAQS> createState() => _FAQSState();
}

class _FAQSState extends State<FAQS> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQs',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: screenwidth,
        height: screenheight,
        color: Colors.yellow[100],
        padding:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Text("FREQUENTLY ASKED QUESTIONS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20)),
              SizedBox(
                height: 80,
              ),
              QuestionAndAnswerTemplate('How can I open a new bank account ?',
                  'To open a new bank account, you can visit your nearest bank branch and speak to - a customer service representitave he will guide you through the account opening process and provide you with the necessary forms and requirements'),
              QuestionAndAnswerTemplate(
                  'What documents do I need to provide to open a bank account ?',
                  ' The required documents may vary depending on the bank and the type of account - you wish to open Generally, you will need to provide identification documents such as a valid passport or national ID card, address and sometimes proof of income or employment'),
              QuestionAndAnswerTemplate(
                  'What types of accounts does the bank offer ?',
                  ' Banks typically offer a variety of accounts, including savings accounts, checking - accounts, certificates of deposit (CDs), money market accounts, and individual retirement accounts (IRAs) Some banks may also offer specialized accounts for students, seniors, or businesses'),
              QuestionAndAnswerTemplate('How can I apply for a loan ?',
                  'To apply for a loan you can usually do so through our mobile app, or by visiting a branch The application process typically involves providing personal and financial information, and the bank will assess your eligibility based on factors such as credit history and income '),
              QuestionAndAnswerTemplate(
                  'What are the interest rates for different types of accounts and loans ?',
                  ' Interest rates for accounts and loans can vary based on factors such as the type of account or loan, prevailing market rates, and your creditworthiness. We provide competitive interest rates, and our rates can be found on our application or by contacting our customer service team . For further details you can ask our ChatBot'),
              QuestionAndAnswerTemplate(
                  'How can I transfer money to another bank account ?',
                  'You can transfer money to another bank account by using mobile banking app or by visiting one of our bank branches. You will need the recipient account details, including the bank name, account number, and routing number. Follow the instructions provided by the chosen transfer method to initiate the transfer '),
              QuestionAndAnswerTemplate(
                  'What should I do if my debit/credit card is lost or stolen ?',
                  'If your debit or credit card is lost or stolen it is important to act quickly to prevent unauthorized use. Contact our customer service immediately to report the loss or theft. We will block your card to prevent further transactions and guide you through the process of getting a replacement card'),
              QuestionAndAnswerTemplate(
                  'How do I set up online banking and access my account online ?',
                  'To set up online banking, visit our website and download our application. Fill the required fields to create an online banking account . Once registered, you can log in using your chosen username and password to access your account online .'),
              QuestionAndAnswerTemplate(
                  'How can I update my personal information, such as address or phone number, with the bank ?',
                  'To update your personal information, you can visit one of our bank branches and fill out a form to request the changes. Alternatively, you can contact our customer service team to initiate the update process. Ensure that you have proper identification documents available to verify the changes .'),
            ],
          ),
        ),
      ),
    );
  }
}

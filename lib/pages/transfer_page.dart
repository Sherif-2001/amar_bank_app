import 'package:amar_bank_app/services/database_helper.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});
  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController _cardNumController = TextEditingController();
  final TextEditingController _cardPinController = TextEditingController();
  final TextEditingController _amountOfMoneyController =
      TextEditingController();
  final TextEditingController _otherCardNumController = TextEditingController();
  final TextEditingController _otherNationalIdController =
      TextEditingController();

  Future<void> transferMoney() async {
    await DatabaseHelper().transferMoney(
        int.parse(_amountOfMoneyController.text), _otherCardNumController.text);
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushReplacementNamed(context, "/user_home_page");
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Transfer Money',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: screenwidth,
          height: screenheight,
          color: Colors.yellow[100],
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Money Transfer Became More Easy",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8.0,
                              spreadRadius: 2.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: _cardNumController,
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.number,
                          maxLength: 16,
                          decoration: const InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20) //ممكن ادي الملاحظة لون ,
                            ,
                            labelText:
                                "AMAR BANK CARD NUMBER" //ده عنوان ومش بيختفي لما اختار الحقل
                            ,
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight:
                                    FontWeight.bold) //و فيه كمان لون للعنوان
                            , //الايقونة اللي بتظهر في جنب في الحقل
                            //ممكن بدل prefix اعمل حاجة تعكس مكان ظهور الايقونة في الحقل اسمها suffix
                          ),
                          validator: (value) {
                            if (value!.length < 16) {
                              return "Incomplete Value";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8.0,
                              spreadRadius: 2.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: _cardPinController,
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          decoration: const InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20) //ممكن ادي الملاحظة لون ,
                            ,
                            labelText:
                                "CARD PIN" //ده عنوان ومش بيختفي لما اختار الحقل
                            ,
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight:
                                    FontWeight.bold) //و فيه كمان لون للعنوان
                            , //الايقونة اللي بتظهر في جنب في الحقل
                            //ممكن بدل prefix اعمل حاجة تعكس مكان ظهور الايقونة في الحقل اسمها suffix
                          ),
                          validator: (value) {
                            if (value!.length < 4) {
                              return "Incomplete Value";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8.0,
                              spreadRadius: 2.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: _amountOfMoneyController,
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.number,
                          maxLength: 5,
                          decoration: const InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20) //ممكن ادي الملاحظة لون ,
                            ,
                            labelText:
                                "AMOUNT OF MONEY" //ده عنوان ومش بيختفي لما اختار الحقل
                            ,
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight:
                                    FontWeight.bold) //و فيه كمان لون للعنوان
                            , //الايقونة اللي بتظهر في جنب في الحقل
                            //ممكن بدل prefix اعمل حاجة تعكس مكان ظهور الايقونة في الحقل اسمها suffix
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter the amount of money to transfer";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8.0,
                              spreadRadius: 2.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: _otherCardNumController,
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.number,
                          maxLength: 16,
                          decoration: const InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20) //ممكن ادي الملاحظة لون ,
                            ,
                            labelText:
                                "ANOTHER CARD NUMBER" //ده عنوان ومش بيختفي لما اختار الحقل
                            ,
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight:
                                    FontWeight.bold) //و فيه كمان لون للعنوان
                            , //الايقونة اللي بتظهر في جنب في الحقل
                            //ممكن بدل prefix اعمل حاجة تعكس مكان ظهور الايقونة في الحقل اسمها suffix
                          ),
                          validator: (value) {
                            if (value!.length < 16) {
                              return "Incomplete Value";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8.0,
                              spreadRadius: 2.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: _otherNationalIdController,
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.number,
                          maxLength: 14,
                          decoration: const InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20) //ممكن ادي الملاحظة لون ,
                            ,
                            labelText:
                                "NATIONAL ID/PASSPORT NUMPER (for another account owner)" //ده عنوان ومش بيختفي لما اختار الحقل
                            ,
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight:
                                    FontWeight.bold) //و فيه كمان لون للعنوان
                            , //الايقونة اللي بتظهر في جنب في الحقل
                            //ممكن بدل prefix اعمل حاجة تعكس مكان ظهور الايقونة في الحقل اسمها suffix
                          ),
                          validator: (value) {
                            if (value!.length < 14) {
                              return "Incomplete Value";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8.0,
                                spreadRadius: 2.0)
                          ],
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      height: 60,
                      child: const Center(
                          child: Text("Transfer",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))),
                    ),
                    onTap: () {
                      if (!_formKey.currentState!.validate()) return;

                      //اكشن زرار ال continue
                      setState(
                        () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.yellow[100],
                                title: Center(
                                    child: Text(
                                        "Are you sure that you want to transfer ${_amountOfMoneyController.text} EGP To this account")),
                                content: MaterialButton(
                                  color: Colors.black,
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.yellow[100],
                                            title: const Center(
                                                child: Text(
                                                    'Successful Transaction')),
                                            content: MaterialButton(
                                              color: Colors.black,
                                              onPressed: () async {
                                                await transferMoney();
                                                await Navigator.pushNamed(
                                                    context, '/user_home_page');
                                              },
                                              child: const Text(
                                                'OK',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: const Text(
                                    'yes',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

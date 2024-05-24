import 'package:amar_bank_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _formKey = GlobalKey<FormState>();

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});
  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _expDateController = TextEditingController();
  final _nationalidController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _cardpinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: screenwidth,
        height: screenheight,
        padding:
            const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
        color: Colors.yellow[100],
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('FORGET PASSWORD'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
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
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: _nationalidController,
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.number,
                      maxLength: 14,
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
                            "NATIONAL ID / PASSPORT NUMPER " //ده عنوان ومش بيختفي لما اختار الحقل
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
                        if (value!.length < 14) {
                          return "Incomplete Value";
                        } else if (value.isEmpty) {
                          return "Field is Required";
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
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                        controller: _cardNumberController,
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

                            ),
                        validator: (value) {
                          if (value!.length < 16) {
                            return "Incomplete Value";
                          } else if (value.isEmpty) {
                            return "Field is Required";
                          }
                          return null;
                        }),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                    width: screenwidth / 2.2,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                            controller: _cardpinController,
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.number,
                            obscureText: true,
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
                              } else if (value.isEmpty) {
                                return "Field is Required";
                              }
                              return null;
                            }),
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
                    width: screenwidth / 2.2,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                            cursorColor: Colors.grey,
                            controller: _expDateController,
                            maxLength: 10,
                            decoration: InputDecoration(
                              labelText: "EXP DATE",
                              labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.date_range),
                                onPressed: () async {
                                  DateTime? pickeddate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));
                                  if (pickeddate != null) {
                                    setState(() {
                                      _expDateController.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickeddate);
                                    });
                                  }
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.length < 10) {
                                return "Incomplete Value";
                              } else if (value.isEmpty) {
                                return "Field is Required";
                              }
                              return null;
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                      child: Text("PROCEED",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))),
                ),
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    final isUserExist = await Auth().forgetPassword(
                        cardNum: _cardNumberController.text,
                        nationalId: _nationalidController.text,
                        cardPin: _cardpinController.text,
                        expDate: _expDateController.text);
                    if (isUserExist) {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(
                          context, '/user_home_page');
                    }
                  }
                  //اكشن زرار ال continue
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

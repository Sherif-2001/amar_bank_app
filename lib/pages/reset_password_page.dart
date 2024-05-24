import 'package:amar_bank_app/services/database_helper.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key, required this.cardNum});

  final String cardNum;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _newPassController = TextEditingController();
  final _confirmPassController = TextEditingController();
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
              Text('Reset PASSWORD'.toUpperCase(),
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
                      controller: _newPassController,
                      cursorColor: Colors.grey,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      decoration: InputDecoration(
                        floatingLabelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20) //ممكن ادي الملاحظة لون ,
                        ,
                        labelText: "New Password"
                            .toUpperCase() //ده عنوان ومش بيختفي لما اختار الحقل
                        ,
                        labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold) //و فيه كمان لون للعنوان
                        , //الايقونة اللي بتظهر في جنب في الحقل
                        //ممكن بدل prefix اعمل حاجة تعكس مكان ظهور الايقونة في الحقل اسمها suffix
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
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
                      controller: _confirmPassController,
                      obscureText: true,
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      decoration: InputDecoration(
                        floatingLabelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20) //ممكن ادي الملاحظة لون ,
                        ,
                        labelText: "Confirm Password"
                            .toUpperCase() //ده عنوان ومش بيختفي لما اختار الحقل
                        ,
                        labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold) //و فيه كمان لون للعنوان
                        , //الايقونة اللي بتظهر في جنب في الحقل
                        //ممكن بدل prefix اعمل حاجة تعكس مكان ظهور الايقونة في الحقل اسمها suffix
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is Required";
                        }
                        if (value != _newPassController.text) {
                          return "Passwords Don't Match";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
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
                  child: Center(
                    child: Text(
                      "Change Password".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    await DatabaseHelper()
                        .changePassword(widget.cardNum, _newPassController.text)
                        .then((value) => Navigator.pop(context));
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

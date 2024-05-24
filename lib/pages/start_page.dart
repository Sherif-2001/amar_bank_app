import 'package:amar_bank_app/services/auth.dart';
import 'package:amar_bank_app/services/database_helper.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cardNumController = TextEditingController();

  Future<void> signInWithCardNumAndPassword() async {
    try {
      await Auth().signInWithCardNumAndPassword(
          cardNum: _cardNumController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      if (e.code == 'user-not-found') {
        //print('No user found for that email.');
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          title: "User Not Found",
          desc:
              "No user found for that email . Enter correct email or try to sign up ",
          btnOkOnPress: () {},
        ).show();
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          title: "Wrong Password",
          desc:
              "Wrong password provided for this user . Please Enter correct password",
          btnOkOnPress: () {},
        ).show();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            setState(() {
              Navigator.of(context).pushNamed('/chat_bot');
            });
          },
          child: SizedBox(
            width: 40,
            height: 40,
            child: Image.asset("Images/ChatBot.png"),
          )),
      body: Form(
        child: Container(
          padding:
              const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
          child: SingleChildScrollView(
            child:
                //  Form--------------------
                Column(
              children: [
                SizedBox(
                    width: screenwidth / 1.5,
                    height: screenheight / 4,
                    child: Image.asset("Images/banklogo.png")),
                const SizedBox(height: 10),
                SizedBox(
                    height: screenheight / 3.2,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /////////////////////////////////
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 8.0,
                                        spreadRadius: 2.0)
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextFormField(
                                    controller: _cardNumController,
                                    cursorColor: Colors.grey,
                                    maxLines: 1,
                                    maxLength: 16,
                                    decoration: InputDecoration(
                                      floatingLabelStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize:
                                              18) //ممكن ادي الملاحظة لون ,
                                      ,
                                      labelText:
                                          "Card Number" //ده عنوان ومش بيختفي لما اختار الحقل
                                      ,
                                      labelStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight
                                              .bold) //و فيه كمان لون للعنوان
                                      ,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                        ),
                                      ), //الايقونة اللي بتظهر في جنب في الحقل
                                      //ممكن بدل prefix اعمل حاجة تعكس مكان ظهور الايقونة في الحقل اسمها suffix
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Field is Required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 8.0,
                                        spreadRadius: 2.0)
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    cursorColor: Colors.grey,
                                    maxLines: 1,
                                    maxLength: 8,
                                    decoration: InputDecoration(
                                      floatingLabelStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize:
                                              20) //ممكن ادي الملاحظة لون ,
                                      ,
                                      labelText:
                                          "Password" //ده عنوان ومش بيختفي لما اختار الحقل
                                      ,
                                      labelStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight
                                              .bold) //و فيه كمان لون للعنوان
                                      ,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                        ),
                                      ), //الايقونة اللي بتظهر في جنب في الحقل
                                      //ممكن بدل prefix اعمل حاجة تعكس مكان ظهور الايقونة في الحقل اسمها suffix
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ' Field is Required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    InkWell(
                        child: const Text("Forget Password..?",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                decoration: TextDecoration.underline)),
                        onTap: () {
                          Navigator.of(context).pushNamed('/forget_p_u');
                        })
                  ],
                ), //اليوزر نسي الباسورد
                InkWell(
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(vertical: 20),
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
                          child: Text("Log In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))),
                    ),
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final isUserExists = await DatabaseHelper()
                            .getUserDataByCardNum(_cardNumController.text);
                        if (isUserExists.email.isNotEmpty) {
                          await signInWithCardNumAndPassword();
                          await Navigator.of(context)
                              .pushReplacementNamed("/user_home_page");
                        }
                      }
                    }),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "New user..?",
                      style: TextStyle(fontSize: 17),
                    ),
                    InkWell(
                      child: const Text(" Register now",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontSize: 17)),
                      onTap: () {
                        setState(() {
                          //اكشن نص register now
                          Navigator.of(context).pushNamed("/reg_sign_up");
                        });
                      },
                    )
                  ],
                ), //يوزر جديد
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 8.0,
                                        spreadRadius: 2.0)
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 80,
                              height: 80,
                              child: Image.asset("Images/product.png"),
                            ),
                            const SizedBox(height: 10),
                            const Text("Products",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pushNamed("/product");
                          });
                        },
                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 8.0,
                                        spreadRadius: 2.0)
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 80,
                              height: 80,
                              child: Image.asset("Images/atm.png"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Branch/ATM",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pushNamed('/atm_or_branch');
                          });
                        },
                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 8.0,
                                        spreadRadius: 2.0)
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 80,
                              height: 80,
                              child: Image.asset("Images/money.png"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Exchange rate",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pushNamed('/currency_rate');
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 8.0,
                                        spreadRadius: 2.0)
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 80,
                              height: 80,
                              child: Image.asset("Images/loan.png"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Loan calculator",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, '/loan_calc');
                          });
                        },
                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 8.0,
                                        spreadRadius: 2.0)
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 80,
                              height: 80,
                              child: Image.asset("Images/FAQs.png"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "FAQs",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pushNamed('/faqs');
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

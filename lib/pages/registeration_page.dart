import 'package:amar_bank_app/models/user_data.dart';
import 'package:amar_bank_app/services/auth.dart';
import 'package:amar_bank_app/services/database_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';

final _formKey = GlobalKey<FormState>();

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _cardNumController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cardPinController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> registerNewUser() async {
    try {
      int initialBalance = Random().nextInt(300 + 10000) + 300;

      await Auth().createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      await DatabaseHelper().createUserInDatabase(
          cardNum: _cardNumController.text,
          userData: UserData(
              balance: initialBalance,
              address: _addressController.text,
              cardNum: _cardNumController.text,
              cardPin: _cardPinController.text,
              email: _emailController.text,
              expiryDate: _expiryDateController.text,
              nationalId: _nationalIdController.text,
              password: _passwordController.text,
              username: _usernameController.text));
    } on FirebaseAuthException catch (e) {
      print("Hello " + e.message.toString());
      if (e.code == 'weak-password') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          title: "Weak Password",
          desc:
              "The password provided is too weak , Change it for better Secuirty",
          btnOkOnPress: () {},
        ).show();
      } else if (e.code == 'email-already-in-use') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "Used Email",
          desc: "The Email is already in use , Login or change it to continue",
          btnCancelOnPress: () {},
          btnOkText: "Login",
          btnOkOnPress: () {
            Navigator.of(context).pushNamed('/start');
          },
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
      body: Form(
        child: Container(
          color: Colors.yellow[100],
          padding:
              const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
          width: screenwidth,
          height: screenheight,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text("REGISTRATION",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Please Verify Your Identity",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  const SizedBox(
                    height: 20,
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
                          controller: _nationalIdController,
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
                                "National ID / Passport Number " //ده عنوان ومش بيختفي لما اختار الحقل
                            ,
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors
                                    .red, // Customize the color of the error border
                                // Customize the width of the error border
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.length < 14) {
                              return 'Incomplete Value';
                            }
                            if (value.isEmpty) {
                              return 'Field is Required';
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
                          controller: _cardNumController,
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.number,
                          maxLength: 16,
                          decoration: const InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                            labelText: "Card Number",
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors
                                    .red, // Customize the color of the error border
                                // Customize the width of the error border
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.length < 16) {
                              return 'Incomplete Value';
                            }
                            if (value.isEmpty) {
                              return 'Field is Required';
                            }
                            return null;
                          },
                        ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: screenwidth / 2.2,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              controller: _cardPinController,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.grey,
                              obscureText: true,
                              maxLength: 4,
                              decoration: const InputDecoration(
                                floatingLabelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 20),
                                labelText: "Card Pin",
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .red, // Customize the color of the error border
                                    // Customize the width of the error border
                                  ),
                                ),
                              ),
                              validator: (String? value) {
                                if (value!.length < 4) {
                                  return 'Incomplete Value';
                                }
                                if (value.isEmpty) {
                                  return 'Field is Required';
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: screenwidth / 2.2,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              controller: _expiryDateController,
                              maxLength: 10,
                              decoration: InputDecoration(
                                floatingLabelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                labelText: "Exp Date",
                                labelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                prefixIcon: IconButton(
                                  icon: const Icon(Icons.date_range),
                                  onPressed: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      setState(() {
                                        _expiryDateController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                      });
                                    }
                                  },
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .red, // Customize the color of the error border
                                    // Customize the width of the error border
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Field is Required';
                                }
                                if (value.isEmpty) {
                                  return 'Field is Required';
                                }
                                DateTime selectedDate =
                                    DateFormat('yyyy-MM-dd').parse(value);
                                DateTime currentDate = DateTime.now();
                                if (selectedDate.isBefore(currentDate)) {
                                  return 'Cannot select a date prior to today.';
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                          ),
                        ),
                      ),
                    ],
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
                          controller: _usernameController,
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.name,
                          maxLength: 20,
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
                                "Username" //ده عنوان ومش بيختفي لما اختار الحقل
                            ,
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors
                                    .red, // Customize the color of the error border
                                // Customize the width of the error border
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null) {
                              return 'Field is Required';
                            }
                            if (value.isEmpty) {
                              return 'Field is Required';
                            }
                            if (value.length < 3) {
                              return 'Invalid username';
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
                          controller: _emailController,
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.streetAddress,
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
                                "Email" //ده عنوان ومش بيختفي لما اختار الحقل
                            ,
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors
                                    .red, // Customize the color of the error border
                                // Customize the width of the error border
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null) {
                              return 'Field is Required';
                            }
                            if (value.isEmpty) {
                              return 'Field is Required';
                            }
                            if (value.length < 4) {
                              return 'Invalid email';
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
                          controller: _addressController,
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.streetAddress,
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
                                "Address" //ده عنوان ومش بيختفي لما اختار الحقل
                            ,
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors
                                    .red, // Customize the color of the error border
                                // Customize the width of the error border
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null) {
                              return 'Field is Required';
                            }
                            if (value.isEmpty) {
                              return 'Field is Required';
                            }
                            if (value.length < 4) {
                              return 'Invalid address';
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
                            controller: _passwordController,
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            maxLength: 8,
                            decoration: const InputDecoration(
                              floatingLabelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors
                                      .red, // Customize the color of the error border
                                  // Customize the width of the error border
                                ),
                              ),
                            ),
                            validator: (String? value) {
                              if (value!.length < 8) {
                                return 'Incomplete Value';
                              }
                              if (value.isEmpty) {
                                return 'Field is Required';
                              }
                              return null;
                            },
                          ),
                        ),
                      )),
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
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          maxLength: 8,
                          decoration: const InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors
                                    .red, // Customize the color of the error border
                                // Customize the width of the error border
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.length < 8) {
                              return 'Incomplete Value';
                            }
                            if (value.isEmpty) {
                              return 'Field is Required';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match.';
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
                          child: Text("Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))),
                    ),
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        registerNewUser().then((_) => Navigator.of(context)
                            .pushReplacementNamed('/user_home_page'));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

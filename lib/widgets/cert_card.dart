import 'package:amar_bank_app/services/auth.dart';
import 'package:amar_bank_app/services/database_helper.dart';
import 'package:amar_bank_app/widgets/apply_product_button.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class CertCard extends StatefulWidget {
  final String title; //title
  final int minimumAmount; //minimum
  final double r; // rate
  final String y; // type
  final String te; // tenor
  final String ren; // renew
  const CertCard(
      this.title, this.minimumAmount, this.r, this.y, this.te, this.ren,
      {super.key});

  @override
  State<CertCard> createState() => _CertCardState();
}

class _CertCardState extends State<CertCard> {
 final TextEditingController _pinController = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 8.0, spreadRadius: 2.0)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: screenwidth,
      // height: screenheight / 3,
      child: Card(
        color: Colors.yellow[100],
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: Column(
            children: [
              SizedBox(
                  height: screenheight / 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(widget.title,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 30)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Minimum Amount: EGP ${widget.minimumAmount}',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 20)),
                        ],
                      )
                    ],
                  )),
              const Divider(
                thickness: 6,
                endIndent: 10,
              ),
              SizedBox(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("INTEREST RATE"),
                        Text("INTEREST TYPE"),
                        Text("CERTIFICATE TENOR"),
                        Text("RENEW")
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.r} %',
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 15)),
                        Text(widget.y,
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 15)),
                        Text(widget.te,
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 15)),
                        Text(widget.ren,
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 15))
                      ],
                    )
                  ],
                ),
              ),
              Visibility(
                visible: Auth().currentUser != null,
                child: InkWell(
                  child: const ApplyButton(),
                  onTap: () async {
                    final data = await DatabaseHelper().getCurrentUserData();
                    if (data.balance < widget.minimumAmount) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.yellow[100],
                            title: const Center(
                                child: FittedBox(
                                    child: Text('Your Balance Not Enough'))),
                            content: MaterialButton(
                              color: Colors.black,
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.yellow[100],
                            title: Center(child: Text(widget.title)),
                            content: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: TextFormField(
                                      controller: _pinController,
                                      cursorColor: Colors.grey,
                                      keyboardType: TextInputType.number,
                                      maxLength: 4,
                                      decoration: InputDecoration(
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        hintStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontSize:
                                                20) //ممكن ادي الملاحظة لون ,
                                        ,
                                        labelText: "Card Pin"
                                            .toUpperCase() //ده عنوان ومش بيختفي لما اختار الحقل
                                        ,
                                        labelStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight
                                                .bold) //و فيه كمان لون للعنوان
                                        , //الايقونة اللي بتظهر في جنب في الحقل
                                        //ممكن بدل prefix اعمل حاجة تعكس مكان ظهور الايقونة في الحقل اسمها suffix
                                      ),
                                      validator: (value) {
                                        if (value!.length < 4) {
                                          return "Incomplete Value";
                                        }
                                        if (value != data.cardPin) {
                                          return "Invalid Card Pin";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: TextFormField(
                                      controller: _numbercontroller,
                                      cursorColor: Colors.grey,
                                      keyboardType: TextInputType.number,
                                      maxLength: 16,
                                      decoration: InputDecoration(
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        hintStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontSize:
                                                20) //ممكن ادي الملاحظة لون ,
                                        ,
                                        labelText: "Card Number"
                                            .toUpperCase() //ده عنوان ومش بيختفي لما اختار الحقل
                                        ,
                                        labelStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight
                                                .bold) //و فيه كمان لون للعنوان
                                        , //الايقونة اللي بتظهر في جنب في الحقل
                                        //ممكن بدل prefix اعمل حاجة تعكس مكان ظهور الايقونة في الحقل اسمها suffix
                                      ),
                                      validator: (value) {
                                        if (value!.length < 16) {
                                          return "Incomplete Value";
                                        }
                                        if (value != data.cardNum) {
                                          return "Invalid Card Number";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  MaterialButton(
                                    color: Colors.black,
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await DatabaseHelper().applyForProduct(
                                            widget.minimumAmount,
                                            "Certification",
                                            widget.title);
                                        while (Navigator.canPop(context)) {
                                          Navigator.pop(context);
                                        }
                                        Navigator.pushReplacementNamed(
                                            context, "/user_home_page");
                                      }
                                    },
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

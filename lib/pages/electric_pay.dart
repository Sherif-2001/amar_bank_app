import 'package:amar_bank_app/pages/bill_page.dart';
import 'package:flutter/material.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class ElectricPay extends StatefulWidget {
  const ElectricPay({super.key});

  @override
  State<ElectricPay> createState() => _ElectricPayState();
}

class _ElectricPayState extends State<ElectricPay> {
  String dropdownvalue = 'one';
  final TextEditingController _elecSubscription = TextEditingController();

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
            'Electricity Payment',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.yellow[100],
          width: screenwidth,
          height: screenheight,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: screenwidth / 1.2,
                  height: screenheight / 2.5,
                  child: Image.asset("Images/electricity.png"),
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Card(
                    child: Container(
                      width: screenwidth / 1.1,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Companies'),
                            DropdownButton<String>(
                              dropdownColor: Colors.yellow[100],
                              value: dropdownvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.blue,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                              items: const [
                                // add electricity companies
                                // <String> dropDownOptionsElec.map<DropDownMenuItem<String>>
                                DropdownMenuItem(
                                    value: 'one',
                                    child: Text('Canal Electricity')),
                                DropdownMenuItem(
                                    value: 'two',
                                    child: Text('Middle Egypt Electricity')),
                                DropdownMenuItem(
                                    value: 'three',
                                    child: Text('North Delta Electricity')),
                                DropdownMenuItem(
                                    value: 'four',
                                    child: Text('South Delta Electricity')),
                                DropdownMenuItem(
                                    value: 'five',
                                    child: Text('Upper Egypt Electricity')),
                                DropdownMenuItem(
                                    value: 'six',
                                    child: Text('South Cairo Electricity')),
                                DropdownMenuItem(
                                    value: 'seven',
                                    child: Text('Alex Electricity')),
                                DropdownMenuItem(
                                    value: 'eight',
                                    child: Text('Beheira Electricity')),
                              ],
                            ),
                          ],
                        ),
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          //key: _subscriptionformKey,
                          controller: _elecSubscription,
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.number,
                          maxLength: 5,
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
                                "Subscription ID" //ده عنوان ومش بيختفي لما اختار الحقل
                            ,
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight:
                                    FontWeight.bold) //و فيه كمان لون للعنوان
                            ,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ' Field is Required';
                            }
                            if (value.length < 5) {
                              return 'Incomplete Value';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
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
                    child: const Text("Show Bill",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BillPage(
                                subscriptionId: _elecSubscription.text,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

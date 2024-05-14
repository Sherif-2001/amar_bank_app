import 'package:amar_bank_app/pages/bill_page.dart';
import 'package:flutter/material.dart';

class GasPay extends StatefulWidget {
  const GasPay({super.key});
  @override
  State<GasPay> createState() => _GasPayState();
}

var temp = 0;
TextEditingController _gasSubscription = TextEditingController();
String subscriptionID = _gasSubscription.text;

final gasKey = GlobalKey<FormState>();
TextEditingController gasController = TextEditingController();

class _GasPayState extends State<GasPay> {
  String dropdownvalue = 'one';

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
            'Gas Payment',
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
                  child: Image.asset("Images/gas.png"),
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
                                DropdownMenuItem(
                                    value: 'one', child: Text('TAQA GAS')),
                                DropdownMenuItem(
                                    value: 'two', child: Text('NATGAS')),
                                DropdownMenuItem(
                                    value: 'three', child: Text('Gastec')),
                                DropdownMenuItem(
                                    value: 'four', child: Text(' Master Gas')),
                                DropdownMenuItem(
                                    value: 'five', child: Text('Petrotrade')),
                                DropdownMenuItem(
                                    value: 'six', child: Text(' Car Gas')),
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
                        key: gasKey,
                        child: TextFormField(
                          controller: gasController,
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
                                "CLIENT NUMBER" //ده عنوان ومش بيختفي لما اختار الحقل
                            ,
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight:
                                    FontWeight.bold) //و فيه كمان لون للعنوان
                            ,
                          ),
                          //validator: validateGasNumber(),
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
                    child: const Center(
                        child: Text("Show Bill",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))),
                  ),
                  onTap: () {
                    //اكشن زرار ال show bill

                    setState(
                      () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BillPage(
                              subscriptionId: gasController.text,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

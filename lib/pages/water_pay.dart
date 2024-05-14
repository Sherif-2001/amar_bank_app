import 'package:amar_bank_app/pages/bill_page.dart';
import 'package:flutter/material.dart';

var temp = 0;
TextEditingController _waterSubscription = TextEditingController();
String watersubscriptionID = _waterSubscription.text;

class WaterPay extends StatefulWidget {
  const WaterPay({super.key});
  @override
  State<WaterPay> createState() => _WaterPayState();
}

class _WaterPayState extends State<WaterPay> {
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
            'Water Payment',
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
                  child: Image.asset("Images/water.png"),
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
                                // elec companies
                                DropdownMenuItem(
                                    value: 'one',
                                    child: Text('Giza Water Company')),
                                DropdownMenuItem(
                                    value: 'two',
                                    child: Text('Red Sea Company')),
                                DropdownMenuItem(
                                    value: 'three',
                                    child: Text('Matrouh Water')),
                                DropdownMenuItem(
                                    value: 'four', child: Text('AlexWater ')),
                                DropdownMenuItem(
                                    value: 'five', child: Text('Cairo Water ')),
                                DropdownMenuItem(
                                    value: 'six',
                                    child: Text('Beni Suef Water Company')),
                                DropdownMenuItem(
                                    value: 'seven', child: Text('Sohag Water')),
                                DropdownMenuItem(
                                    value: 'eight',
                                    child: Text('Urban Communities ')),
                                DropdownMenuItem(
                                    value: 'nine',
                                    child: Text('Mounofia Water')),
                                DropdownMenuItem(
                                    value: 'ten',
                                    child: Text('Suez Canal Authority')),
                                DropdownMenuItem(
                                    value: 'eleven',
                                    child: Text(
                                        'Sinai Water Minya Water company')),
                                DropdownMenuItem(
                                    value: 'tweleve',
                                    child: Text('Beheira Water ')),
                                DropdownMenuItem(
                                    value: 'thirteen',
                                    child: Text('Obour City Water')),
                                DropdownMenuItem(
                                    value: 'fourteen',
                                    child:
                                        Text('6th October City Water Company')),
                                DropdownMenuItem(
                                    value: 'fifteen',
                                    child: Text('New Cairo Water Company ')),
                                DropdownMenuItem(
                                    value: 'sixteen',
                                    child: Text('Qalyubia Water Company')),
                                DropdownMenuItem(
                                    value: 'seventeen',
                                    child: Text('Sharqeya Water Company ')),
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
                      child: TextFormField(
                        controller: _waterSubscription,
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
                        // onChange()
                      ),
                    ), //8783241`eqwdaz3`
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
                  onTap: (
                      // randomElec = randomly created number
                      ) {
                    setState(
                      () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => BillPage(
                              subscriptionId: _waterSubscription.text,
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

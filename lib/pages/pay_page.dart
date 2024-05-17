import 'package:amar_bank_app/models/company.dart';
import 'package:amar_bank_app/pages/bill_page.dart';
import 'package:amar_bank_app/services/database_helper.dart';
import 'package:flutter/material.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class PayPage extends StatefulWidget {
  const PayPage({super.key, required this.companyType});

  final String companyType;

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  String dropdownvalue = "";
  final TextEditingController _elecSubscription = TextEditingController();
  List<Company> companiesData = [];

  @override
  void initState() {
    super.initState();
    getCompaniesData();
  }

  void getCompaniesData() async {
    companiesData = await DatabaseHelper().getCompaniesData(widget.companyType);
    dropdownvalue = companiesData[0].id.toString();
    setState(() {});
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
          title: Text(
            '${widget.companyType} Payment',
            style: const TextStyle(
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: screenwidth / 1.2,
                    height: screenheight / 2.5,
                    child: Image.asset(
                        "Images/${widget.companyType.toLowerCase()}.png"),
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
                        vertical: 20, horizontal: 10),
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
                                items: companiesData
                                    .map(
                                      (company) => DropdownMenuItem<String>(
                                        value: company.id.toString(),
                                        child: Text(company.name),
                                      ),
                                    )
                                    .toList(),
                              )
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
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
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
                            if (!value.startsWith(dropdownvalue)) {
                              return "Incorrect ID";
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
      ),
    );
  }
}


// Electricity Companies
// ----------------------------------------------
//  DropdownMenuItem(
//     value: 'one',
//     child: Text('Canal Electricity')),
// DropdownMenuItem(
//     value: 'two',
//     child: Text('Middle Egypt Electricity')),
// DropdownMenuItem(
//     value: 'three',
//     child: Text('North Delta Electricity')),
// DropdownMenuItem(
//     value: 'four',
//     child: Text('South Delta Electricity')),
// DropdownMenuItem(
//     value: 'five',
//     child: Text('Upper Egypt Electricity')),
// DropdownMenuItem(
//     value: 'six',
//     child: Text('South Cairo Electricity')),
// DropdownMenuItem(
//     value: 'seven',
//     child: Text('Alex Electricity')),
// DropdownMenuItem(
//     value: 'eight',
//     child: Text('Beheira Electricity')),


// Gas Companies
// ----------------------------------------------
// DropdownMenuItem(
//     value: 'one', child: Text('TAQA GAS')),
// DropdownMenuItem(
//     value: 'two', child: Text('NATGAS')),
// DropdownMenuItem(
//     value: 'three', child: Text('Gastec')),
// DropdownMenuItem(
//     value: 'four', child: Text(' Master Gas')),
// DropdownMenuItem(
//     value: 'five', child: Text('Petrotrade')),
// DropdownMenuItem(
//     value: 'six', child: Text(' Car Gas')),


// Water Companies
// ----------------------------------------------
// DropdownMenuItem(
//     value: 'one',
//     child: Text('Giza Water Company')),
// DropdownMenuItem(
//     value: 'two',
//     child: Text('Red Sea Company')),
// DropdownMenuItem(
//     value: 'three',
//     child: Text('Matrouh Water')),
// DropdownMenuItem(
//     value: 'four', child: Text('AlexWater ')),
// DropdownMenuItem(
//     value: 'five', child: Text('Cairo Water ')),
// DropdownMenuItem(
//     value: 'six',
//     child: Text('Beni Suef Water Company')),
// DropdownMenuItem(
//     value: 'seven', child: Text('Sohag Water')),
// DropdownMenuItem(
//     value: 'eight',
//     child: Text('Urban Communities ')),
// DropdownMenuItem(
//     value: 'nine',
//     child: Text('Mounofia Water')),
// DropdownMenuItem(
//     value: 'ten',
//     child: Text('Suez Canal Authority')),
// DropdownMenuItem(
//     value: 'eleven',
//     child: Text(
//         'Sinai Water Minya Water company')),
// DropdownMenuItem(
//     value: 'tweleve',
//     child: Text('Beheira Water ')),
// DropdownMenuItem(
//     value: 'thirteen',
//     child: Text('Obour City Water')),
// DropdownMenuItem(
//     value: 'fourteen',
//     child:
//         Text('6th October City Water Company')),
// DropdownMenuItem(
//     value: 'fifteen',
//     child: Text('New Cairo Water Company ')),
// DropdownMenuItem(
//     value: 'sixteen',
//     child: Text('Qalyubia Water Company')),
// DropdownMenuItem(
//     value: 'seventeen',
//     child: Text('Sharqeya Water Company ')),
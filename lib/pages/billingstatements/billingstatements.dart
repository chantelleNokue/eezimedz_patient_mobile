import 'package:flutter/material.dart';

import '../profile.dart';
import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import 'components/statementinfo.dart';

class BillingStatements extends StatefulWidget{
  const BillingStatements({Key ? key}): super(key : key);

  State<BillingStatements> createState() => _BillingStatementsState();
}


class _BillingStatementsState extends State<BillingStatements>{

  //TODO: Add data from dbs to lists

  //List of billing statements
  List<Statement> statements = [
    Statement(
      amount: '2000',
      date: '2023-01-23',
      dateCreated: '2023-08-01',
      department: 'Internal Medicine',
      invoiceNumber: 'APP8085467',
      paymentReference: 'REF-5683748',
      paymenttype: 'Card',
      reason: 'Surgery payment',
    ),

    Statement(
      amount: '7000',
      date: '2023-01-23',
      dateCreated: '2023-08-01',
      department: 'Dermatology',
      invoiceNumber: 'APP9196578',
      paymentReference: ' REF-860435',
      paymenttype: 'Card',
      reason: 'Prescription Payment',
    ),

    Statement(
      amount: '5000',
      date: '2023-01-23',
      dateCreated: '2023-08-01',
      department: 'Radiology',
      invoiceNumber: 'APP8085467',
      paymentReference: ' REF-759324',
      paymenttype: 'Card',
      reason: 'Surgery payment',
    ),

    Statement(
      amount: '3000',
      date: '2023-01-23',
      dateCreated: '2023-08-01',
      department: 'Cardiology',
      invoiceNumber: 'APP8085467',
      paymentReference: 'REF-231278',
      paymenttype: 'Card',
      reason: 'Prescription payment',
    ),

    Statement(
      amount: '2000',
      date: '2023-01-23',
      dateCreated: '2023-08-01',
      department: 'Oncology',
      invoiceNumber: 'APP8085467',
      paymentReference: 'REF-540912',
      paymenttype: 'Card',
      reason: 'Surgery payment',
    ),

    Statement(
      amount: '2000',
      date: '2023-01-23',
      dateCreated: '2023-08-01',
      department: 'Pediatrics',
      invoiceNumber: 'APP8085467',
      paymentReference: 'REF-540912',
      paymenttype: 'Card',
      reason: 'Cast payment',
    ),

    Statement(
      amount: '900',
      date: '2023-01-23',
      dateCreated: '2023-08-01',
      department: 'Neurology',
      invoiceNumber: 'APP8085467',
      paymentReference: 'REF-540912',
      paymenttype: 'Card',
      reason: 'Surgery payment',
    ),
  ];

  List<Statement> filteredDataList = [];

  @override
  void initState() {
    super.initState();
    // At the beginning, show all the data
    filteredDataList = statements;
  }

  void _filterData(String searchQuery) {
    List<Statement> filteredList = [];
    if (searchQuery.isNotEmpty) {
      // Filter the data based on the search query
      filteredList = statements
          .where((doctor) =>
          doctor.department!.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    } else {
      // If the search query is empty, show all the data
      filteredList = statements;
    }
    setState(() {
      filteredDataList = filteredList;
    });
  }


  final searchController = TextEditingController();


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Billing Statements'),
        automaticallyImplyLeading: false,
        leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu_sharp, color: Colors.white,)
              );
            }
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile())),
            icon: Icon(Icons.person),
          ),
        ],
      ),

      drawer: DrawerClass(),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
              children: [

                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(11),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        'Billing Statements',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                SizedBox(
                  height: 80,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value){
                          _filterData(value);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 0.8),
                          ),
                          hintText: 'search by department',
                          suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 600,
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    itemCount: filteredDataList.length,
                    itemBuilder: (context, index){
                      Statement statement = filteredDataList[index];
                      return Column(
                        children: [
                          Material(
                            elevation: 1,
                            borderRadius: BorderRadius.circular(12),
                            child: GestureDetector(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return StatementInfo(
                                      date: statement.date,
                                      reason: statement.reason,
                                      department: statement.department,
                                      amount: statement.amount,
                                      dateCreated: statement.dateCreated,
                                      invoiceNumber: statement.invoiceNumber,
                                      paymentReference: statement.paymentReference,
                                      paymenttype: statement.paymenttype,
                                    );
                                  }
                              ),
                              child: Container(
                                height: 50,
                                width: 900,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueGrey,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$${statement.amount} payment to ${statement.department}',),

                                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height:10,),
                        ],
                      );
                    },
                  ),
                )



              ],
            ),
        ),
      ),

      bottomNavigationBar: NavBar(),

    );
  }
}


class Statement {
  final String? reason;
  final String? date;
  final String? dateCreated;
  final String? paymentReference;
  final String? invoiceNumber;
  final String? department;
  final String? amount;
  final String? paymenttype;

  Statement({
    this.reason,
    this.date,
    this.dateCreated,
    this.paymentReference,
    this.invoiceNumber,
    this.department,
    this.amount,
    this.paymenttype,
});
}
import 'package:flutter/material.dart';

class ViewDataInvoices extends StatelessWidget {
  final String? firstname;
  final String? lastName;
  final String? nationalID;
  final String? patientID;
  final String? invoiceNumber;
  final String? invoiceDate;
  final String? paymentDue;
  final String? amountDue;
  final String? producrName;
  final String? price;
  final String? tax;
  final String? discount;
  final String? subTotals;



  const ViewDataInvoices({super.key, this.firstname, this.lastName, this.nationalID, this.patientID, this.invoiceNumber, this.invoiceDate, this.paymentDue, this.amountDue, this.producrName, this.price, this.tax, this.discount, this.subTotals});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Eezimedz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Specify the color of the border
                  width: 1.0, // Specify the width of the border
                ),
              ),
            ),
            child: const SizedBox(
              height: 130,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Specialists in Machine Learning", style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.print,
                        size: 16,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text('Invoice', style: TextStyle(
                        fontSize: 12,
                      ),)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 90.0),
                        child: Text('Midrand, Gauteng', style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Text('Karibu Techs AI', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 120.0),
                          child: Text('South Africa', style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Expanded(child: Text('Reg: K2018252309', maxLines: 2, style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 100.0),
                          child: Text(
                            '027749779640',
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Expanded(child: Text('57 Carlswald Meadows', style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Specify the color of the border
                  width: 1.0, // Specify the width of the border
                ),
              ),
            ),
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Patient Details', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 100.0),
                        child: Text(
                          'Karibu Techs AI',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(

                            children: [
                              TextSpan(
                                text: 'Full Name: ',
                                style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 12,),
                              ),
                              TextSpan(
                                  text: "$firstname $lastName", style: TextStyle(color: Colors.grey, fontSize: 12,)
                              ),
                            ],
                          ),
                        ),
                        // Text('Full Name: Mabvura Chantelle'),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text.rich(
                              TextSpan(

                                  children: [
                                    TextSpan(
                                      text: 'Invoice Number: ',
                                      style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 12,),
                                    ),
                                    TextSpan(
                                      text: invoiceNumber!,style: TextStyle(color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                    )]

                              ),
                              maxLines: 2,
                            ),


                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(

                            children: [
                              TextSpan(
                                text: 'National ID: ',
                                style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 12,),
                              ),
                              TextSpan(
                                text: nationalID!,style: TextStyle(color: Colors.grey,  fontSize: 12,
                              ),
                              )]

                        ),
                        maxLines: 2,
                      ),

                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 38.0),
                          child: Text.rich(
                            TextSpan(

                                children: [
                                  TextSpan(
                                    text: 'Invoice Date: ',
                                    style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 12,),
                                  ),
                                  TextSpan(
                                    text: invoiceDate!,style: TextStyle(color: Colors.grey,  fontSize: 12,
                                  ),
                                  )]

                            ),
                            maxLines: 2,
                          ),


                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(

                            children: [
                              TextSpan(
                                text: 'Patient ID: ',
                                style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 12,),
                              ),
                              TextSpan(
                                text: patientID,style: TextStyle(color: Colors.grey,  fontSize: 12,
                              ),
                              )]

                        ),
                        maxLines: 2,
                      ),

                      SizedBox(
                        width: 20,
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text.rich(
                            TextSpan(

                                children: [
                                  TextSpan(
                                    text: 'Payment Due: ',
                                    style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 12,),
                                  ),
                                  TextSpan(
                                    text: paymentDue!,style: TextStyle(color: Colors.grey,  fontSize: 12,
                                  ),
                                  )]

                            ),
                            maxLines: 2,
                          ),








                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8,),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 150.0),
                      child: Text.rich(
                        TextSpan(

                            children: [
                              TextSpan(
                                text: 'Amount Due: ',
                                style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 12,),
                              ),
                              TextSpan(
                                text: amountDue!,style: TextStyle(color: Colors.grey,  fontSize: 12,
                              ),
                              )]

                        ),
                        maxLines: 2,
                      ),


                    ),
                  )
                ],

              ),

            ),
          ),

          SizedBox(
            height: 10,
          ),
          SizedBox(

            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Products', style: TextStyle(fontSize: 12))),
                      DataColumn(label: Text('Price', style: TextStyle(fontSize: 12))),
                      DataColumn(label: Text('Tax(%)', style: TextStyle(fontSize: 12))),
                      DataColumn(label: Text('Discount(%)', style: TextStyle(fontSize: 12))),
                      DataColumn(label: Text('Subtotals', style: TextStyle(fontSize: 12))),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text(producrName!, style: TextStyle(fontSize: 12))),
                        DataCell(Text(price!, style: TextStyle(fontSize: 12))),
                        DataCell(Text('$tax %', style: TextStyle(fontSize: 12))),
                        DataCell(Text(discount!, style: TextStyle(fontSize: 12))),
                        DataCell(Text(subTotals!, style: TextStyle(fontSize: 12))),
                      ]),
                    ],
                  ),
                )
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 210.0),
            child: Container(

              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey, // Specify the color of the border
                    width: 1.0, // Specify the width of the border
                  ),
                ),
              ),
              child:  Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: SizedBox(

                  width: 120,
                  child: Row(
                    children: [
                      Text("Subtotal:", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,  fontSize: 12,)),
                      SizedBox(width: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 26.0),
                        child: Text(subTotals!, style: TextStyle(color: Colors.blue,  fontSize: 12,)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 210.0),
            child: Container(

              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey, // Specify the color of the border
                    width: 1.0, // Specify the width of the border
                  ),
                ),
              ),
              child:  Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: SizedBox(

                  width: 120,
                  child: Row(
                    children: [
                      Text("Tax:", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,  fontSize: 12,)),
                      SizedBox(width: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 50.0),
                        child: Text(tax!, style: TextStyle(color: Colors.blue,  fontSize: 12,),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20,),
           Padding(
            padding: EdgeInsets.only(right: 210.0),
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: SizedBox(

                width: 120,
                child: Row(

                  children: [
                    Text("Amount Due:", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,  fontSize: 12,)),
                    SizedBox(width: 10,),
                    Text(amountDue!, style: TextStyle(color: Colors.blue,  fontSize: 12,))
                  ],
                ),
              ),
            ),
          )

        ]),
      ),
    );
  }
}


//

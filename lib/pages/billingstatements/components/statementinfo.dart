import 'package:flutter/material.dart';

class StatementInfo extends StatelessWidget{
  final String? reason;
  final String? date;
  final String? dateCreated;
  final String? paymentReference;
  final String? invoiceNumber;
  final String? department;
  final String? amount;
  final String? paymenttype;

  StatementInfo({
    this.reason,
    this.date,
    this.dateCreated,
    this.paymentReference,
    this.invoiceNumber,
    this.department,
    this.amount,
    this.paymenttype,
  });

  //TODO: Add patient name from db
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      title: Text('Billing Statement Details'),
      actions: [
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Reason:'),

              SizedBox(width: 5,),

              Text(reason!),
            ],
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Date:'),

              SizedBox(width: 5,),

              Text(date!),
            ],
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Department:'),

              SizedBox(width: 5,),

              Text(department!),
            ],
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Payment Reference:'),

              SizedBox(width: 5,),

              Text(paymentReference!),
            ],
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Invoice Number:'),

              SizedBox(width: 5,),

              Text(invoiceNumber!),
            ],
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Amount:'),

              SizedBox(width: 5,),

              Text(amount!),
            ],
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Payment Type:'),

              SizedBox(width: 5,),

              Text(paymenttype!),
            ],
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Date Created:'),

              SizedBox(width: 5,),

              Text(dateCreated!),
            ],
          ),
        ],
      ),
    );
  }

}
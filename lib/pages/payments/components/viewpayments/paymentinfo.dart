import 'package:flutter/material.dart';

class PaymentInfo extends StatelessWidget{
  final String? invoice;
  final String? reference;
  final String? department;
  final String? payment;
  final String? amount;
  final String? date;

  PaymentInfo({
    this.invoice,
    this.reference,
    this.department,
    this.payment,
    this.amount,
    this.date,
});

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Invoice: ${invoice!}'),

        SizedBox(height: 5,),

        Text('Reference: ${reference!}'),

        SizedBox(height: 5,),

        Text('Department: ${department!}'),

        SizedBox(height: 5,),

        Text('Method: ${payment!}'),

        SizedBox(height: 3,),

        Text('Amount: ${amount!}'),

        SizedBox(height: 5,),

        Text('Date: ${date!}')


      ],
    );
  }
}
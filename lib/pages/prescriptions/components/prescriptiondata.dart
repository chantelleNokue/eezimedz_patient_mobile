import 'dart:convert';

import 'package:Eezimedz_Patients/models/prescriptions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PrescriptionData extends StatelessWidget{
  final String? date;
  final String? medication;
  final String? dosage;
  final String? frequency;
  // final String? duration;
  final String? dosageType;
  final String? precautions;


  PrescriptionData({
    this.date,
    this.medication,
    this.dosage,
    this.frequency,
    // this.duration,
    this.dosageType,
    this.precautions,
});

  @override
  Widget build(BuildContext context){
  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(child:
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date:'),
                SizedBox(width: 12,),

                Text(date!),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Medication:'),

                SizedBox(width: 12,),

                Text(medication!)
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dosage:'),

                SizedBox(width: 12,),

                Text(dosage!),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Frequency:'),

                SizedBox(width:12,),

                Text(frequency!)
              ],
            ),

            // SizedBox(height: 10),

            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text('Duration:'),
            //
            //     SizedBox(width: 90,),
            //
            //     Text(duration!)
            //   ],
            // ),

            SizedBox(height: 10,),

            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dosage Type:'),

                SizedBox(width: 25,),

                Text(dosageType!),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Precautions:'),

                SizedBox(width: 12,),

                SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(), scrollDirection: Axis.horizontal, child: Text(precautions!, softWrap: true, overflow: TextOverflow.clip,)),
              ],
            ),


          ],
        ),

        ),

      ),
    ),
  );


  }
}
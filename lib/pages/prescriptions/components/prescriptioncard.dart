import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

import '../models/prescriptions.dart';

class PrescriptionCard extends StatelessWidget{

  final String? prescriptionName;
  final String? prescriptionID;
  final String? date;
  final viewFunction;

  PrescriptionCard({this.prescriptionName, this.prescriptionID, this.date, this.viewFunction});


  // List<PrescriptionDetail> prescriptionss = [];
  // Future getPrescriptions() async {
  //   var url = Uri.parse('http://20.164.214.226:3060/mongo/prescriptions/getPrescriptionByEmail?email=panashebudzinike@gmail.com');
  //
  //   final response = await  http.get(url);
  //   var jsonData = jsonDecode(response.body);
  //
  //   for (var prescript in jsonData['prescriptionDetails']){
  //     final prescriptions = PrescriptionDetail(dosage: prescript['dosage'], dosageType: prescript['dosageType'], id: prescript['id'], date: prescript['date'], medication: prescript['medication'], indication: prescript['indication'], frequency: prescript['frequency']);
  //     prescriptionss.add( prescriptions );
  //   }
  //   print(prescriptionss.length);
  // }

  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 165,
        height: 80,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue.withOpacity(0.05)
        ),
        child: GestureDetector(
          onTap: viewFunction,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('icons/pills.png', height: 35, width: 35,),

              SizedBox(width: 5,),

              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(prescriptionName!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,),),

                  SizedBox(height: 5,),

                  Text(prescriptionID!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10,),),

                  SizedBox(height: 5,),

                  Text(date!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10,),),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
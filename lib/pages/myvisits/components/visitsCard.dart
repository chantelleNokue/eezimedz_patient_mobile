import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

import '../../../models/surgerymodel.dart';


class VisitCard extends StatelessWidget{

  final String? type;
  final String? allergen;
  final String? reaction;
  final viewFunction;

  VisitCard ({this.type, this.allergen, this.reaction, this.viewFunction});


  List<Allergy> allergies = [];
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
        width: 180,
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
              // Image.asset('icons/pills.png', height: 35, width: 35,),

              SizedBox(width: 5,),

              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Type:'),
                  Text('Type:   ${type!}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,),),

                  SizedBox(height: 5,),

                  Text("Allergen: ${allergen!}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10,),),

                  SizedBox(height: 5,),

                  Text("Reaction: ${reaction!}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10,),),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
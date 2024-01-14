import 'package:flutter/material.dart';

class VitalSignsCard extends StatelessWidget{
  final int? systolicBP;
  final int? diastolicBP;
  final int? temperature;
  final int? weight;
  final int? bmi;
  final int? respiratoryRate;
  final int? heartRate;
  final contactfunction;

  VitalSignsCard({
    this.systolicBP,
    this.diastolicBP,
    this.temperature,
    this.weight,
    this.bmi,
    this.heartRate,
    this.respiratoryRate,
    this.contactfunction,
  });


  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 800,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue.withOpacity(0.05),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('systolicBP:'),

                  Text(systolicBP.toString() ),
                ],
              ),

              SizedBox(height: 5,),


              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('diastolicBP:'),

                  Text(diastolicBP.toString()),
                ],
              ),

              SizedBox(height: 5,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('temperature:'),

                  Text(temperature.toString()),
                ],
              ),

              SizedBox(height: 5,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('weight:'),

                  Text(weight.toString()),
                ],
              ),

              SizedBox(height: 5,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('bmi:'),

                  Text(bmi.toString()),
                ],
              ),

              SizedBox(height: 5,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('respiratoryRate:'),

                  Text(respiratoryRate.toString()),
                ],
              ),

              SizedBox(height: 5,),


              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('heartRate'),

                  Text(heartRate.toString()),
                ],
              ),

              // SizedBox(height: 5,),
              //
              //
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(height: 1,),
              //
              //
              //     GestureDetector(
              //       onTap: contactfunction,
              //       child: Container(
              //         height: 30,
              //         width: 210,
              //         padding: EdgeInsets.all(8.0),
              //         decoration: BoxDecoration(
              //           color: Colors.blue,
              //           borderRadius: BorderRadius.circular(16),
              //         ),
              //         child: Center(
              //           child: Text(
              //             'Contact Service Provider',
              //             style: TextStyle(
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              //



            ],

          ),
        ),
      ),
    );
  }
}

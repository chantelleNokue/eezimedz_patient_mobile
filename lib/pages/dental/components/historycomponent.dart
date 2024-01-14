import 'package:flutter/material.dart';

class HistoryComponent extends StatelessWidget{
  final String? procedureDate;
  final String? procedureTime;
  final String? procedure;
  final String? diagnosis;
  final String? treatment;
  final String? center;
  final String? dentist;

  HistoryComponent({
    this.procedureDate,
    this.procedureTime,
    this.procedure,
    this.diagnosis,
    this.treatment,
    this.center,
    this.dentist,
});


  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 800,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue.withOpacity(0.06)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Procedure Date:'),

                Text(procedureDate!, style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),

            SizedBox(height: 5,),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Procedure Time:'),

                Text(procedureTime!, style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),

            SizedBox(height: 5,),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Procedure:'),

                Text(procedure!, style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),

            SizedBox(height: 5,),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Diagnosis:'),

                Text(diagnosis!, style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),

            SizedBox(height: 5,),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Treatment:'),

                Text(treatment!, style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),

            SizedBox(height: 5,),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Procedure Date:'),

                Text(procedureDate!, style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),

            SizedBox(height: 5,),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Center:'),

                Text(procedureDate!, style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),

            SizedBox(height: 5,),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Dentist:'),

                Text(dentist!, style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
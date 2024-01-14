import 'package:flutter/material.dart';


class HospitalComponent extends StatelessWidget{
  final String? reason;
  final String? date;
  final String? hospitalName;
  final String? doctorName;
  final String? medication;

  HospitalComponent({
    this.reason,
    this.date,
    this.hospitalName,
    this.doctorName,
    this.medication,
});


  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: 700,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Hospitalisation Reason:'),

                SizedBox(width: 20,),

                Text(reason!),
              ],
            ),

            SizedBox(height: 6,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Hospitalisation Date:'),

                SizedBox(width: 40,),

                Text(date!),
              ],
            ),

            SizedBox(height: 6,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Hospital Name:'),

                SizedBox(width: 70,),

                Text(hospitalName!),
              ],
            ),

            SizedBox(height: 6,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Doctor Name:'),

                SizedBox(width: 80,),

                Text(doctorName!),
              ],
            ),

            SizedBox(height: 6,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Medication:'),

                SizedBox(width: 100,),

                Text(medication!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
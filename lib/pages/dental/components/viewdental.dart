import 'package:flutter/material.dart';


class ViewDental extends StatelessWidget{
  final String? number;
  final String? date;
  final String? time;
  final String? center;

  ViewDental({
    this.number,
    this.date,
    this.time,
    this.center,
});

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      title: Text('Dental Appointment'),
      actions: [
        TextButton(
          child: Text('Close'),
          onPressed: () => Navigator.pop(context),
        )
      ],
      contentPadding: EdgeInsets.all(8.0),
      content: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Tooth Number:'),

                Text(number!),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Appointment Date:'),

                Text(date!),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Appointment Time:'),

                Text(time!),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Medical Center:'),

                Text(center!),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
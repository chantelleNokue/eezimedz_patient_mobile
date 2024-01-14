import 'package:flutter/material.dart';

class MedicationComponent extends StatelessWidget{
  final String? drug;
  final String? dateStarted;
  final String? dosage;
  final String? purpose;

  MedicationComponent({
    this.drug,
    this.dateStarted,
    this.dosage,
    this.purpose,
});



  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: 800,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.blueGrey.withOpacity(0.3)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'icons/pills.png',
                height: 90,
                width: 80,
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Drug:'),

                    SizedBox(width: 5,),

                    Text(drug!)
                  ],
                ),

                SizedBox(height: 5,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Date Started:'),

                    SizedBox(width: 5,),

                    Text(dateStarted!)
                  ],
                ),

                SizedBox(height: 5,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Dosage:'),

                    SizedBox(width: 5,),

                    Text(dosage!)
                  ],
                ),

                SizedBox(height: 5,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Purpose:'),

                    SizedBox(width: 5,),

                    Text(purpose!, maxLines: 4, overflow: TextOverflow.ellipsis,softWrap: true, ),
                  ],
                ),

                SizedBox(height: 5,),
              ],
            ),

          ],
        ),
      ),

    );
  }
}
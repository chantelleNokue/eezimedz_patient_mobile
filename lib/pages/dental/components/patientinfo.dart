import 'package:flutter/material.dart';

class PatientInfo extends StatelessWidget{
  final String? imagePath;
  final String? name;
  final String? sn;
  final String? gender;
  final String? region;
  final String? smoker;

  PatientInfo({
    this.imagePath,
    this.name,
    this.sn,
    this.gender,
    this.region,
    this.smoker,
});


  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 800,
        padding: EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue.withOpacity(0.06),
        ),
        child: Row(
          children: [
            //Picture Of Patient
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                imagePath!,
                width: 95,
                height: 95,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 20,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Name:'),

                    Text(name!, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),

                SizedBox(height: 5,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('SN/SSN:'),

                    Text(sn!, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),

                SizedBox(height: 5,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Gender:'),

                    Text(gender!, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),

                SizedBox(height: 5,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Region:'),

                    Text(region!, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),

                SizedBox(height: 5,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Smoker:'),

                    Text(smoker!, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
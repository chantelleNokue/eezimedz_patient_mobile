import 'package:flutter/material.dart';


class ResultCard extends StatelessWidget{
  final String? testName;
  final String? doctorName;
  final String? labName;
  final viewFunction;

  ResultCard({
    this.testName,
    this.doctorName,
    this.labName,
    this.viewFunction,
});


  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 650,
        height: 135,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue.withOpacity(0.12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Image.asset('icons/resultcard.png')),

            SizedBox(width: 40,),

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(testName!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),),

                SizedBox(height: 3,),

                Text(doctorName!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),

                SizedBox(height: 3,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, size: 16,),

                    Text(labName!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                  ],
                ),

                SizedBox(height: 3,),

                ElevatedButton(
                  child: Text('view'),
                  onPressed: viewFunction,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
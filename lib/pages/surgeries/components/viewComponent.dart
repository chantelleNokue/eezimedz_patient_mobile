import 'package:flutter/material.dart';

class ViewComponent extends StatelessWidget{
  final String? doctorName;
  final String? surgeryDate;
  final String? surgeryType;
  final String? surgeryVenue;
  final String? description;

  ViewComponent({this.doctorName, this.surgeryDate, this.surgeryType, this.surgeryVenue, this.description});

  @override
  Widget build(BuildContext contex){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 600,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.withOpacity(0.08),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'icons/viewsurgery.png',
              width: 50,
              height: 80,
            ),


            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Surgery Type:'),
                    Text(surgeryType!, style: TextStyle(fontSize: 13),),
                  ],
                ),

                SizedBox(height: 5,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Doctor Name:'),
                    Text(doctorName!, style: TextStyle(fontSize: 13),),
                  ],
                ),

                SizedBox(height: 5,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Surgery Date:'),
                    Text(surgeryDate!, style: TextStyle(fontSize: 13),),
                  ],
                ),

                SizedBox(height: 5,),

               Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Text('Medical Center:'),
                   Text(surgeryVenue!, style: TextStyle(fontSize: 13),),
                 ],
               ),

                SizedBox(height: 5,),


                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Description:'),
                    Text(description!, style: TextStyle(fontSize: 13,), maxLines: 3,),
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
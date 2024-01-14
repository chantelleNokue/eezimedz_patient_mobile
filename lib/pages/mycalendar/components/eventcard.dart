import 'package:flutter/material.dart';


class EventCard extends StatelessWidget{
  final String? imageUrl;
  final String? title;
  final DateTime? date;
  final DateTime? time;
  final Color? backgroundColor;
  final String? name;

  EventCard({
    this.imageUrl,
    this.title,
    this.date,
    this.time,
    this.backgroundColor,
    this.name,
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
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),

            SizedBox(height: 10,),

            Text(date!.toString(), style: TextStyle(fontSize: 14),),

            SizedBox(height: 10,),

            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Image.asset('icons/patient'),
                  maxRadius: 50,
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(time!.toString()),

                    SizedBox(height: 3,),

                    Text(name!),
                  ],
                ),

                Icon(Icons.person, size: 20,),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
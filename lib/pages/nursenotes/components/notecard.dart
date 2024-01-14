import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class NoteCard extends StatelessWidget{
  final String? noteTitle;
  final String? noteBody;
  final String? date;
  final String? doctor;
  final function;

  NoteCard({
    this.noteTitle,
    this.noteBody,
    this.date,
    this.doctor,
    this.function,
});

  @override
  Widget build(BuildContext contex){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: EdgeInsets.all(13),
        width: 700,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteTitle!, 
              style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
                color: Colors.blue
            ),),
            
            SizedBox(height: 10,),

            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FaIcon(FontAwesomeIcons.userDoctor, size: 10,),

                SizedBox(width: 10,),

                Text(
                    doctor!,
                    style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ))
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FaIcon(FontAwesomeIcons.calendar, size: 10,),

                SizedBox(width: 5,),

                Text(
                    date!,
                    style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ))
              ],
            ),

            SizedBox(height: 5,),
            
            Text(
              noteBody!,
              maxLines: 4,
              style: TextStyle(
                fontSize: 12,
              ),
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 0,),

                ElevatedButton(
                  child: Text('View'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: function,
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewComponent extends StatelessWidget{
  final String? noteBody;
  final String? doctorName;
  final String? date;
  final String? time;

  ViewComponent({
    this.noteBody,
    this.doctorName,
    this.date,
    this.time,
  });


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FaIcon(FontAwesomeIcons.userDoctor, size: 15,),

                  SizedBox(width: 5,),

                  Text(
                      doctorName!,
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
                  FaIcon(FontAwesomeIcons.clock, size: 15,),

                  SizedBox(width: 5,),

                  Text(
                      time!,
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
                  FaIcon(FontAwesomeIcons.calendar, size: 15,),

                  SizedBox(width: 5,),

                  Text(
                      date!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ))
                ],
              ),

              SizedBox(height: 10,),


              Text(
                noteBody!,
                maxLines: 10,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),

            ],
      ),
    );
  }
}
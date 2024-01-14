import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';

class Educate extends StatefulWidget {
  const Educate({super.key});

  @override
  State<Educate> createState() => _EducateState();
}

class _EducateState extends State<Educate> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 80,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20, // Set the desired radius of the circular image
                    backgroundImage: AssetImage('icons/doctor2.jpg'),
                  ),
                  Spacer(),
                  Text('LMS', style: TextStyle(fontWeight: FontWeight.bold),),
                  Spacer(),
              Icon(
                  Icons.alarm,
                  size: 20,
                ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: HorizontalWeekCalendar(
                onDateChange: (date) {
                  // setState(() {
                  //   selectedDate = date;
                  // });
                },
              ),
            ),

            SizedBox(height: 20,),
            Container(
              child: Row(
                children: [
                  Text('Schedules', style: TextStyle(fontSize: 18),),
                  Spacer(),
                  Text('View all',),
                ],
              ),


            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 100,
                  // color: Colors.lightBlue,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.lock_clock, size: 60, color: Colors.white,),

                ),
SizedBox(width: 6,),
                Container(
                  height: 80,
                  width: 230,
                  // color: Colors.lightBlue,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 18.0),
                        child: Text('Agronomy and Horticulture', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only( right: 120),
                        child: Text('12;35 - 13:35', style: TextStyle(fontSize: 12,  ),),
                      )
                    ],
                  ),

                )

              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 80,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes the position of the shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, right: 120.0),
                    child: Text(
                      'Landscape Architecture',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: Text(
                      '13:40 - 15:00',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 80,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes the position of the shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, right: 160.0),
                    child: Text(
                      'Plant Protection',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 198),
                    child: Text(
                      '15:00 - 17:00',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Row(
                children: [
                  Text('Courses', style: TextStyle(fontSize: 18),),
                  Spacer(),
                  Text('View all',),
                ],
              ),


            ),
            SizedBox(height: 10,),
            Container(
              height: 44,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                // borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes the position of the shadow
                  ),
                ],
                border: Border(
                  left: BorderSide(
                    color: Colors.blueAccent,
                    width: 3.0,
                  ),
                ),
              ),
              child:
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0,left: 12),
                    child: Text(
                      'Plant Protection',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ),
                    ),
                  ),


            ),
            SizedBox(height: 10,),
            Container(
              height: 44,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                // borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes the position of the shadow
                  ),
                ],
                border: Border(
                  left: BorderSide(
                    color: Colors.blueAccent,
                    width: 3.0,
                  ),
                ),
              ),
              child:
              Padding(
                padding: const EdgeInsets.only(top: 12.0,left: 12),
                child: Text(
                  'Vertinary Science',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ),
                ),
              ),


            ),
            SizedBox(height: 10,),
            Container(
              height: 44,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                // borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes the position of the shadow
                  ),
                ],
                border: Border(
                  left: BorderSide(
                    color: Colors.blueAccent,
                    width: 3.0,
                  ),
                ),
              ),
              child:
              Padding(
                padding: const EdgeInsets.only(top: 12.0,left: 12),
                child: Text(
                  'Mathematics and Natural Sciences',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ),
                ),
              ),


            ),
            SizedBox(height: 10,),
            Container(
              height: 44,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                // borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes the position of the shadow
                  ),
                ],
                border: Border(
                  left: BorderSide(
                    color: Colors.blueAccent,
                    width: 3.0,
                  ),
                ),
              ),
              child:
              Padding(
                padding: const EdgeInsets.only(top: 12.0,left: 12),
                child: Text(
                  'Economics and Management',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ),
                ),
              ),


            ),
          ],
        ),
      ),
    );
  }
}

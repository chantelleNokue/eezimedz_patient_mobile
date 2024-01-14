import 'dart:ffi';

import 'package:Eezimedz_Patients/pages/mycalendar/components/calander3.dart';
import 'package:Eezimedz_Patients/pages/mycalendar/components/calender2.dart';
import 'package:flutter/material.dart';

import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import '../profile.dart';
import 'components/calendercar.dart';
import 'components/myCalender1.dart';




class MyCalendar extends StatefulWidget{
  const MyCalendar({Key ? key}): super(key : key);

  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar>{
  //variables
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();


  //controllers
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('My Calendar'),
        automaticallyImplyLeading: false,
        leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu_sharp, color: Colors.white,)
              );
            }
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile())),
            icon: Icon(Icons.person),
          ),
        ],
      ),

        drawer: DrawerClass(),


      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'My Calendar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),

            SizedBox(height: 20,),

            Flexible(
              fit: FlexFit.loose,
                child: MyAppCalenderrrrr()
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: NavBar(),
    );
  }
}
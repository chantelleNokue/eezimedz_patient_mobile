import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../components/bottomnavigationbar.dart';
import '../../components/drawercomponent.dart';
import '../../profile.dart';
import '../../components/successdialog.dart';
import '../doctors.dart';

class BookDoctor extends StatefulWidget{
  final String? doctorName;

  const BookDoctor({Key ? key, this.doctorName}): super(key : key);

  State<BookDoctor> createState() => _BookDoctorState();
}

class _BookDoctorState extends State<BookDoctor>{
  DateTime focusDay = DateTime.now();
  final symptomsController = TextEditingController();

  TimeOfDay bookingTime = TimeOfDay.now();

  void selectDay(DateTime day, DateTime focusedDay){
    setState(() {
      focusDay = day;
    });

  }

  //success dialog
  void _showSuccessDialog(context) => showDialog(
    context: context,
    builder: (context) => SuccessDialog(toClass: Doctors()),
  );


  //initial elevation
  double _elevation = 2.0;
  double _elevation2 = 2.0;

  // Function to update the elevation value
  void changeElevation(double newElevation) {
    setState(() {
      _elevation2 = newElevation;
    });
  }





  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Home Page'),
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
          padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Text('Schedule a booking for Doctor ${widget.doctorName!}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),

                SizedBox(height: 20,),

                Text('Pick A date', style: TextStyle(fontSize: 15),),

                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(12),

                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue.withOpacity(0.09)
                    ),
                    child: TableCalendar(
                      locale: 'en_US',
                        rowHeight: 40,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                        availableGestures: AvailableGestures.all,
                        selectedDayPredicate: (day) => isSameDay(day, focusDay),
                        focusedDay: focusDay,
                        firstDay: DateTime.utc(2001,01,01),
                        lastDay: DateTime.utc(2040,12,31),
                         onDaySelected: selectDay,
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                Text('Select a time slot', style: TextStyle(fontSize: 15),),

               SizedBox(height: 15,),

                //booking time
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black12,
                    )
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('8:00 am')),
                            ),
                          ),

                          SizedBox(width: 25,),

                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('8:30 am')),
                            ),
                          ),

                          SizedBox(width: 25,),

                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('9:00 am'),),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('9:30 am')),
                            ),
                          ),

                          SizedBox(width: 25,),

                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('10:00 am')),
                            ),
                          ),

                          SizedBox(width: 25,),

                          Material(
                            elevation: 0,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('11:00 am'),),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Material(
                            elevation: 0,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('11:30 am')),
                            ),
                          ),

                          SizedBox(width: 25,),

                          Material(
                            elevation: 0,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08),

                              ),
                              child: Center(child: Text('12:00 pm')),
                            ),
                          ),

                          SizedBox(width: 25,),

                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('12:30 pm'),),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //TODO: fix this later
                          GestureDetector(
                            onTap:() => changeElevation(0.0),
                            child: Material(
                              elevation: _elevation,
                              borderRadius: BorderRadius.circular(19),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                height: 45,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                    color: Colors.blue.withOpacity(0.08)
                                ),
                                child: Center(child: Text('13:00 pm')),
                              ),
                            ),
                          ),

                          SizedBox(width: 25,),

                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)

                              ),
                              child: Center(child: Text('13:30 pm')),
                            ),
                          ),

                          SizedBox(width: 25,),

                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('14:00 pm'),),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('14:30 pm')),
                            ),
                          ),

                          SizedBox(width: 25,),

                          GestureDetector(
                            onTap:() => changeElevation(0.0),
                            child: Material(
                              elevation: _elevation2,
                              borderRadius: BorderRadius.circular(19),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                height: 45,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                    color: Colors.blue.withOpacity(0.08)

                                ),
                                child: Center(child: Text('15:00 pm')),
                              ),
                            ),
                          ),

                          SizedBox(width: 25,),

                          GestureDetector(
                            onTap:() => changeElevation(0.0),
                            child: Material(
                              elevation: _elevation2,
                              borderRadius: BorderRadius.circular(19),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                height: 45,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                    color: Colors.blue.withOpacity(0.08)
                                ),
                                child: Center(child: Text('15:30 pm'),),
                              ),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('16:00 pm')),
                            ),
                          ),

                          SizedBox(width: 25,),

                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('16:30 pm')),
                            ),
                          ),

                          SizedBox(width: 25,),

                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                  color: Colors.blue.withOpacity(0.08)
                              ),
                              child: Center(child: Text('17:00 pm'),),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: 20,),


                Container(
                  width: 800,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: TextFormField(
                    controller: symptomsController,
                    maxLines: 7,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1.0
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      alignLabelWithHint: true,
                      label: Text('Optional: describe your symptoms '),
                      hintText: 'Optional: describe your symptoms',
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                
                ElevatedButton(
                  onPressed: () => _showSuccessDialog(context),
                  child: Text('Book Doctor'),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(300, 60),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),

                    )
                  ),
                ),






              ],
            )
        ),
      ),

      bottomNavigationBar: NavBar(),
    );
  }
}
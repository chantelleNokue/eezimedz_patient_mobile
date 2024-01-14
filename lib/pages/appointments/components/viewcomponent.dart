import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_x/flutter_dropdown_x.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../components/bottomnavigationbar.dart';
import '../../components/listitemsclass.dart';
import 'rescheduledialog.dart';
import 'failuredialog.dart';

class ViewComponent extends StatefulWidget {
  final String? firstname;
  final String? lastname;
  final String? doctor;
  final String? service;
  final String? department;
  final String? procedure;
  final String? date;
  final String? time;
  final String? appointmentid;

  ViewComponent({
    Key? key,
    required this.firstname,
    required this.lastname,
    required this.doctor,
    required this.service,
    required this.department,
    required this.procedure,
    required this.date,
    required this.time,
    required this.appointmentid,
  }) : super(key: key);

  State<ViewComponent> createState() => _ViewComponentState();
}

class _ViewComponentState extends State<ViewComponent> {
  //reschedule api call
  Future<int?> rescheduleAppointment() async {
    print(widget.appointmentid);
    try {
      var url = Uri.parse(
          'http://20.164.214.226:3060/mongo/bookings/rescheduleBooking');

      final prevAppointmentSchedule = {
        "preferred_appointment_date": widget.date,
        "preferred_appointment_time": widget.time,
        "department": widget.department,
        "procedure": widget.procedure,
        "applied_service": widget.service,
        "serviceProvider": widget.doctor,
      };

      final appointmentSchedule = {
        "preferred_appointment_date":
            DateFormat('yyyy-MM-dd').format(appointmentDate),
        "preferred_appointment_time": appointmentTime.format(context),
        "department": departmentVariable,
        "procedure": procedureController.text,
        "applied_service": appliedServiceController.text,

      };
      // Print the JSON body
      final requestBody = {
        "appointmentid": widget.appointmentid,
        "appointmentSchedule": appointmentSchedule,
        "prevAppointmentSchedule": prevAppointmentSchedule,
      };
      print('Request body: $requestBody');

      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      var rescheduleSuccess = false;
      if (response.statusCode == 200) {
        print('Reschedule Successful');
        print('Eezimeds reschedule: ${response.body}');

        setState(() {
          rescheduleSuccess = true;
        });
      }

      if (rescheduleSuccess == true) {
        _showSuccessDialog(context);
      } else {
        _showFailureDialog(context);
      }
    } catch (e) {
      print('Error message: $e');
      _showFailureDialog(context);
    }
  }

//controllers
  final procedureController = TextEditingController();
  final appliedServiceController = TextEditingController();

  //variables
  String? departmentVariable;
  String? procedureVariable;
  String? appliedServiceVariable;
  String? doctorVariable;
  //date and time items
  DateTime appointmentDate = DateTime.now();
  TimeOfDay appointmentTime = TimeOfDay.now();
  // handle reschedule
  // handleReschedule() async{
  //   try{
  //     var rescheduleSuccess = false;
  //     final statusCode = await rescheduleAppointment(
  //         appointmentDate.toString(),
  //         appointmentTime.format(context),
  //         departmentVariable.toString(),
  //         procedureController.text,
  //         appliedServiceController.text,
  //         // widget.service,
  //         widget.appointmentid.toString()
  //     );
  //
  //
  //
  //     if(statusCode == 200){
  //       setState(() {
  //         rescheduleSuccess = true;
  //       });
  //     }
  //
  //     if(rescheduleSuccess == true){
  //       _showSuccessDialog(context);
  //     }else{
  //       _showFailureDialog(context);
  //     }
  //
  //   }catch(e){
  //     print('Error message: $e');
  //     _showFailureDialog(context);
  //   }
  // }

  //dialogs
  void _showSuccessDialog(context) => showDialog(
        context: context,
        builder: (context) => RescheduleDialog(),
      );

  void _showFailureDialog(context) => showDialog(
        context: context,
        builder: (context) => FailureDialog(),
      );

  Widget _rescheduleForm() => Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Department'),
              DropDownField(
                value: departmentVariable,
                hintText: 'Select Department',
                dataSource: ListItems().departmentOptions,
                onChanged: (value) {
                  setState(() {
                    departmentVariable = value;
                  });
                },
                textField: 'label',
                valueField: 'value',
              ),
              // Text(departmentVariable.toString()),
              SizedBox(
                height: 5,
              ),

              Text('Procedure'),
              TextFormField(
                controller: procedureController,
                decoration: InputDecoration(
                  labelText: 'Procedure',
                  hintText: 'Procedure',
                  suffixIcon: procedureController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => procedureController.clear(),
                        ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  alignLabelWithHint: true,
                ),
                onSaved: (value) => setState(() => procedureVariable = value),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'procedure is required';
                  } else {
                    return null;
                  }
                },
              ),

              SizedBox(
                height: 5,
              ),

              Text('Applied Service'),
              TextFormField(
                controller: appliedServiceController,
                decoration: InputDecoration(
                  labelText: 'Applied Service',
                  hintText: 'Applied Service',
                  suffixIcon: appliedServiceController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => appliedServiceController.clear(),
                        ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  alignLabelWithHint: true,
                ),
                onSaved: (value) =>
                    setState(() => appliedServiceVariable = value),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'procedure is required';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5,
              ),

              Text('Preferred Date'),
              Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.black45,
                          width: 2,
                        )),
                    child: Center(
                      child: Text(
                        "${appointmentDate.year} - ${appointmentDate.month} - ${appointmentDate.day}",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MaterialButton(
                    child: Text('Choose Date'),
                    color: Colors.blue.withOpacity(0.4),
                    hoverColor: Colors.lightBlueAccent,
                    elevation: 0,
                    onPressed: () async {
                      final DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: appointmentDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000),
                      );

                      if (dateTime != null) {
                        setState(() {
                          appointmentDate = dateTime;
                        });
                      }
                    },
                  ),
                ],
              ),

              SizedBox(
                height: 5,
              ),

              Text('Preferred Time'),
              SizedBox(
                height: 5,
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.black45,
                          width: 2,
                        )),
                    child: Center(
                      child: Text(
                        "${appointmentTime.hour}: ${appointmentTime.minute.toString().padLeft(2, '0')}",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MaterialButton(
                    child: Text('Choose Time'),
                    color: Colors.blue.withOpacity(0.4),
                    hoverColor: Colors.lightBlueAccent,
                    elevation: 0,
                    onPressed: () async {
                      final TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: appointmentTime,
                        initialEntryMode: TimePickerEntryMode.dial,
                      );

                      if (time != null) {
                        setState(() {
                          appointmentTime = time;
                        });
                      }
                    },
                  ),
                ],
              ),

              SizedBox(
                height: 5,
              ),

              // Text('Preferred Doctor'),
              // DropDownField(
              //   value: doctorVariable,
              //   hintText: 'Select Doctor',
              //   dataSource: ListItems().doctorOptions,
              //   onChanged: (value){
              //     setState(() {
              //       doctorVariable = value;
              //     });
              //   },
              //   textField: 'label',
              //   valueField: 'value',
              // ),
              //
              // SizedBox(height: 5,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.redAccent,
                      ),
                      child: Text('Cancel'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.green,
                      ),
                      onPressed: rescheduleAppointment,
                      child: Text('Okay'),
                    ),
                  ]),
            ],
          ),
        ),
      );

  //bottom modal sheet
  void _modalSheet(context) => showModalBottomSheet(
        context: context,
        enableDrag: true,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: MediaQuery.of(context).size.height * 3,
                child: _rescheduleForm()),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'Appointment Details',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 350,
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                  width: 2.0, color: Colors.black54)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('First Name:'),
                                  Text(
                                    widget.firstname!,
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                  width: 2.0, color: Colors.black54)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                                child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Last Name:'),
                                Text(
                                  widget.lastname!,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )),
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                  width: 2.0, color: Colors.black54)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                                child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Doctor:'),
                                Text(
                                  widget.doctor!,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )),
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                  width: 2.0, color: Colors.black54)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Applied Service:'),
                                  Text(
                                    widget.service!,
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                  width: 2.0, color: Colors.black54)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                                child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Department:'),
                                Text(
                                  widget.department!,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )),
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                  width: 2.0, color: Colors.black54)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Procedure:'),
                                  Text(
                                    widget.procedure!,
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                  width: 2.0, color: Colors.black54)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Date:'),
                                  Text(
                                    widget.date!,
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                  width: 2.0, color: Colors.black54)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Time:'),
                                  Text(
                                    widget.time!,
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.blue,
                    minimumSize: Size(350, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    )),
                onPressed: () => _modalSheet(context),
                child: Text('Reschedule'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

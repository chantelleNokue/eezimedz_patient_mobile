import 'dart:convert';

import 'package:Eezimedz_Patients/models/patientmodel.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';


import '../../../services/patient/patientservice.dart';
import '../../appointments/components/failuredialog.dart';
import '../../appointments/components/successdialog.dart';

class CreateSchedule extends StatefulWidget {
  final String? imagePath;
  final String? patientsName;
  final String? patientsLastName;
  final String? dateOfBirth;
  final String? patientsNumber;
  final String? patientId;
  final String? patientEmail;
  final String? gender;
  final String? admmisionReason;
  final String? patientNationalId;

  final String? doctorName;
  final String? doctorId;
  final String? doctorSpecialization;
  final String? doctorContactInformation;
  const CreateSchedule(
      {super.key,
        this.patientsName,
        this.imagePath,
        this.patientId,
        this.patientEmail,
        this.patientsLastName,
        this.dateOfBirth,
        this.patientsNumber,
        this.gender,
        this.admmisionReason,
        this.patientNationalId,
        this.doctorName,
        this.doctorId,
        this.doctorSpecialization,
        this.doctorContactInformation});

  @override
  State<CreateSchedule> createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<CreateSchedule> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  TimeOfDay appointmentTime = TimeOfDay.now();



  // final patientService = Provider.of<PatientService>(context, listen: false);
  // final patientConstants = PatientConstants(patientService);

  List<MultiSelectItem<String>> _daysOfWeek = [
    MultiSelectItem<String>('Monday', 'Monday'),
    MultiSelectItem<String>('Tuesday', 'Tuesday'),
    MultiSelectItem<String>('Wednesday', 'Wednesday'),
    MultiSelectItem<String>('Thursday', 'Thursday'),
    MultiSelectItem<String>('Friday', 'Friday'),
    MultiSelectItem<String>('Saturday', 'Saturday'),
    MultiSelectItem<String>('Sunday', 'Sunday'),
  ];
  List<String> _selectedDays = [];

  bool ShowCircles = false;
  String Diagnosiss = "";
  String Dosage ='';
  String PrescriptionType = "";
  String SelectDrug = "";
  bool rescheduleSuccess = false;
  //patient booking api call
  Future<int?> PrescribeFunction(
      // String phonenumber,
      // String patientid,
      // String patientContactInformation,
      // String doctorContactInformation,
      // String appointmentid,
      // String doctorName,
      String dosage,

      String medicineName,
      String scheduleStartDate,
      String scheduleEndDate,
      String timeOfAdministration,
      String administrationFrequency,
      String instructions,
      String daysOfWeek,
      // String dateofbirth,
      // String email,
      // String gender,
      // String prescriptionDate,
      // String prescriptionCategory,
      // String diagnosis,
      // String prescriptionType,
      ) async {

    if (Diagnosiss == null || Diagnosiss == null || Diagnosiss == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Fill in the missing field!'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else {
      try {
        var url =
        Uri.parse('http://20.164.214.226:3060/mongo/medicine-schedule');
        print(widget.patientId);
        print('name');
        final response = await http.post(
          url,
          headers: {'content-type': 'application/json'},
          body: jsonEncode({

          "patientId": widget.patientId,
          "patientName": widget.patientsName,
          "medicineName": medicineName,
          "dosage": dosage,
          "scheduleStartDate": startDate.toString(),
          "scheduleEndDate": endDate.toString(),
          "timeOfAdministration": timeOfAdministration,
          "administrationFrequency": administrationFrequency,
          "daysOfWeek": _selectedDays,
          "instructions": instructions,
          "reminderPreference": "email",
          "scheduleType":"self"

          }),
        );

        var rescheduleSuccess = false;
        if (response.statusCode == 200) {
          print('Reschedule Successful');
          print('Eezimeds reschedule: ${response.body}');
          SuccessDialog();
          setState(() {
            rescheduleSuccess = true;
          });
        }

        if (rescheduleSuccess == true) {
          SuccessDialog();
        } else {
          _showFailureDialog(context);
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  final indicationController = TextEditingController();
  final dosageController = TextEditingController();
  final frequencyController = TextEditingController();
  final notesController = TextEditingController();
  final drugNameController = TextEditingController();
  final administrationFrequencyController = TextEditingController();
  final timeOfAdministrationController = TextEditingController();
  final instructionController= TextEditingController();
  final controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedFile;
  bool isloading = false;
  File? fileToDispay;

  void PickFile() async {
    try {
      setState(() {
        isloading = true;
      });

      result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);
      if (result != null) {
        _fileName = result?.files.first.name;
        pickedFile = result?.files.first;
        fileToDispay = File(pickedFile!.path.toString());

        print("File Name: ${_fileName}");
      }

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  String groupValue = "Male";
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // void _showSuccessDialog(context) => showDialog(
  //   context: context,
  //   builder: (context) => SuccessDialog(
  //     content: "Prescribe",
  //   ),
  // );

  void _showFailureDialog(context) => showDialog(
    context: context,
    builder: (context) => FailureDialog(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.blue, // Set the color of the back button
        ),
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Eezimedz',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Text(
                  'Create Medical Schedule',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight:
                    FontWeight.w600, // Increase the font size as desired
                    color: Colors.black, // Change the color to white
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 2,
                width: double.infinity,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Is this an external prescription?",
              //         style:
              //         TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              //       ),
              //       SizedBox(
              //         height: 5,
              //       ),
              //       Container(
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           border: Border.all(
              //             color: Colors.blue.withOpacity(0.5),
              //           ),
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 12),
              //           child: DropdownButtonFormField<String>(
              //             decoration: InputDecoration(
              //
              //               hintStyle: TextStyle(color: Colors.blue),
              //               enabledBorder: UnderlineInputBorder(
              //                 borderSide: BorderSide.none,
              //               ),
              //             ),
              //             items: <String>[
              //               'Yes',
              //               'No',
              //
              //             ].map<DropdownMenuItem<String>>((String value) {
              //               return DropdownMenuItem<String>(
              //                 value: value,
              //                 child: Text(
              //                   value,
              //                   style: TextStyle(color: Colors.blue),
              //                 ),
              //               );
              //             }).toList(),
              //             onChanged: (String? value) {
              //               // Handle value selection
              //               if (value != null) {
              //                 PrescriptionType = value;
              //                 print(PrescriptionType);
              //               }
              //             },
              //             icon: Icon(
              //               Icons.arrow_drop_down,
              //               color: Colors.blue,
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Text(
              //         "Have you purchased the medicine?",
              //         style:
              //         TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              //       ),
              //       SizedBox(
              //         height: 5,
              //       ),
              //       Container(
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           border: Border.all(
              //             color: Colors.blue.withOpacity(0.5),
              //           ),
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 12),
              //           child: DropdownButtonFormField<String>(
              //             decoration: InputDecoration(
              //               hintStyle: TextStyle(color: Colors.blue),
              //               enabledBorder: UnderlineInputBorder(
              //                 borderSide: BorderSide.none,
              //               ),
              //             ),
              //             items: <String>[
              //               'Yes',
              //               'No',
              //
              //             ].map<DropdownMenuItem<String>>((String value) {
              //               return DropdownMenuItem<String>(
              //                 value: value,
              //                 child: Text(
              //                   value,
              //                   style: TextStyle(color: Colors.blue),
              //                 ),
              //               );
              //             }).toList(),
              //             onChanged: (String? value) {
              //               // Handle value selection
              //               if (value != null) {
              //                 Diagnosiss = value;
              //                 print(Diagnosiss);
              //               }
              //             },
              //             icon: Icon(
              //               Icons.arrow_drop_down,
              //               color: Colors.blue,
              //             ),
              //           ),
              //         ),
              //       ),
              //
              //     ],
              //   ),
              // ),



              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    // SizedBox(
                    //   height: 5,
                    // ),
                    Text(
                      "Drug Name",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: drugNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter drug name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Dosage",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: dosageController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a dosage';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),


                    SizedBox(height: 5,),
                    Text('Start Date', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child:
                          Text(
                            "${startDate.year} - ${startDate.month} - ${startDate.day}",
                          ),),
                        ),
                        SizedBox(height: 5,),
                        MaterialButton(
                          child: Text('Choose Start Date'),
                          color: Colors.blue.withOpacity(0.4),
                          hoverColor: Colors.lightBlueAccent,
                          elevation: 0,
                          onPressed: () async{
                            final DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: startDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                            );

                            if(dateTime != null){
                              setState(() {
                                startDate = dateTime;
                              });
                            }
                          },
                        ),
                      ],
                    ),


                    SizedBox(height: 5,),
                    Text('End Date', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child:
                          Text(
                            "${endDate.year} - ${endDate.month} - ${endDate.day}",
                          ),),
                        ),
                        SizedBox(height: 5,),
                        MaterialButton(
                          child: Text('Choose End Date'),
                          color: Colors.blue.withOpacity(0.4),
                          hoverColor: Colors.lightBlueAccent,
                          elevation: 0,
                          onPressed: () async{
                            final DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: endDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                            );

                            if(dateTime != null){
                              setState(() {
                                endDate = dateTime;
                              });
                            }
                          },
                        ),
                      ],
                    ),




                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Timing Of Administration",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: timeOfAdministrationController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a dosage';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Daily Frequency",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: administrationFrequencyController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a dosage';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),


                    Text(
                      "Weekly Schedule",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: MultiSelectDialogField<String>(
                          dialogHeight: 400.0,
                          items: _daysOfWeek,
                          title: Text('Select Days of the Week'),
                          selectedItemsTextStyle: TextStyle(color: Colors.blue),
                          buttonText: Text('Select Days'),
                          onConfirm: (selectedItems) {
                            setState(() {
                              _selectedDays = selectedItems;
                            });
                          },
                          initialValue: _selectedDays,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Instruction",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: instructionController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter an instruction';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 8),


                  ],
                ),
              ),
              ListTile(
                trailing: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // All fields are valid, proceed with prescription
                      print('Yes');
                      PrescribeFunction(
                        dosageController.text,
                          drugNameController.text,

                          startDate.toString(),
                          endDate.toString(),
                          timeOfAdministrationController.text,
                          administrationFrequencyController.text,
                        instructionController.text,
                          _daysOfWeek.toString(),



                          );
                    } else {
                      // At least one field is empty, show error message
                      print('Empty fields');
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Create',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
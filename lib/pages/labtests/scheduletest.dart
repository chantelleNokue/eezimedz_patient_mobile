import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dropdown_x/flutter_dropdown_x.dart';

import '../profile.dart';
import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import '../components/successdialog.dart';
import 'labtestsmenu.dart';
import '../components/listitemsclass.dart';
import '../../services/patient/patientservice.dart';
import '../../models/patientmodel.dart';
import 'components/failuredialog.dart';

class ScheduleTest extends StatefulWidget{
  const ScheduleTest({Key ? key}): super(key : key);

  State<ScheduleTest> createState() => _ScheduleTestState();
}

class _ScheduleTestState extends State<ScheduleTest>{
  //success dialog
  //success dialog
  void _showSuccessDialog(context) => showDialog(
    context: context,
    builder: (context) => SuccessDialog(toClass: LabTestsMenu()),
  );

  //failure dialog
  void _showFailureDialog(context) => showDialog(
    context: context,
    builder: (context) => FailureDialog(),
  );
  //user
  final user = FirebaseAuth.instance.currentUser!;

  //case number
  String generateCaseNumber() {
    final random = Random();
    final randomNumbers = List.generate(4, (_) => random.nextInt(10)); // Generates four random numbers (0-9)
    final caseNumber = 'CASE${randomNumbers.join()}'; // Join the numbers into a single string
    return caseNumber;
  }

  //test id
  String generateTestId() {
    final random = Random();
    final randomNumbers = List.generate(5, (_) => random.nextInt(10)); // Generates five random numbers (0-9)
    final result = 'T${randomNumbers.join()}'; // Join the numbers into a single string with the "T" prefix
    return result;
  }



  //schedule lab test
  Future<int?> scheduleTest(
      String patientId,
      String patientName,
      String patientLastname,
      String dateofbirth,
      String gender,
      String nationalid,
      ) async{
    try{
      var url = Uri.parse('http://20.164.214.226:3060/mongo/labtests/create');

      final response = await http.post(
        url,
        headers:  {'content-type': 'application/json'},
        body: jsonEncode({
          "patientContactInformation": user.email,
          "patientId": patientId,
          "patientName": patientName,
          "last_name": patientLastname,
          "patientDateOfBirth": dateofbirth,
          "patientGender": gender,
          "patientNationalId": nationalid,
          "status": "Pending",
          "doctorId": "D67890",
          "doctorName": doctornameController.text,
          "doctorSpecialization": [
            "Cardiology",
            "Internal Medicine"
          ],
          "doctorContactInformation": emailController.text,
          "testId": generateTestId(),
          "tests": [
            testnameController.text,
            "X-Ray"
          ],
          "testName": testnameController.text,
          "medicalCenter": medicalcenter,
          "date": testDate.toString(),
          "time": testTime.toString(),
          "labName": labController.text,
          "id": "L12345",
          "casenumber": generateCaseNumber(),
          "siteid": "AAD12345WQ"
        }),
      );

      if(response.statusCode == 200){
        print('Test scheduled successfully');
        print(response.statusCode);
        return response.statusCode;
      }else{
        print('Test schedule failed');
      }

    }catch(e){
      print('Error scheduling test $e');
    }
  }

  //controllers
  final doctornameController = TextEditingController();
  final emailController = TextEditingController();
  final labController = TextEditingController();
  final requirementsController = TextEditingController();
  final testnameController = TextEditingController();

  //variables
  DateTime testDate = DateTime.now();
  TimeOfDay testTime = TimeOfDay.now();
  String? medicalcenter;


  //widgets
  //TODO: Make sure to get details from patient object
  Widget buildPatientDetails() => Consumer<PatientService>(
    builder: (context, PatientService, _){
      PatientModel? patient = PatientService.patient;
      if(patient == null){
        return Center(child: CircularProgressIndicator(),);
      }else{
        return Column(
          children: <Widget>[

            Text('First Name'),
            Container(
              width: 350,
              height: 60,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                        width: 2.0,
                        color: Colors.black54
                    )
                ),
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(child: Text(
                    patient.personalDetails.firstName,
                  )),
                ),
              ),
            ),

            SizedBox(height: 7,),

            Text('Last Name'),
            Container(
              width: 350,
              height: 60,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                        width: 2.0,
                        color: Colors.black54
                    )
                ),
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(child: Text(
                    patient.personalDetails.lastName,
                  )),
                ),
              ),
            ),



            SizedBox(height: 7,),

            Text('Id Number'),
            Container(
              width: 350,
              height: 60,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                        width: 2.0,
                        color: Colors.black54
                    )
                ),
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(child: Text(
                    patient.personalDetails.nationalId,
                  )),
                ),
              ),
            ),

            SizedBox(height: 7,),

            Text('Gender'),
            Container(
              width: 350,
              height: 60,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                        width: 2.0,
                        color: Colors.black54
                    )
                ),
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(child: Text(
                    patient.personalDetails.gender,
                    style: TextStyle(color: Colors.black),)),
                ),
              ),
            ),

          ],
        );
      }
    },
  );


  Widget buildDoctor() => Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Doctor Name'),
        TextFormField(
          controller: doctornameController,
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
            label: Text('doctor name'),
            hintText: 'doctor name',
            suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: () => doctornameController.clear(),),
          ),
        ),

        SizedBox(height: 20,),

        Text('Doctor Email'),
        TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
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
            label: Text('doctor email'),
            hintText: 'doctor email',
            suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: () => emailController.clear(),),
          ),
        ),

      ],
    ),
  );
  
  Widget buildLab() => Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Test Date'),
        SizedBox(height: 3,),
        Column(
          children: <Widget>[
            Container(
              width: 300,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color:Colors.black38,
                  width: 1.0,
                )
              ),
              child: Text(
                "${testDate.year} - ${testDate.month} - ${testDate.day}",
              ),
            ),
            MaterialButton(
              color: Colors.blueGrey,
              hoverColor: Colors.lightBlueAccent,
              elevation: 4,
              child: Text('Choose Date'),
              onPressed: () async{
                final DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: testDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );

                if(dateTime != null){
                  setState(() {
                    testDate = dateTime;
                  });
                }
              },
            ),
          ],
        ),

        SizedBox(height: 10,),

        Text('Test Time'),
        SizedBox(height: 5,),
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
                  )
              ),
              child: Center(
                child:  Text(
                  "${testTime.hour}: ${testTime.minute.toString().padLeft(2, '0')}",
                ),
              ),
            ),
            SizedBox(height: 5,),
            MaterialButton(
              child: Text('Choose Time'),
              color: Colors.blue.withOpacity(0.4),
              hoverColor: Colors.lightBlueAccent,
              elevation: 0,
              onPressed: () async{
                final TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: testTime,
                  initialEntryMode: TimePickerEntryMode.dial,
                );

                if(time != null){
                  setState(() {
                    testTime = time;
                  });
                }
              },
            ),
          ],
        ),

        SizedBox(height: 10,),

        Text('Lab Name'),
        TextFormField(
          controller: labController,
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
            label: Text('Lab Name'),
            hintText: 'Lab Name',
            suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: () => labController.clear(),),
          ),
        ),

        SizedBox(height: 10,),


        Text('Test Name'),
        TextFormField(
          controller: testnameController,
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
            label: Text('Test Name'),
            hintText: 'test name',
            suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: () => testnameController.clear(),),
          ),
        ),

        SizedBox(height: 10,),

        Text('Medical Center'),
        SizedBox(
          width: 300,
          child: DropDownField(
            value: medicalcenter,
            hintText: 'Select Medical Center',
            dataSource: ListItems().medicalcenterItems,
            onChanged: (value){
              setState(() {
                medicalcenter = value;
              });
            },
            textField: 'label',
            valueField: 'value',
          ),
        ),



      ],
    ),
  );

  //stepper items
  int stepperIndex = 0;
  List<Step> getSteps() => [
    Step(
      title: Text('Patient Details'),
      subtitle: Text('Please confirm your details.'),
      content: buildPatientDetails(),
      isActive: stepperIndex >= 0,
    ),

    Step(
      title: Text('Doctor Details'),
      subtitle: Text('Please enter your doctor\'s details.'),
      content: buildDoctor(),
      isActive: stepperIndex >= 1,
    ),

    Step(
      title: Text('Test Details'),
      subtitle: Text('Please enter your test details.'),
      content: buildLab(),
      isActive: stepperIndex >= 2,
    ),

  ];


  @override
  Widget build(BuildContext context){
    //patient constants
    final patientService = Provider.of<PatientService>(context, listen: false);
    final patientConstants = PatientConstants(patientService);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Lab Tests'),
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

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Schedule Lab Test',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Center(
                  child: Text(
                    'Fill out the form to schedule your lab test',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ),

                SizedBox(height: 25,),

                SingleChildScrollView(
                  child: Stepper(
                    physics: ClampingScrollPhysics(),
                    currentStep: stepperIndex,
                    //back button
                    onStepCancel: (){
                      if (stepperIndex > 0){
                        setState(() {stepperIndex -= 1; });
                      }
                    },

                    //continue button
                    onStepContinue: (){
                      final isLastStep = stepperIndex == getSteps().length - 1;

                      Future<void> handleSchedule() async{
                        try{
                          var scheduleSuccess = false;
                          final statusCode = await scheduleTest(
                              patientConstants.patientID,
                              patientConstants.firstName,
                              patientConstants.lastName,
                              patientConstants.DOB,
                              patientConstants.gender,
                            patientConstants.idNumber,
                          );

                          if(statusCode == 200){
                            setState(() {
                              scheduleSuccess = true;
                            });
                          }

                          if(scheduleSuccess == true){
                            _showSuccessDialog(context);
                          }else if(scheduleSuccess == false){
                            _showFailureDialog(context);
                          }

                        }catch(e){
                          print('Error $e');
                        }

                      }

                      if (isLastStep){
                        handleSchedule();
                      }else{
                        setState(() {stepperIndex += 1;});

                      }
                    },

                    //button fixes
                    controlsBuilder: (BuildContext context, ControlsDetails details){
                      final isLastStep = stepperIndex == getSteps().length - 1;

                      return Container(
                        child:Row(
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                child: Text(isLastStep ? 'SUBMIT' : 'NEXT'),
                                onPressed: details.onStepContinue,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                            ),

                            SizedBox(width: 16,),

                            if(details.currentStep != 0)
                              Expanded(
                                child: ElevatedButton(
                                  child: Text('BACK'),
                                  onPressed: details.onStepCancel,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                ),
                              ),


                          ],
                        ),
                      );
                    },
                    onStepTapped: (int index){
                      setState(() {stepperIndex = index;});
                    },

                    //steps
                    steps: getSteps(),
                  ),
                ),

              ],
            ),
          )
      ),

      bottomNavigationBar: NavBar(),
    );
  }
}
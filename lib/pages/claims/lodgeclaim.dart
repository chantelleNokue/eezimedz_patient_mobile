import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dropdown_x/flutter_dropdown_x.dart';
import 'package:file_picker/file_picker.dart';

import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import '../profile.dart';
import '../components/listitemsclass.dart';
import '../../services/patient/patientservice.dart';
import '../../models/patientmodel.dart';
import '../components/successdialog.dart';
import 'claimsmenu.dart';


class LodgeClaim extends StatefulWidget{
  const LodgeClaim({Key ? key}): super(key : key);

  State<LodgeClaim> createState() => _LodgeClaimState();
}

class _LodgeClaimState extends State<LodgeClaim>{
  //success dialog
  void _showSuccessDialog(context) => showDialog(
    context: context,
    builder: (context) => SuccessDialog(toClass: ClaimsMenu()),
  );


  //switch booleans
  bool prescriptionSwitch = false;
  bool receiptSwitch = false;
  bool pharmacySwitch = false;
  //documents
  //File
  FilePickerResult? prescriptionResult;
  FilePickerResult? receiptResult;
  FilePickerResult? pharmacyResult;

  //Paths
  File? prescriptionFile;
  File? receiptFile;
  File? pharmacyFile;


  //File Picker method
  getPrescription() async{
    prescriptionResult = await FilePicker.platform.pickFiles();

    if(prescriptionResult != null){
      prescriptionFile = File(prescriptionResult!.files.single.path!);
    }else{
      print("No File Selected");//form selector lists
    }
    return prescriptionFile;
  }

  getReceipt() async{
    receiptResult = await FilePicker.platform.pickFiles();

    if(receiptResult != null){
      receiptFile = File(receiptResult!.files.single.path!);
    }else{
      print("No File Selected");
    }
    return receiptFile;
  }

  getPharmacy() async{
    pharmacyResult = await FilePicker.platform.pickFiles();

    if(pharmacyResult != null){
      pharmacyFile = File(pharmacyResult!.files.single.path!);
    }else{
      print("No File Selected");
    }
    return pharmacyFile;
  }



  //controllers
  final hospitalNameController = TextEditingController();
  final amountController = TextEditingController();
  final doctorNameController = TextEditingController();
  final doctorNumberController = TextEditingController();

  //variables
  String? hospitalisationreason;
  DateTime admissiondate = DateTime.now();
  DateTime dischargedate = DateTime.now();
  String? healthplan;

  //claimant details
  Widget buildClaimant() => Consumer<PatientService>(
    builder: (context, PatientService, _){
      PatientModel? patient = PatientService.patient;
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
                      patient!.personalDetails.firstName,
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
                      patient!.personalDetails.lastName,
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
                      patient!.personalDetails.nationalId,
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
                      patient!.personalDetails.gender,
                      style: TextStyle(color: Colors.black),)),
                  ),
                ),
              ),

            ],
          );
        },
      );

  //insurance questions
  Widget buildQuestions() => Padding(
    padding: EdgeInsets.all(8),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Name Of Hospital'),
        SizedBox(
          width: 265,
          child: TextFormField(
            controller: hospitalNameController,
            decoration: InputDecoration(
              labelText: 'Hospital Name',
              hintText: 'Hospital Name',
              suffixIcon: hospitalNameController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => hospitalNameController.clear(),
              ),
               alignLabelWithHint: true,
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal:15,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black45,
                    )
                )
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'name required';
              }else{
                return null;
              }
            },
          ),
        ),

        SizedBox(height: 5,),

        Text('Hospitalization Reason'),
        SizedBox(
          width: 300,
          child: DropDownField(
            value: hospitalisationreason,
            hintText: 'Select Reason',
            dataSource: ListItems().hospitalisationOptions,
            onChanged: (value){
              setState(() {
                hospitalisationreason = value;
              });
            },
            textField: 'label',
            valueField: 'value',
          ),
        ),

        SizedBox(height: 5,),

        Text('Admission Date'),
        SizedBox(height: 3,),
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
              child: Center(child:
              Text(
                "${admissiondate.year} - ${admissiondate.month} - ${admissiondate.day}",
              ),),
            ),
            SizedBox(height: 5,),
            MaterialButton(
              child: Text('Choose Date'),
              color: Colors.blue.withOpacity(0.4),
              hoverColor: Colors.lightBlueAccent,
              elevation: 0,
              onPressed: () async{
                final DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: admissiondate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );

                if(dateTime != null){
                  setState(() {
                    admissiondate = dateTime;
                  });
                }
              },
            ),
          ],
        ),


        SizedBox(height: 5,),

        Text('Discharge Date'),
        SizedBox(height: 3,),
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
              child: Center(child:
              Text(
                "${dischargedate.year} - ${dischargedate.month} - ${dischargedate.day}",
              ),),
            ),
            SizedBox(height: 5,),
            MaterialButton(
              child: Text('Choose Date'),
              color: Colors.blue.withOpacity(0.4),
              hoverColor: Colors.lightBlueAccent,
              elevation: 0,
              onPressed: () async{
                final DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: dischargedate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );

                if(dateTime != null){
                  setState(() {
                    dischargedate = dateTime;
                  });
                }
              },
            ),
          ],
        ),

        SizedBox(height: 5,),


        Text('Do you have another health plan?'),
        SizedBox(
          width: 300,
          child: DropDownField(
            value: healthplan,
            hintText: 'Select Option',
            dataSource: ListItems().optionItems,
            onChanged: (value){
              setState(() {
                healthplan = value;
              });
            },
            textField: 'label',
            valueField: 'value',
          ),
        ),

        SizedBox(height: 5,),

        Text('Amount to be claimed'),
        SizedBox(
          width: 265,
          child: TextFormField(
            controller: amountController,
            decoration: InputDecoration(
              labelText: 'Claim Amount',
              hintText: 'Claim Amount',
              suffixIcon: amountController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => amountController.clear(),
              ),
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black45,
                    )
                )
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'amount required';
              }else{
                return null;
              }
            },
          ),//form selector lists
        ),

        SizedBox(height: 5,),

        Text('Name Of Doctor'),
        SizedBox(
          width: 265,
          child: TextFormField(
            controller: doctorNameController,
            decoration: InputDecoration(
              labelText: 'Doctor Name',
              hintText: 'Doctor Name',
              suffixIcon: doctorNameController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => doctorNameController.clear(),
              ),
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal :15,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black45,
                    )
                )
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'name required';
              }else{
                return null;
              }
            },
          ),
        ),


        SizedBox(height: 5,),

        Text('Doctor\'s Phone Number'),
        SizedBox(
          width: 265,
          child: TextFormField(
            controller: doctorNumberController,
            decoration: InputDecoration(
              labelText: 'Doctor Number',
              hintText: 'Doctor Number',
              suffixIcon: doctorNumberController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => doctorNumberController.clear(),
              ),
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.black45,
                )
              )
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'number required';
              }else{
                return null;
              }
            },
          ),
        ),
      ],
    ),
  );

  Widget buildDocuments() => Padding(
    padding: EdgeInsets.all(5),
    child: Column(
      children: [
       SizedBox(
         height: 120,
         child: ListView(
           shrinkWrap: true,
           physics: ClampingScrollPhysics(),
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text(
                   'Doctor\'s Prescription',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                   ),
                 ),

                 Switch(
                   value: prescriptionSwitch,
                   onChanged: (value) {
                     setState(() {
                       prescriptionSwitch = value;
                     });

                     if (prescriptionSwitch) {
                       getPrescription();
                     }
                   },
                 ),
               ],
             ),

             SizedBox(height: 5,),

             (prescriptionResult != null)?
             Material(
               elevation: 2,
               borderRadius: BorderRadius.circular(12),
               child: Container(
                 width: 500,
                 height: 60,
                 padding: EdgeInsets.all(12),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     border: Border.all(
                       color: Colors.black12,
                       width: 1.0,
                     )
                 ),
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Icon(
                       Icons.file_copy_outlined,
                       size: 20,
                     ),

                     SizedBox(width: 10,),

                     Text(prescriptionResult!.files.single.name, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),),
                   ],
                 ),
               ),
             ):

                 Container(height: 0,),
           ],
         ),
       ),

        SizedBox(height: 5,),


        SizedBox(
         height: 120,
         child: ListView(
           shrinkWrap: true,
           physics: ClampingScrollPhysics(),
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text(
                   'Hospital Bill Receipt ',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                   ),
                 ),

                 Switch(
                   value: receiptSwitch,
                   onChanged: (value) {
                     setState(() {
                       receiptSwitch = value;
                     });

                     if (receiptSwitch) {
                       getReceipt();
                     }
                   },
                 ),
               ],
             ),

             SizedBox(height: 5,),

             (receiptResult != null)?
             Material(
               elevation: 2,
               borderRadius: BorderRadius.circular(12),
               child: Container(
                 width: 500,
                 height: 60,
                 padding: EdgeInsets.all(12),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     border: Border.all(
                       color: Colors.black12,
                       width: 1.0,
                     )
                 ),
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Icon(
                       Icons.file_copy_outlined,
                       size: 20,
                     ),

                     SizedBox(width: 10,),

                     Text(receiptResult!.files.single.name, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),),
                   ],
                 ),
               ),
             ):

                 Container(height: 0,),
           ],
         ),
       ),

        SizedBox(height: 5,),

        SizedBox(
         height: 120,
         child: ListView(
           shrinkWrap: true,
           physics: ClampingScrollPhysics(),
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text(
                   'Pharmacy Bill',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                   ),
                 ),

                 Switch(
                   value: pharmacySwitch,
                   onChanged: (value) {
                     setState(() {
                       pharmacySwitch = value;
                     });

                     if (pharmacySwitch) {
                       // Open the dialog
                       getPharmacy();
                     }
                   },
                 ),
               ],
             ),

             SizedBox(height: 5,),

             (pharmacyResult != null)?
             Material(
               elevation: 2,
               borderRadius: BorderRadius.circular(12),
               child: Container(
                 width: 500,
                 height: 60,
                 padding: EdgeInsets.all(12),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     border: Border.all(
                       color: Colors.black12,
                       width: 1.0,
                     )
                 ),
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Icon(
                       Icons.file_copy_outlined,
                       size: 20,
                     ),

                     SizedBox(width: 10,),

                     Text(pharmacyResult!.files.single.name, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),),
                   ],
                 ),
               ),
             ):

                 Container(height: 0,),
           ],
         ),
       ),

        SizedBox(height: 5,),


      ],
    ),
  );

  //list of steps
  int stepperIndex = 0;
  List<Step> getSteps() => [
    Step(
      title: Text('Claimant Details'),
      subtitle: Text('Please enter your details.'),
      content: buildClaimant(),
      isActive: stepperIndex >= 0,
    ),

    Step(
      title: Text('Claim Questions'),
      subtitle: Text('Please provide answers for the following questions.'),
      content: buildQuestions(),
      isActive: stepperIndex >= 1,
    ),

    Step(
      title: Text('Upload Documents'),
      subtitle: Text('Please upload required documents.'),
      content: buildDocuments(),
      isActive: stepperIndex >= 2,
    ),

  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Claims'),
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
         padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Book An Appointment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),

              SizedBox(height: 30,),

              SingleChildScrollView(
                child: Stepper(
                  physics: ClampingScrollPhysics(),
                  currentStep: stepperIndex,
                  onStepCancel: () {
                    if (stepperIndex > 0) {
                      setState(() {
                        stepperIndex -= 1;
                      });
                    }
                  },

                  onStepContinue: (){
                    final isLastStep = stepperIndex == getSteps().length - 1;

                    if(isLastStep){
                      _showSuccessDialog(context);

                    }else{
                      setState(() {
                        stepperIndex += 1;
                      });
                    }
                  },

                  controlsBuilder: (BuildContext context, ControlsDetails details) {
                    final isLastStep = stepperIndex == getSteps().length - 1;
                    return Container(
                      child: Row(
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
                  onStepTapped: (int index) {
                    setState(() {
                      stepperIndex = index;
                    });
                  },
                  steps: getSteps(),

                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: NavBar(),
    );
  }
}

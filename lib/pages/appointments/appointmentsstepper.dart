import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_x/flutter_dropdown_x.dart';
import 'package:intl/intl.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';


import '../profile.dart';
import '../components/drawercomponent.dart';
import '../components/successdialog.dart';
import 'components/failuredialog.dart';
import '../components/bottomnavigationbar.dart';
import '../components/listitemsclass.dart';
import '../../services/appointments/emailservice.dart';
import '../../services/patient/patientservice.dart';
import '../../models/patientmodel.dart';
import 'appointmentsmenu.dart';

class AppointmentsStepper extends StatefulWidget{
  const AppointmentsStepper({Key ? key}): super(key : key);

  State<AppointmentsStepper> createState() => _AppointmentsStepperState();
}

class _AppointmentsStepperState extends State<AppointmentsStepper>{
  //user data from firebase
  final user = FirebaseAuth.instance.currentUser!;
  String? appointmentid;
  String? objectid;


  //patient booking api call
  Future<int?> bookAppointment(
      // String phonenumber,
      String patientid,
      String firstname, String lastname,
      String dateofbirth, String email,
      String gender, String nationalid,
      String zip, String streetAddress, String city, String state
      ) async{
    try{
      var url = Uri.parse('http://20.164.214.226:3060/mongo/bookings/create');

      final response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: jsonEncode({
          // "phone_number": phonenumber,
          "patient_id": patientid,
          "first_name": firstname,
          "last_name": lastname,
          "date_of_birth": dateofbirth,
          "email": '${user.email}',
          "gender": gender,
          "national_id": nationalid,
          "medical_centre": medicalcenter,
          "applied_service": appliedServiceController.text,
          "department": department,
          "procedure": procedureController.text,
          "preferred_appointment_date":  DateFormat('yyyy-MM-dd').format(appointmentDate),
          "preferred_appointment_time": appointmentTime.format(context),
          "backup_date": appointmentDate.toString(),
          "backup_time": appointmentTime.format(context), //'${appointmentTime.hour}: ${appointmentTime.minute.toString().padLeft(2, '0')}',
          "appointmentid": generateAppointmentId(),
          "preferredDoctor": preferredDoctor,
          "service_provider": "serviceProvider",
          "status": "Pending",
          "siteid": generateCaseNumber(),
          "casenumber": generateCaseNumber(),
          "id": "ID789012",
          "langauge": "English",
          "diability": cognitive,
          "other_services": "None",
          "communication": communication,
          "sensory_processing": sensory,
          "cognitive_disability": cognitive,
          "street_address": streetAddress,
          // "street_address_line2": addressController.text,
          "city": city,
          "state": state,

          "postal_zipcode": zip,
          "createdAt": createdAtDate(),
          "updatedAt": updatedAtDate(),
          "__v": 0
        }),
      );


      print(generateAppointmentId());

      if(response.statusCode == 201){
        //TODO: delete unnecessary print statements
        print('Booking created successfully');
        print('Eezimeds: ${response.body}');
        print('Status Code: ${response.statusCode}');
        return response.statusCode;
      }else{
        print('Status Code: ${response.statusCode}');
        print('Eezimeds: ${response.body}');
      }

    }catch(e){
      print(e.toString());
    }

  }


  //appointnment id function
  String generateAppointmentId(){
    final random = Random();
    final numbers = List.generate(7, (index) => random.nextInt(10)).join();
    appointmentid = 'APP$numbers';
    return appointmentid!;
  }

  //case number
  String generateCaseNumber() {
    final random = Random();
    final randomNumbers = List.generate(7, (_) => random.nextInt(10)); // Generates four random numbers (0-9)
    final caseNumber = 'CSE${randomNumbers.join()}'; // Join the numbers into a single string
    return caseNumber;
  }



  //creation date function
  String createdAtDate() {
    final now = DateTime.now();
    final formattedDate = "${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}";
    final formattedTime = "${_addLeadingZero(now.hour)}:${_addLeadingZero(now.minute)}:${_addLeadingZero(now.second)}";
    return "$formattedDate $formattedTime";
  }

  String _addLeadingZero(int number) {
    return number.toString().padLeft(2, '0');
  }

  //updated at function
  String updatedAtDate() {
    final now = DateTime.now();
    final formattedDate = "${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}";
    final formattedTime = "${_addLeadingZero(now.hour)}:${_addLeadingZero(now.minute)}:${_addLeadingZero(now.second)}";
    return "$formattedDate $formattedTime";
  }

  //success dialog
  void _showSuccessDialog(context) => showDialog(
    context: context,
    builder: (context) => SuccessDialog(toClass: AppointmentsMenu()),
  );

  //failure dialog
  void _showFailureDialog(context) => showDialog(
    context: context,
    builder: (context) => FailureDialog(),
  );

  //payment components
  //controllers
  final creditcardnameController = TextEditingController();
  final creditcardnumberController = TextEditingController();
  final creditcardcvcController = TextEditingController();
  final creditcardaddressController = TextEditingController();
  final creditcardamountController = TextEditingController();
  final medicalaidcompanyController = TextEditingController();
  final medicalpolicyholderController = TextEditingController();
  final medicalpolicynumberController = TextEditingController();
  final medicalmembernumberController = TextEditingController();
  final medicalinsuranceplanController = TextEditingController();
  final medicalaidamountController = TextEditingController();

  //variables
  double? cashcomponentAmount;
  String? creditcardname;
  String? creditcardnumber;
  String? creditcardcvc;
  DateTime creditcardexpirydate = DateTime.now();
  String? creditcardaddress;
  String? creditcardamount;
  String? medicalaidinsurancecompany;
  String? medicalaidpolicyholder;
  String? medicalaidpolicynumber;
  String? medicalaidinsuranceplan;
  DateTime medicalaidexpirydate = DateTime.now();
  String? medicalaidinsurancemembernumber;
  String? medicalaidamount;
  double cashcomponentamount = 0;


  //components
  //CREDIT CARD COMPONENT
  Widget _buildCreditCard() => Padding(
    padding: const EdgeInsets.all(15.0),
    child: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Card Holder\'s name'),
          TextFormField(
            controller: creditcardnameController,
            decoration: InputDecoration(
              labelText: 'Holder Name',
              hintText: 'Holder Name',
              suffixIcon: creditcardnameController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => creditcardnameController.clear(),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSaved: (value) => setState(() => creditcardname = value),
            validator: (value){
              if(value!.isEmpty){
                return 'name is required';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 5,),

          Text('Card Number'),
          TextFormField(
            controller: creditcardnumberController,
            decoration: InputDecoration(
              labelText: 'Card Number',
              hintText: 'Card Number',
              suffixIcon: creditcardnumberController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => creditcardnumberController.clear(),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSaved: (value) => setState(() => creditcardnumber = value),
            validator: (value){
              if(value!.isEmpty){
                return 'number is required';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 5,),


          Text('CVV/CVC Number'),
          TextFormField(
            controller: creditcardcvcController,
            decoration: InputDecoration(
              labelText: 'CVV/CVC Number',
              hintText: 'CVV/CVC Number',
              suffixIcon: creditcardcvcController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => creditcardcvcController.clear(),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSaved: (value) => setState(() => creditcardcvc = value),
            validator: (value){
              if(value!.isEmpty){
                return 'cvc is required';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 5,),

          Text('Valid Until'),
          Column(
            children: <Widget>[
              Text(
                "${creditcardexpirydate.year} - ${creditcardexpirydate.month} - ${creditcardexpirydate.day}",
              ),
              MaterialButton(
                color: Colors.blueGrey,
                hoverColor: Colors.lightBlueAccent,
                elevation: 4,
                child: Text('Choose Date'),
                onPressed: () async{
                  final DateTime? dateTime = await showDatePicker(
                    context: context,
                    initialDate: creditcardexpirydate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000),
                  );

                  if(dateTime != null){
                    setState(() {
                      creditcardexpirydate = dateTime;
                    });
                  }
                },
              ),
            ],
          ),

          SizedBox(height: 5,),

          Text('Billing Address'),
          TextFormField(
            controller: creditcardaddressController,
            decoration: InputDecoration(
              labelText: 'Billing Address',
              hintText: 'Billing Address',
              suffixIcon: creditcardaddressController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => creditcardaddressController.clear(),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSaved: (value) => setState(() => creditcardaddress = value),
            validator: (value){
              if(value!.isEmpty){
                return 'address is required';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 5,),

          Text('Amount To Be Charged'),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: creditcardamountController,
            decoration: InputDecoration(
              labelText: 'Amount',
              hintText: 'Amount',
              suffixIcon: creditcardamountController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => creditcardamountController.clear(),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSaved: (value) => setState(() => creditcardamount = value),
            validator: (value){
              if(value!.isEmpty){
                return 'amount is required';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 13,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.cancel_outlined, size: 15,),
                label: Text('Cancel'),
              ),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.check_box_outlined,size: 15,),
                label: Text('Done'),
              ),
            ],
          ),
        ],
      ),
    ),
  );


  //MEDICAL AID COMPONENT
  Widget _buildMedicalAid() => Padding(
    padding: const EdgeInsets.all(15.0),
    child: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Text('Insurance Company Name'),
          TextFormField(
            controller: medicalaidcompanyController,
            decoration: InputDecoration(
              labelText: 'Insurance Company',
              hintText: 'Insurance Company',
              suffixIcon: medicalaidcompanyController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => medicalaidcompanyController.clear(),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSaved: (value) => setState(() => medicalaidinsurancecompany = value),
            validator: (value){
              if(value!.isEmpty){
                return 'company is required';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 5,),

          Text('Policy Holder'),
          TextFormField(
            controller: medicalpolicyholderController,
            decoration: InputDecoration(
              labelText: 'Policy Holder',
              hintText: 'Policy Holder',
              suffixIcon: medicalpolicyholderController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => medicalpolicyholderController.clear(),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSaved: (value) => setState(() => medicalaidpolicyholder = value),
            validator: (value){
              if(value!.isEmpty){
                return 'policy holder is required';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 5,),

          Text('Policy Number'),
          TextFormField(
            controller: medicalpolicynumberController,
            decoration: InputDecoration(
              labelText: 'Policy Number',
              hintText: 'Policy Number',
              suffixIcon: medicalpolicynumberController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => medicalpolicynumberController.clear(),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSaved: (value) => setState(() => medicalaidpolicynumber = value),
            validator: (value){
              if(value!.isEmpty){
                return 'policy number is required';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 5,),

          Text('Insurance Plan'),
          TextFormField(
            controller: medicalinsuranceplanController,
            decoration: InputDecoration(
              labelText: 'Insurance Plan',
              hintText: 'Insurance Plan',
              suffixIcon: medicalinsuranceplanController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => medicalinsuranceplanController.clear(),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSaved: (value) => setState(() => medicalaidinsuranceplan = value),
            validator: (value){
              if(value!.isEmpty){
                return 'plan is required';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 5,),

          Text("Expiry Date"),
          Column(
            children: <Widget>[
              Text(
                "${medicalaidexpirydate.year} - ${medicalaidexpirydate.month} - ${medicalaidexpirydate.day}",
              ),
              MaterialButton(
                color: Colors.blueGrey,
                hoverColor: Colors.lightBlueAccent,
                elevation: 4,
                child: Text('Choose Date'),
                onPressed: () async{
                  final DateTime? dateTime = await showDatePicker(
                    context: context,
                    initialDate: medicalaidexpirydate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000),
                  );

                  if(dateTime != null){
                    setState(() {
                      medicalaidexpirydate = dateTime;
                    });
                  }
                },
              ),
            ],
          ),

          SizedBox(height: 5,),

          Text('Insurance Member Number'),
          TextFormField(
            controller: medicalmembernumberController,
            decoration: InputDecoration(
              labelText: 'Member Number',
              hintText: 'Member Number',
              suffixIcon: medicalmembernumberController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => medicalmembernumberController.clear(),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSaved: (value) => setState(() => medicalaidinsurancemembernumber = value),
            validator: (value){
              if(value!.isEmpty){
                return 'member number is required';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 5,),

          Text('Deductable Amount'),
          TextFormField(
            controller: medicalaidamountController,
            decoration: InputDecoration(
              labelText: 'Deductable Amount',
              hintText: 'Deductable AMount',
              suffixIcon: medicalaidamountController.text.isEmpty
                  ? Container(width:0)
                  : IconButton(
                icon:Icon(Icons.close),
                onPressed: () => medicalaidamountController.clear(),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSaved: (value) => setState(() => medicalaidamount = value),
            validator: (value){
              if(value!.isEmpty){
                return 'amount is required';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.cancel_outlined, size: 15,),
                label: Text('Cancel'),
              ),

              ElevatedButton.icon(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.check_box_outlined,size: 15,),
                label: Text('Done'),
              ),
            ],
          ),

        ],
      ),
    ),
  );

  //CASH COMPONENT
  Widget _buildCashComponent() => Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Center(
            child: Text(
              'Please enter amount to be paid.',
            ),
          ),

          SizedBox(height: 20,),

          Slider(
            value: cashcomponentamount,
            max: 10000,
            divisions: 5,
            label: cashcomponentamount.round().toString(),
            onChanged: (double value){
              setState(() {
                cashcomponentamount = value;
              });
            },
          ),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.cancel_outlined, size: 15,),
                label: Text('Cancel'),
              ),

              ElevatedButton.icon(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.check_box_outlined,size: 15,),
                label: Text('Done'),
              ),
            ],
          ),


        ],
      )
  );



  //controllers
  final _dateFormat = DateFormat('yyyy/MM/dd');
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final procedureController = TextEditingController();
  final appliedServiceController = TextEditingController();

  //radio buttons value
  String genderRadio = "";
  String optionRadio0 = "";
  String optionRadio1 = "";
  String optionRadio2 = "";
  String optionRadio3 = "";
  String optionRadio4 = "";
  String optionRadio5 = "";

  //date items
  DateTime appointmentDate = DateTime.now();
  TimeOfDay appointmentTime = TimeOfDay.now();



  //variables
  String? streetAddress;
  String? country;
  String? city;
  String? state;
  String? zipCode;
  String? appliedBefore;
  String? preferredDoctor;
  String? department;
  String? medicalcenter;
  String? translator;
  String? accomodation;
  String? communication;
  String? sensory;
  String? cognitive;
  String? procedure;
  String? appliedService;


  //boolean values for switches
  bool cash = false;
  bool credit = false;
  bool medical = false;
  bool paymentplan = false;



  //widget build methods
  //personal details component
  Widget _buildPersonalDetails() => Consumer<PatientService>(
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

            Text('National ID'),
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


  //address details component
  // Widget _buildAddressDetails() => Column(
  //   children: <Widget>[
  //     TextFormField(
  //       controller: addressController,
  //       decoration: InputDecoration(
  //         labelText: 'Street Address',
  //         hintText: 'Street Address',
  //         suffixIcon: addressController.text.isEmpty
  //             ? Container(width:0)
  //             : IconButton(
  //           icon:Icon(Icons.close),
  //           onPressed: () => addressController.clear(),
  //         ),
  //         contentPadding: EdgeInsets.symmetric(vertical: 10),
  //       ),
  //       onSaved: (value) => setState(() => streetAddress = value),
  //       validator: (value){
  //         if(value!.isEmpty){
  //           return 'address required';
  //         }else{
  //           return null;
  //         }
  //       },
  //     ),
  //
  //     SizedBox(height: 7,),
  //
  //     Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 15.0),
  //       child: CSCPicker(
  //         layout: Layout.vertical,
  //         cityDropdownLabel: "City",
  //         stateDropdownLabel: "State",
  //         dropdownDialogRadius: 33,
  //         searchBarRadius: 33,
  //         dropdownDecoration: BoxDecoration(
  //           border: null,
  //         ),
  //
  //         onCountryChanged: (country){
  //           setState(() {
  //             country = country;
  //           });
  //         },
  //
  //
  //         onStateChanged: (state){
  //           setState(() {
  //             state = state;
  //           });
  //         },
  //
  //         onCityChanged: (city){
  //           setState(() {
  //             city = city;
  //           });
  //         },
  //       ),
  //     ),
  //
  //     SizedBox(height: 7,),
  //
  //     TextFormField(
  //       controller: zipCodeController,
  //       decoration: InputDecoration(
  //         labelText: 'Zip Code',
  //         hintText: 'Zip Code',
  //         suffixIcon: zipCodeController.text.isEmpty
  //             ? Container(width:0)
  //             : IconButton(
  //           icon:Icon(Icons.close),
  //           onPressed: () => zipCodeController.clear(),
  //         ),
  //         contentPadding: EdgeInsets.symmetric(vertical: 10),
  //       ),
  //       onSaved: (value) => setState(() => zipCode = value),
  //       validator: (value){
  //         if(value!.isEmpty){
  //           return 'zipcode required';
  //         }else{
  //           return null;
  //         }
  //       },
  //     ),
  //   ],
  // );

  //booking questions component
  Widget _buildBookingQuestions() => Column(
    children: <Widget>[
      Text('Have you ever applied to our facility before?'),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RadioListTile(
            title:Text('Yes'),
            value: "Yes",
              groupValue: optionRadio0,
              onChanged: (value) {
                setState(() {
                  optionRadio0 = value!;
                  appliedBefore = 'Yes';
                });
              },
          ),

          RadioListTile(
            title: Text('No'),
            value: 'No',
            groupValue: optionRadio0,
            onChanged: (value) {
              setState(() {
                optionRadio0 = value!;
                appliedBefore = 'No';
              });
            },
          ),

        ],
      ),

      SizedBox(height: 10,),

      Text('Procedure'),
      SizedBox(
        width: 265,
        child: TextFormField(
          controller: procedureController,
          decoration: InputDecoration(
            labelText: 'Procedure',
            hintText: 'Procedure',
            suffixIcon: procedureController.text.isEmpty
                ? Container(width:0)
                : IconButton(
              icon:Icon(Icons.close),
              onPressed: () => procedureController.clear(),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 13),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onSaved: (value) => setState(() => procedure = value),
          validator: (value){
            if(value!.isEmpty){
              return 'procedure required';
            }else{
              return null;
            }
          },
        ),
      ),
      SizedBox(height: 10,),

      Text('Applied Service'),
      SizedBox(
        width: 265,
        child: TextFormField(
          controller: appliedServiceController,
          decoration: InputDecoration(
            labelText: 'Applied Service',
            hintText: 'Applied Service',
            suffixIcon: appliedServiceController.text.isEmpty
                ? Container(width:0)
                : IconButton(
              icon:Icon(Icons.close),
              onPressed: () =>appliedServiceController.clear(),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 13),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onSaved: (value) => setState(() => appliedService = value),
          validator: (value){
            if(value!.isEmpty){
              return 'applied service required';
            }else{
              return null;
            }
          },
        ),
      ),

      Text('Preferred Doctor'),
      SizedBox(
        width: 300,
        child: DropDownField(
          value: preferredDoctor,
          hintText: 'Select Doctor',
          dataSource: ListItems().doctorOptions,
          onChanged: (value){
            setState(() {
              preferredDoctor = value;
            });
          },
          textField: 'label',
          valueField: 'value',
        ),
      ),

      SizedBox(height: 10,),

      Text('Which department would you like to get an appointment from?'),
      SizedBox(
        width: 300,
        child: DropDownField(
          value: department,
          hintText: 'Select Department',
          dataSource: ListItems().departmentOptions,
          onChanged: (value){
            setState(() {
              department = value;
            });
          },
          textField: 'label',
          valueField: 'value',
        ),
      ),

      SizedBox(height: 10,),
      Text('Which medical center would you like to visit?'),
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
  );

  //payments component
  Widget _buildPaymentDetails() => Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Cash or Cheque',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Switch(
            value: cash,
            activeColor: Colors.blue,
            onChanged: (bool value){
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      child: _buildCashComponent(),
                    ),
                  );
                }
              );
              setState(() {
                cash = value;
              });
            },
          ),
        ],
      ),

      SizedBox(height: 5,),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Debit or Credit Card',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Switch(
            value: credit,
            activeColor: Colors.blue,
            onChanged: (bool value){
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: _buildCreditCard(),
                    ),
                  );
                }
              );
              setState(() {
                credit = value;
              });
            },
          ),
        ],
      ),

      SizedBox(height: 5,),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Medical Aid',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Switch(
            value: medical,
            activeColor: Colors.blue,
            onChanged: (bool value){
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: _buildMedicalAid(),
                    ),
                  );
                }
              );
              setState(() {
                medical = value;
              });
            },
          ),
        ],
      ),

      SizedBox(height: 5,),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Payment Plan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Switch(
            value: paymentplan,
            activeColor: Colors.blue,
            onChanged: (bool value){
              setState(() {
                paymentplan = value;
              });
            },
          ),
        ],
      ),
    ],
  );

  //date and time component
  Widget _buildPrefferedDateAndTime() => Column(
    children: <Widget>[
      Text('Preferred Date'),
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
            child: Center(child:
            Text(
              "${appointmentDate.year} - ${appointmentDate.month} - ${appointmentDate.day}",
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
                initialDate: appointmentDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(3000),
              );

              if(dateTime != null){
                setState(() {
                  appointmentDate = dateTime;
                });
              }
            },
          ),
        ],
      ),

      SizedBox(height: 5,),

      Text('Preferred Time'),
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
               "${appointmentTime.hour}: ${appointmentTime.minute.toString().padLeft(2, '0')}",
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
                initialTime: appointmentTime,
                initialEntryMode: TimePickerEntryMode.dial,
              );

              if(time != null){
                setState(() {
                  appointmentTime = time;
                });
              }
            },
          ),
        ],
      ),

    ],
  );

  //special needs component
  Widget _buildSpecialNeeds() => Column(
    children: <Widget>[
      Text('Do you need a langauge translator?'),
      Column(
       mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RadioListTile(
            title: Text('Yes'),
            value: "Yes",
            groupValue: optionRadio1,
            onChanged: (value) {
              setState(() {
                optionRadio1 = value!;
                translator = 'Yes';
              });
            },
          ),

          RadioListTile(
            title: Text('No'),
            value:'No',
            groupValue: optionRadio1,
            onChanged: (value) {
              setState(() {
                optionRadio1 = value!;
                translator = 'No';
              });
            },
          ),

        ],
      ),
      Text(optionRadio1),

      SizedBox(height: 5,),

      Text('Do you need any accommodation for disability?'),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RadioListTile(
              title: Text('Yes'),
              value: 'Yes',
              groupValue: optionRadio2,
              onChanged: (value) {
                setState(() {
                  optionRadio2 = value!;
                  accomodation = 'Yes';
                });
              },
          ),


          RadioListTile(
            title: Text('No'),
            value: "No",
            groupValue: optionRadio2,
            onChanged: (value) {
              setState(() {
                optionRadio2 = value!;
                accomodation = 'No';
              });
            },
          ),
        ],
      ),

      SizedBox(height: 5,),

      Text('Do you need communication assistance?'),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RadioListTile(
            title: Text('Yes'),
            value: 'Yes',
            groupValue: optionRadio3,
            onChanged: (value) {
              setState(() {
                optionRadio3 = value!;
                communication = 'Yes';
              });
            },
          ),

          RadioListTile(
            title: Text('No'),
            value: "No",
            groupValue: optionRadio3,
            onChanged: (value) {
              setState(() {
                optionRadio3 = value!;
                communication = 'No';
              });
            },
          ),
        ],
      ),

      SizedBox(height: 5,),

      Text('Do you have any sensory processing issues?'),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RadioListTile(
            title: Text('Yes'),
            value: "Yes",
            groupValue: optionRadio4,
            onChanged: (value) {
              setState(() {
                optionRadio4 = value!;
                sensory = 'Yes';
              });
            },
          ),

          RadioListTile(
            title: Text('No'),
            value: "No",
            groupValue: optionRadio4,
            onChanged: (value) {
              setState(() {
                optionRadio4 = value!;
                sensory = 'No';
              });
            },
          ),

        ],
      ),

      SizedBox(height: 5,),

      Text('Do you have any cognitive disability?'),
     Column(
      mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         RadioListTile(
           title: Text('Yes'),
           value: "Yes",
           groupValue: optionRadio5,
           onChanged: (value) {
             setState(() {
               optionRadio5 = value!;
               cognitive = 'Yes';
             });
           },
         ),

         RadioListTile(
           title: Text('No'),
           value: "No",
           groupValue: optionRadio5,
           onChanged: (value) {
             setState(() {
               optionRadio5 = value!;
               cognitive = 'No';
             });
           },
         ),

       ],
     )
    ],
  );



  //list of steps
  int stepperIndex = 0;
  List<Step> getSteps() => [
    Step(
      title: Text('Personal Details'),
      subtitle: Text('Please enter personal details.'),
      content: _buildPersonalDetails(),
      isActive: stepperIndex >= 0,
    ),

    // Step(
    //   title: Text('Address Details'),
    //   subtitle: Text('Please enter address details.'),
    //   content: _buildAddressDetails(),
    //   isActive: stepperIndex >= 1,
    // ),

    Step(
      title: Text('Booking Questions'),
      subtitle: Text('Please answer these booking questions.'),
      content: _buildBookingQuestions(),
      isActive: stepperIndex >= 1,
    ),

    Step(
      title: Text('Payment Details'),
      subtitle: Text('Please provide payment details.'),
      content: _buildPaymentDetails(),
      isActive: stepperIndex >= 2,
    ),

    Step(
      title: Text('Date And Time'),
      subtitle: Text('Please provide preferred date and time.'),
      content: _buildPrefferedDateAndTime(),
      isActive: stepperIndex >= 3,
    ),

    Step(
      title: Text('Special Needs'),
      subtitle: Text('Please answer the following special needs questions.'),
      content: _buildSpecialNeeds(),
      isActive: stepperIndex >= 4,
    ),

  ];

  @override
  Widget build(BuildContext context){
  //patient constants
  final patientService = Provider.of<PatientService>(context, listen: false);
  final patientConstants = PatientConstants(patientService);
  final patientAddressDetails = PatientAddressDetails(patientService);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Book Appointment'),
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
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
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
                child:  Stepper(
                  physics: ClampingScrollPhysics(),
                  currentStep: stepperIndex,
                  onStepCancel: () {
                    if (stepperIndex > 0) {
                      setState(() {
                        stepperIndex -= 1;
                      });
                    }
                    },

                  onStepContinue: () {
                    final isLastStep = stepperIndex == getSteps().length - 1;

                    Future<void> handleBooking() async{
                      var bookingSuccess = true;
                      try{
                        final statusCode = await bookAppointment(
                          // patientConstants.phoneNumber,
                          patientConstants.patientID,
                          patientConstants.firstName,
                          patientConstants.lastName,
                          patientConstants.DOB,
                          patientConstants.email,
                          patientConstants.gender,
                          patientConstants.idNumber,
                            patientAddressDetails.zip,
                          patientAddressDetails.city,
                          patientAddressDetails.streetAddress,
                            patientAddressDetails.state,

                        );

                        if(statusCode == 201){
                          setState(() {
                            bookingSuccess = true;
                          });
                        }


                        if(bookingSuccess == true){
                          EmailService().sendEmail(
                              '${user.email.toString()}',//user.email.toString(),
                              appointmentid!,
                              appliedBefore.toString(),
                              department.toString(),
                              procedureController.text,
                              appointmentDate.toString(),
                              appointmentTime.toString(),
                              preferredDoctor!
                          );
                          _showSuccessDialog(context);
                        }else if (bookingSuccess == false){
                          _showFailureDialog(context);
                        }

                      }catch(e){
                        print('Error $e');
                      }
                    }

                    if (isLastStep) {
                      handleBooking();
                    } else {
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


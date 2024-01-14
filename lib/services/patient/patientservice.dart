import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/patientmodel.dart';

class PatientService with ChangeNotifier{
  PatientService(){
    getPatient();
  }

  PatientModel? _patient;


  PatientModel? get patient => _patient;

  getPatient() async{
   try{
     _patient = await getPatientDetails();

     if(_patient != null){
       print('Patient Retrieved');
     }else{
       print('Patient Retrieval Failed');
     }
   }catch (e){
     print(e.toString());
   }

  }

  final _user = FirebaseAuth.instance.currentUser;

  Future<PatientModel?> getPatientDetails() async{
    try{
      var url = Uri.parse('http://20.164.214.226:3060/mongo/patient/getPatientByEmail?email=Vincent.skosana.t@gmail.com');
//lomixum@mailinator.com'${_user?.email}
      final response = await http.get(url);

      if(response.statusCode == 200){
        return patientModelFromJson(response.body);
      }else{
        print(response.statusCode);
      }

    }catch(e){
      print('Error: $e');
    }

  }

  notifyListeners();
}


class PatientConstants {
  final PatientService patientService;

  PatientConstants(this.patientService);

  String get patientID {
    return patientService.patient!.personalDetails.id;
  }

  String get firstName {
    return patientService.patient!.personalDetails.firstName;
  }

  String get lastName {
    return patientService.patient!.personalDetails.lastName;
  }

  String get idNumber {
    return patientService.patient!.personalDetails.nationalId;
  }

  String get gender {
    return patientService.patient!.personalDetails.gender;
  }


  String get phoneNumber {
    return patientService.patient!.contactDetails.phoneNumbers.first.phoneNumber;
  }

  String get DOB {
    return patientService.patient!.personalDetails.dateOfBirth.toString();
  }

  String get email {
    return patientService.patient!.contactDetails.emailAddresses.first.email;
  }

}

class PatientAddressDetails {
  final PatientService patientService;

  PatientAddressDetails(this.patientService);

  String get city {
    return patientService.patient!.contactDetails.addressDetails.first.city;
  }
  String get streetAddress {
    return patientService.patient!.contactDetails.addressDetails.first.streetAddress;
  }

  String get zip {
    return patientService.patient!.contactDetails.addressDetails.first.zip;
  }

  String get state {
    return patientService.patient!.contactDetails.addressDetails.first.region;
  }
}
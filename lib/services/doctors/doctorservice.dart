import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/doctormodel.dart';

class DoctorProvider with ChangeNotifier{
  DoctorProvider(){
    getAllDoctors();
  }

  //doctors list
  List<DoctorModel>? _doctors = [];

  List<DoctorModel>? get doctors => _doctors;


  List<DoctorModel>? _cardiology = [];
  List<DoctorModel>? _dermatology = [];
  List<DoctorModel>? _gynaecology = [];
  List<DoctorModel>? _internal = [];
  List<DoctorModel>? _neurology = [];
  List<DoctorModel>? _oncology = [];
  List<DoctorModel>? _pediatrics = [];
  List<DoctorModel>? _radiology = [];


  List<DoctorModel>? get cardiology => _cardiology;
  List<DoctorModel>? get dermatology => _dermatology;
  List<DoctorModel>? get gynaecology => _gynaecology;
  List<DoctorModel>? get internal => _internal;
  List<DoctorModel>? get neurology => _neurology;
  List<DoctorModel>? get oncology => _oncology;
  List<DoctorModel>? get pediatrics => _pediatrics;
  List<DoctorModel>? get radiology => _radiology;

  void loopThroughDoctors(List<DoctorModel>? data){
    _cardiology = [];
    _dermatology = [];
    _gynaecology = [];
    _internal = [];
    _neurology = [];
    _oncology = [];
    _pediatrics = [];
    _radiology = [];

    if(data != null){
      for(var doctor in data){
        if(doctor.specialtyDetails.doctorType == "Cardiologist"){
          _cardiology?.add(doctor);
          print(_cardiology);
        }else if(doctor.specialtyDetails.doctorType == "Dermatologist"){
          _dermatology?.add(doctor);
        }else if(doctor.specialtyDetails.doctorType == "Gynaecologist"){
          _gynaecology?.add(doctor);
        }else if(doctor.specialtyDetails.doctorType == "Internal medicine"){
          _internal?.add(doctor);
        }else if(doctor.specialtyDetails.doctorType == "Neurologist"){
          _neurology?.add(doctor);
        }else if(doctor.specialtyDetails.doctorType == "Oncologist"){
          _oncology?.add(doctor);
        }else if(doctor.specialtyDetails.doctorType == "Padiatrician"){
          _pediatrics?.add(doctor);
        }else if(doctor.specialtyDetails.doctorType == "Radiologist"){
          _radiology?.add(doctor);
        }
      }
    }else{
      print('Data is null');
    }

  }

  //doctors call
  getDoctors() async{
    try{
      _doctors = await getAllDoctors();

      if(_doctors != null){
        loopThroughDoctors(doctors);
        print('Doctors retrieved successfully');
        print(_doctors);
      }
    }catch(e){
      print(e.toString());
    }

  }

  Future<List<DoctorModel>?> getAllDoctors() async {
    try {
      var url = Uri.parse('http://20.164.214.226:3060/mongo/doctor');

      final response = await  http.get(url);
      print('nokutenda');

      if(response.statusCode == 200){
        print('Doctors retrieved successfully');
        print(response.statusCode);
        print(response.body);
        return doctorModelFromJson(response.body);
      }

    } catch (e) {
      print(e.toString());
    }
  }

  notifyListeners();
}

//TODO: create doctor constants similar to patient constants
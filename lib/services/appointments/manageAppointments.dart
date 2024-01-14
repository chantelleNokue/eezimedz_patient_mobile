import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../models/appointmentsmodel.dart';


class AppointmentsService{

  //book appointment
  Future<void>? bookAppointment(
      phonenumber, patientid,
      firstname, lastname,
      dateofbirth, email,
      gender, nationalid,
      medicalcentre, appliedservice,
      department,procedure,
      appointmentdate, appointmenttime,
      backupdate,backuptime,
      appointmentid, doctor,
      serviceprovider, disability,
      communication, sensory,
      cognitive, streetaddress,
      city, state, zipcode
      ) async{
    try{
      var url = Uri.parse('http://20.164.214.226:3060/mongo/bookings/create');

      final response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: jsonEncode({
          "phone_number": phonenumber,
          "patient_id": patientid,
          "first_name": firstname,
          "last_name": lastname,
          "date_of_birth": dateofbirth,
          "email": email,
          "gender": gender,
          "national_id": nationalid,
          "medical_centre": medicalcentre,
          "applied_service": appliedservice,
          "department": department,
          "procedure": procedure,
          "preferred_appointment_date": appointmentdate,
          "preferred_appointment_time": appointmenttime,
          "backup_date": backupdate,
          "backup_time": backuptime,
          "appointmentid": appointmentid,
          "preferredDoctor": doctor,
          "service_provider": serviceprovider,
          "status": "Pending",
          "siteid": "AAD12345WQ",
          "casenumber": "CASE123",
          "id": "ID789012",
          "langauge": "English",
          "diability": disability,
          "other_services": "None",
          "communication": communication,
          "sensory_processing": sensory,
          "cognitive_disability": cognitive,
          "street_address": streetaddress,
          "street_address_line2": streetaddress,
          "city": city,
          "state": state,
          "postal_zipcode": zipcode,
          "_id": "64ef19718f2b2e28361f9581",
          "createdAt": "2023-08-30T10:26:57.602Z",
          "updatedAt": "2023-08-30T10:26:57.602Z",
          "__v": 0
        }),
      );
print(response.body);
      if(response.statusCode == 201){
        print('Booking created successfully');
        print(appointmentid);
        print(response.statusCode);
      }

    }catch(e){
      print(e.toString());
    }

  }

  //reschedule appointment
  Future<int?> rescheduleAppointment(date, time, department, procedure, service, appointmentid) async{
    try{
      var url = Uri.parse('http://20.164.214.226:3060/mongo/bookings/rescheduleBooking');

      final response = await http.put(
        url,
        body: jsonEncode({
          "preferred_appointment_date":date,
          "preferred_appointment_time":time,
          "department":department,
          "procedure":procedure,
          "applied_service":service,
          "appointmentid":appointmentid,
        }),
      );

      if(response.statusCode == 200){
        print('Reschedule Successful');
        print(response.statusCode);
        return response.statusCode;
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print(e.toString());
    }
  }


  //cancel appointment
  Future<int?> cancelAppointment(appointmentid) async{
    try{
      var url = Uri.parse('http://20.164.214.226:3060/mongo/bookings/cancelBooking');

      final response = await http.put(
        url,
        body: jsonEncode(
          {
            "status": "Cancelled",
            "appointmentid": appointmentid
          }
        )
      );

      if(response.statusCode == 200){
        print('Cancelled Sucessfully');
        return response.statusCode;
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print(e.toString());
    }
  }

}


class AppointmentsProvider with ChangeNotifier{
  AppointmentsProvider(){
   getAppointments();
  }

  //appointment lists
  List<AppointmentModel>? _appointments = [];

  List<AppointmentModel>? get appointments => _appointments;

  final _user = FirebaseAuth.instance.currentUser!;


   Future<List<AppointmentModel>?> getAppointments() async{
     try{
       var url = Uri.parse('http://20.164.214.226:3060/mongo/bookings/getBookingsByEmail?email=${_user.email}');

       final response = await http.get(url);

       if(response.statusCode == 200){
         print('Appointments Successfully Retrieved');
         final jsonData = json.decode(response.body);
         print('Response Data: $jsonData'); // Debug print
         _appointments = appointmentModelFromJson(response.body);
         return _appointments;
       }
     }catch(e){
       print(e.toString());
     }
     return null;
   }
//${_user.email}
}



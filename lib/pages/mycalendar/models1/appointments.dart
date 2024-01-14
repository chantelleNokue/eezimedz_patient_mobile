// To parse this JSON data, do
//
//     final appointmentsModel = appointmentsModelFromMap(jsonString);

import 'dart:convert';

List<AppointmentsModel> appointmentsModelFromMap(String str) => List<AppointmentsModel>.from(json.decode(str).map((x) => AppointmentsModel.fromMap(x)));

String appointmentsModelToMap(List<AppointmentsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class AppointmentsModel {
  String id;
  String? phoneNumber;
  String email;
  String patientId;
  String firstName;
  String lastName;
  String dateOfBirth;
  String gender;
  String nationalId;
  String appliedService;
  String department;
  List<dynamic> outcome;
  String? category;
  String procedure;
  String preferredAppointmentDate;
  String preferredAppointmentTime;
  String appointmentid;
  String preferredDoctor;
  String? doctorEmail;
  String? doctorName;
  String? doctorid;
  String serviceProvider;
  String status;
  String siteid;
  String? casenumber;
  String? appointmentsModelId;
  String? referenceNumber;
  String langauge;
  String diability;
  String otherServices;
  String communication;
  String sensoryProcessing;
  String cognitiveDisability;
  String streetAddress;
  String city;
  String state;
  String postalZipcode;
  String createdAt;
  String updatedAt;
  int v;
  String? medicalCentre;
  String? backupDate;
  String? backupTime;
  String? location;

  AppointmentsModel({
    required this.id,
    this.phoneNumber,
    required this.email,
    required this.patientId,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.nationalId,
    required this.appliedService,
    required this.department,
    required this.outcome,
    this.category,
    required this.procedure,
    required this.preferredAppointmentDate,
    required this.preferredAppointmentTime,
    required this.appointmentid,
    required this.preferredDoctor,
    this.doctorEmail,
    this.doctorName,
    this.doctorid,
    required this.serviceProvider,
    required this.status,
    required this.siteid,
    this.casenumber,
    this.appointmentsModelId,
    this.referenceNumber,
    required this.langauge,
    required this.diability,
    required this.otherServices,
    required this.communication,
    required this.sensoryProcessing,
    required this.cognitiveDisability,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.postalZipcode,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.medicalCentre,
    this.backupDate,
    this.backupTime,
    this.location,
  });

  factory AppointmentsModel.fromMap(Map<String, dynamic> json) => AppointmentsModel(
    id: json["_id"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    patientId: json["patient_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    dateOfBirth: json["date_of_birth"],
    gender: json["gender"],
    nationalId: json["national_id"],
    appliedService: json["applied_service"],
    department: json["department"],
    outcome: List<dynamic>.from(json["outcome"].map((x) => x)),
    category: json["category"],
    procedure: json["procedure"],
    preferredAppointmentDate: json["preferred_appointment_date"],
    preferredAppointmentTime: json["preferred_appointment_time"],
    appointmentid: json["appointmentid"],
    preferredDoctor: json["preferredDoctor"],
    doctorEmail: json["doctorEmail"],
    doctorName: json["doctorName"],
    doctorid: json["doctorid"],
    serviceProvider: json["service_provider"],
    status: json["status"],
    siteid: json["siteid"],
    casenumber: json["casenumber"],
    appointmentsModelId: json["id"],
    referenceNumber: json["referenceNumber"],
    langauge: json["langauge"],
    diability: json["diability"],
    otherServices: json["other_services"],
    communication: json["communication"],
    sensoryProcessing: json["sensory_processing"],
    cognitiveDisability: json["cognitive_disability"],
    streetAddress: json["street_address"],
    city: json["city"],
    state: json["state"],
    postalZipcode: json["postal_zipcode"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    medicalCentre: json["medical_centre"],
    backupDate: json["backup_date"],
    backupTime: json["backup_time"],
    location: json["location"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "phone_number": phoneNumber,
    "email": email,
    "patient_id": patientId,
    "first_name": firstName,
    "last_name": lastName,
    "date_of_birth": dateOfBirth,
    "gender": gender,
    "national_id": nationalId,
    "applied_service": appliedService,
    "department": department,
    "outcome": List<dynamic>.from(outcome.map((x) => x)),
    "category": category,
    "procedure": procedure,
    "preferred_appointment_date": preferredAppointmentDate,
    "preferred_appointment_time": preferredAppointmentTime,
    "appointmentid": appointmentid,
    "preferredDoctor": preferredDoctor,
    "doctorEmail": doctorEmail,
    "doctorName": doctorName,
    "doctorid": doctorid,
    "service_provider": serviceProvider,
    "status": status,
    "siteid": siteid,
    "casenumber": casenumber,
    "id": appointmentsModelId,
    "referenceNumber": referenceNumber,
    "langauge": langauge,
    "diability": diability,
    "other_services": otherServices,
    "communication": communication,
    "sensory_processing": sensoryProcessing,
    "cognitive_disability": cognitiveDisability,
    "street_address": streetAddress,
    "city": city,
    "state": state,
    "postal_zipcode": postalZipcode,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "medical_centre": medicalCentre,
    "backup_date": backupDate,
    "backup_time": backupTime,
    "location": location,
  };
}

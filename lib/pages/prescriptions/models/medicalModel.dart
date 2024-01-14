// To parse this JSON data, do
//
//     final medicalModel = medicalModelFromMap(jsonString);

import 'dart:convert';

List<MedicalModel> medicalModelFromMap(String str) => List<MedicalModel>.from(json.decode(str).map((x) => MedicalModel.fromMap(x)));

String medicalModelToMap(List<MedicalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class MedicalModel {
  String id;
  String patientId;
  String patientName;
  String medicineName;
  String dosage;
  String scheduleType;
  String scheduleStartDate;
  String scheduleEndDate;
  String timeOfAdministration;
  String administrationFrequency;
  List<String> daysOfWeek;
  String instructions;
  String reminderPreference;
  String createdAt;
  String updatedAt;
  int v;

  MedicalModel({
    required this.id,
    required this.patientId,
    required this.patientName,
    required this.medicineName,
    required this.dosage,
    required this.scheduleType,
    required this.scheduleStartDate,
    required this.scheduleEndDate,
    required this.timeOfAdministration,
    required this.administrationFrequency,
    required this.daysOfWeek,
    required this.instructions,
    required this.reminderPreference,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory MedicalModel.fromMap(Map<String, dynamic> json) => MedicalModel(
    id: json["_id"],
    patientId: json["patientId"],
    patientName: json["patientName"],
    medicineName: json["medicineName"],
    dosage: json["dosage"],
    scheduleType: json["scheduleType"],
    scheduleStartDate: json["scheduleStartDate"],
    scheduleEndDate: json["scheduleEndDate"],
    timeOfAdministration: json["timeOfAdministration"],
    administrationFrequency: json["administrationFrequency"],
    daysOfWeek: List<String>.from(json["daysOfWeek"].map((x) => x)),
    instructions: json["instructions"],
    reminderPreference: json["reminderPreference"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "patientId": patientId,
    "patientName": patientName,
    "medicineName": medicineName,
    "dosage": dosage,
    "scheduleType": scheduleType,
    "scheduleStartDate": scheduleStartDate,
    "scheduleEndDate": scheduleEndDate,
    "timeOfAdministration": timeOfAdministration,
    "administrationFrequency": administrationFrequency,
    "daysOfWeek": List<dynamic>.from(daysOfWeek.map((x) => x)),
    "instructions": instructions,
    "reminderPreference": reminderPreference,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

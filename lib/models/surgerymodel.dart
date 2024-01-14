// To parse this JSON data, do
//
//     final surgeryModel = surgeryModelFromJson(jsonString);

import 'dart:convert';

List<SurgeryModel> surgeryModelFromJson(String str) => List<SurgeryModel>.from(json.decode(str).map((x) => SurgeryModel.fromJson(x)));

String surgeryModelToJson(List<SurgeryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurgeryModel {
  String id;
  String patientContactInformation;
  String patientId;
  String patientName;
  String lastName;
  DateTime patientDateOfBirth;
  String patientGender;
  String patientNationalId;
  String email;
  String status;
  String doctorName;
  List<dynamic> doctorSpecialization;
  String surgeryType;
  DateTime surgeryDate;
  String location;
  String siteid;
  String surgeryDescription;
  String preparationInstructions;
  String specialConsiderations;
  String surgeryModelId;
  String referenceNumber;
  List<String> participants;
  List<ResponsibleParticipant> responsibleParticipants;
  List<Allergy> allergies;
  List<Allergy> preOpMedications;
  String caseNumber;
  String createdAt;
  String updatedAt;
  int v;

  SurgeryModel({
    required this.id,
    required this.patientContactInformation,
    required this.patientId,
    required this.patientName,
    required this.lastName,
    required this.patientDateOfBirth,
    required this.patientGender,
    required this.patientNationalId,
    required this.email,
    required this.status,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.surgeryType,
    required this.surgeryDate,
    required this.location,
    required this.siteid,
    required this.surgeryDescription,
    required this.preparationInstructions,
    required this.specialConsiderations,
    required this.surgeryModelId,
    required this.referenceNumber,
    required this.participants,
    required this.responsibleParticipants,
    required this.allergies,
    required this.preOpMedications,
    required this.caseNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SurgeryModel.fromJson(Map<String, dynamic> json) => SurgeryModel(
    id: json["_id"],
    patientContactInformation: json["patientContactInformation"],
    patientId: json["patientId"],
    patientName: json["patientName"],
    lastName: json["last_name"],
    patientDateOfBirth: DateTime.parse(json["patientDateOfBirth"]),
    patientGender: json["patientGender"],
    patientNationalId: json["patientNationalId"],
    email: json["email"],
    status: json["status"],
    doctorName: json["doctorName"],
    doctorSpecialization: List<dynamic>.from(json["doctorSpecialization"].map((x) => x)),
    surgeryType: json["surgeryType"],
    surgeryDate: DateTime.parse(json["surgeryDate"]),
    location: json["location"],
    siteid: json["siteid"],
    surgeryDescription: json["surgeryDescription"],
    preparationInstructions: json["preparationInstructions"],
    specialConsiderations: json["specialConsiderations"],
    surgeryModelId: json["id"],
    referenceNumber: json["referenceNumber"],
    participants: List<String>.from(json["participants"].map((x) => x)),
    responsibleParticipants: List<ResponsibleParticipant>.from(json["responsibleParticipants"].map((x) => ResponsibleParticipant.fromJson(x))),
    allergies: List<Allergy>.from(json["allergies"].map((x) => Allergy.fromJson(x))),
    preOpMedications: List<Allergy>.from(json["preOpMedications"].map((x) => Allergy.fromJson(x))),
    caseNumber: json["case_number"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "patientContactInformation": patientContactInformation,
    "patientId": patientId,
    "patientName": patientName,
    "last_name": lastName,
    "patientDateOfBirth": "${patientDateOfBirth.year.toString().padLeft(4, '0')}-${patientDateOfBirth.month.toString().padLeft(2, '0')}-${patientDateOfBirth.day.toString().padLeft(2, '0')}",
    "patientGender": patientGender,
    "patientNationalId": patientNationalId,
    "email": email,
    "status": status,
    "doctorName": doctorName,
    "doctorSpecialization": List<dynamic>.from(doctorSpecialization.map((x) => x)),
    "surgeryType": surgeryType,
    "surgeryDate": "${surgeryDate.year.toString().padLeft(4, '0')}-${surgeryDate.month.toString().padLeft(2, '0')}-${surgeryDate.day.toString().padLeft(2, '0')}",
    "location": location,
    "siteid": siteid,
    "surgeryDescription": surgeryDescription,
    "preparationInstructions": preparationInstructions,
    "specialConsiderations": specialConsiderations,
    "id": surgeryModelId,
    "referenceNumber": referenceNumber,
    "participants": List<dynamic>.from(participants.map((x) => x)),
    "responsibleParticipants": List<dynamic>.from(responsibleParticipants.map((x) => x.toJson())),
    "allergies": List<dynamic>.from(allergies.map((x) => x.toJson())),
    "preOpMedications": List<dynamic>.from(preOpMedications.map((x) => x.toJson())),
    "case_number": caseNumber,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Allergy {
  int id;
  String date;

  Allergy({
    required this.id,
    required this.date,
  });

  factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
    id: json["id"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
  };
}

class ResponsibleParticipant {
  int id;
  String date;
  String doctor;
  String responsibility;

  ResponsibleParticipant({
    required this.id,
    required this.date,
    required this.doctor,
    required this.responsibility,
  });

  factory ResponsibleParticipant.fromJson(Map<String, dynamic> json) => ResponsibleParticipant(
    id: json["id"],
    date: json["date"],
    doctor: json["doctor"],
    responsibility: json["responsibility"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "doctor": doctor,
    "responsibility": responsibility,
  };
}

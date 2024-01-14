// To parse this JSON data, do
//
//     final prescriptionModel = prescriptionModelFromMap(jsonString);

import 'dart:convert';

List<PrescriptionModel> prescriptionModelFromMap(String str) => List<PrescriptionModel>.from(json.decode(str).map((x) => PrescriptionModel.fromMap(x)));

String prescriptionModelToMap(List<PrescriptionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PrescriptionModel {
  String id;
  String patientContactInformation;
  String patientId;
  String patientName;
  String lastName;
  String email;
  DateTime patientDateOfBirth;
  String patientGender;
  String patientNationalId;
  String status;
  String? appointmentid;
  String doctorName;
  List<dynamic> doctorSpecialization;
  List<PrescriptionDetail> prescriptionDetails;
  String? location;
  String? prescriptionType;
  String? nnotes;
  DateTime prescriptionDate;
  String? prescriptionModelId;
  String caseNumber;
  String createdAt;
  String updatedAt;
  int v;
  String? prescriptionCategory;
  String? diagnosis;
  String? admissionid;

  PrescriptionModel({
    required this.id,
    required this.patientContactInformation,
    required this.patientId,
    required this.patientName,
    required this.lastName,
    required this.email,
    required this.patientDateOfBirth,
    required this.patientGender,
    required this.patientNationalId,
    required this.status,
    this.appointmentid,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.prescriptionDetails,
    this.location,
    this.prescriptionType,
    this.nnotes,
    required this.prescriptionDate,
    this.prescriptionModelId,
    required this.caseNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.prescriptionCategory,
    this.diagnosis,
    this.admissionid,
  });

  factory PrescriptionModel.fromMap(Map<String, dynamic> json) => PrescriptionModel(
    id: json["_id"],
    patientContactInformation: json["patientContactInformation"],
    patientId: json["patientId"],
    patientName: json["patientName"],
    lastName: json["last_name"],
    email: json["email"],
    patientDateOfBirth: DateTime.parse(json["patientDateOfBirth"]),
    patientGender: json["patientGender"],
    patientNationalId: json["patientNationalId"],
    status: json["status"],
    appointmentid: json["appointmentid"],
    doctorName: json["doctorName"],
    doctorSpecialization: List<dynamic>.from(json["doctorSpecialization"].map((x) => x)),
    prescriptionDetails: List<PrescriptionDetail>.from(json["prescriptionDetails"].map((x) => PrescriptionDetail.fromMap(x))),
    location: json["location"],
    prescriptionType: json["prescriptionType"],
    nnotes: json["nnotes"],
    prescriptionDate: DateTime.parse(json["prescriptionDate"]),
    prescriptionModelId: json["id"],
    caseNumber: json["case_number"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    prescriptionCategory: json["prescriptionCategory"],
    diagnosis: json["diagnosis"],
    admissionid: json["admissionid"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "patientContactInformation": patientContactInformation,
    "patientId": patientId,
    "patientName": patientName,
    "last_name": lastName,
    "email": email,
    "patientDateOfBirth": "${patientDateOfBirth.year.toString().padLeft(4, '0')}-${patientDateOfBirth.month.toString().padLeft(2, '0')}-${patientDateOfBirth.day.toString().padLeft(2, '0')}",
    "patientGender": patientGender,
    "patientNationalId": patientNationalId,
    "status": status,
    "appointmentid": appointmentid,
    "doctorName": doctorName,
    "doctorSpecialization": List<dynamic>.from(doctorSpecialization.map((x) => x)),
    "prescriptionDetails": List<dynamic>.from(prescriptionDetails.map((x) => x.toMap())),
    "location": location,
    "prescriptionType": prescriptionType,
    "nnotes": nnotes,
    "prescriptionDate": "${prescriptionDate.year.toString().padLeft(4, '0')}-${prescriptionDate.month.toString().padLeft(2, '0')}-${prescriptionDate.day.toString().padLeft(2, '0')}",
    "id": prescriptionModelId,
    "case_number": caseNumber,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "prescriptionCategory": prescriptionCategory,
    "diagnosis": diagnosis,
    "admissionid": admissionid,
  };
}

class PrescriptionDetail {
  int id;
  String date;
  String medication;
  String indication;
  String? dosageType;
  String? dosage;
  String frequency;

  PrescriptionDetail({
    required this.id,
    required this.date,
    required this.medication,
    required this.indication,
    this.dosageType,
    this.dosage,
    required this.frequency,
  });

  factory PrescriptionDetail.fromMap(Map<String, dynamic> json) => PrescriptionDetail(
    id: json["id"],
    date: json["date"],
    medication: json["medication"],
    indication: json["indication"],
    dosageType: json["dosageType"],
    dosage: json["dosage"],
    frequency: json["frequency"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "date": date,
    "medication": medication,
    "indication": indication,
    "dosageType": dosageType,
    "dosage": dosage,
    "frequency": frequency,
  };
}

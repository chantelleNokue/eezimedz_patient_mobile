// To parse this JSON data, do
//
//     final doctorNotesModel = doctorNotesModelFromMap(jsonString);

import 'dart:convert';

DoctorNotesModel doctorNotesModelFromMap(String str) => DoctorNotesModel.fromMap(json.decode(str));

String doctorNotesModelToMap(DoctorNotesModel data) => json.encode(data.toMap());

class DoctorNotesModel {
  String id;
  String patientId;
  String date;
  String time;
  String note;
  String status;
  DateTime followUpDate;
  String disgnosis;
  String doctor;
  String noteId;
  String category;
  String patient;
  List<Medication> medications;
  String createdAt;
  String updatedAt;
  int v;

  DoctorNotesModel({
    required this.id,
    required this.patientId,
    required this.date,
    required this.time,
    required this.note,
    required this.status,
    required this.followUpDate,
    required this.disgnosis,
    required this.doctor,
    required this.noteId,
    required this.category,
    required this.patient,
    required this.medications,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory DoctorNotesModel.fromMap(Map<String, dynamic> json) => DoctorNotesModel(
    id: json["_id"],
    patientId: json["patientId"],
    date: json["date"],
    time: json["time"],
    note: json["note"],
    status: json["status"],
    followUpDate: DateTime.parse(json["followUpDate"]),
    disgnosis: json["disgnosis"],
    doctor: json["doctor"],
    noteId: json["noteId"],
    category: json["category"],
    patient: json["patient"],
    medications: List<Medication>.from(json["medications"].map((x) => Medication.fromMap(x))),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "patientId": patientId,
    "date": date,
    "time": time,
    "note": note,
    "status": status,
    "followUpDate": "${followUpDate.year.toString().padLeft(4, '0')}-${followUpDate.month.toString().padLeft(2, '0')}-${followUpDate.day.toString().padLeft(2, '0')}",
    "disgnosis": disgnosis,
    "doctor": doctor,
    "noteId": noteId,
    "category": category,
    "patient": patient,
    "medications": List<dynamic>.from(medications.map((x) => x.toMap())),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Medication {
  int id;
  String date;
  String name;
  String dosage;
  String frequency;

  Medication({
    required this.id,
    required this.date,
    required this.name,
    required this.dosage,
    required this.frequency,
  });

  factory Medication.fromMap(Map<String, dynamic> json) => Medication(
    id: json["id"],
    date: json["date"],
    name: json["name"],
    dosage: json["dosage"],
    frequency: json["frequency"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "date": date,
    "name": name,
    "dosage": dosage,
    "frequency": frequency,
  };
}

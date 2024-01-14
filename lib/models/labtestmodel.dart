// To parse this JSON data, do
//
//     final labtestModel = labtestModelFromJson(jsonString);

import 'dart:convert';

List<LabtestModel> labtestModelFromJson(String str) => List<LabtestModel>.from(json.decode(str).map((x) => LabtestModel.fromJson(x)));

String labtestModelToJson(List<LabtestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LabtestModel {
  String id;
  String patientContactInformation;
  String patientId;
  String patientName;
  String lastName;
  DateTime patientDateOfBirth;
  String patientGender;
  String email;
  String preferredDoctor;
  String patientNationalId;
  String status;
  String doctorName;
  List<dynamic> doctorSpecialization;
  String testId;
  List<Test> tests;
  String testName;
  String medicalCenter;
  DateTime date;
  String time;
  String labName;
  String labtestModelId;
  String casenumber;
  String siteid;
  String createdAt;
  String updatedAt;
  int v;

  LabtestModel({
    required this.id,
    required this.patientContactInformation,
    required this.patientId,
    required this.patientName,
    required this.lastName,
    required this.patientDateOfBirth,
    required this.patientGender,
    required this.email,
    required this.preferredDoctor,
    required this.patientNationalId,
    required this.status,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.testId,
    required this.tests,
    required this.testName,
    required this.medicalCenter,
    required this.date,
    required this.time,
    required this.labName,
    required this.labtestModelId,
    required this.casenumber,
    required this.siteid,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory LabtestModel.fromJson(Map<String, dynamic> json) => LabtestModel(
    id: json["_id"],
    patientContactInformation: json["patientContactInformation"],
    patientId: json["patientId"],
    patientName: json["patientName"],
    lastName: json["last_name"],
    patientDateOfBirth: DateTime.parse(json["patientDateOfBirth"]),
    patientGender: json["patientGender"],
    email: json["email"],
    preferredDoctor: json["preferredDoctor"],
    patientNationalId: json["patientNationalId"],
    status: json["status"],
    doctorName: json["doctorName"],
    doctorSpecialization: List<dynamic>.from(json["doctorSpecialization"].map((x) => x)),
    testId: json["testId"],
    tests: List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
    testName: json["testName"],
    medicalCenter: json["medicalCenter"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    labName: json["labName"],
    labtestModelId: json["id"],
    casenumber: json["casenumber"],
    siteid: json["siteid"],
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
    "email": email,
    "preferredDoctor": preferredDoctor,
    "patientNationalId": patientNationalId,
    "status": status,
    "doctorName": doctorName,
    "doctorSpecialization": List<dynamic>.from(doctorSpecialization.map((x) => x)),
    "testId": testId,
    "tests": List<dynamic>.from(tests.map((x) => x.toJson())),
    "testName": testName,
    "medicalCenter": medicalCenter,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
    "labName": labName,
    "id": labtestModelId,
    "casenumber": casenumber,
    "siteid": siteid,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Test {
  int id;
  String date;
  String testName;

  Test({
    required this.id,
    required this.date,
    required this.testName,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    id: json["id"],
    date: json["date"],
    testName: json["testName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "testName": testName,
  };
}

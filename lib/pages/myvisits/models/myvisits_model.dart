// To parse this JSON data, do
//
//     final myVisitsModel = myVisitsModelFromMap(jsonString);

import 'dart:convert';

List<MyVisitsModel> myVisitsModelFromMap(String str) => List<MyVisitsModel>.from(json.decode(str).map((x) => MyVisitsModel.fromMap(x)));

String myVisitsModelToMap(List<MyVisitsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class MyVisitsModel {
  String id;
  String myVisitsModelId;
  String patientId;
  String patientName;
  String email;
  String gender;
  int age;
  DateTime checkInDate;
  String checkInTime;
  String visitType;
  String description;
  String location;
  String physician;
  int systolicBp;
  int temperature;
  int weight;
  int diastolicBp;
  int height;
  int bmi;
  int respiratoryRate;
  int heartRate;
  String avpuStatus;
  String status;
  List<Allergy> allergies;
  List<Immunization> immunizations;
  String casenumber;
  String createdAt;
  String updatedAt;
  int v;

  MyVisitsModel({
    required this.id,
    required this.myVisitsModelId,
    required this.patientId,
    required this.patientName,
    required this.email,
    required this.gender,
    required this.age,
    required this.checkInDate,
    required this.checkInTime,
    required this.visitType,
    required this.description,
    required this.location,
    required this.physician,
    required this.systolicBp,
    required this.temperature,
    required this.weight,
    required this.diastolicBp,
    required this.height,
    required this.bmi,
    required this.respiratoryRate,
    required this.heartRate,
    required this.avpuStatus,
    required this.status,
    required this.allergies,
    required this.immunizations,
    required this.casenumber,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory MyVisitsModel.fromMap(Map<String, dynamic> json) => MyVisitsModel(
    id: json["_id"],
    myVisitsModelId: json["id"],
    patientId: json["patientId"],
    patientName: json["patientName"],
    email: json["email"],
    gender: json["gender"],
    age: json["age"],
    checkInDate: DateTime.parse(json["checkInDate"]),
    checkInTime: json["checkInTime"],
    visitType: json["visitType"],
    description: json["description"],
    location: json["location"],
    physician: json["physician"],
    systolicBp: json["systolicBP"],
    temperature: json["temperature"],
    weight: json["weight"],
    diastolicBp: json["diastolicBP"],
    height: json["height"],
    bmi: json["bmi"],
    respiratoryRate: json["respiratoryRate"],
    heartRate: json["heartRate"],
    avpuStatus: json["avpuStatus"],
    status: json["status"],
    allergies: List<Allergy>.from(json["allergies"].map((x) => Allergy.fromMap(x))),
    immunizations: List<Immunization>.from(json["immunizations"].map((x) => Immunization.fromMap(x))),
    casenumber: json["casenumber"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "id": myVisitsModelId,
    "patientId": patientId,
    "patientName": patientName,
    "email": email,
    "gender": gender,
    "age": age,
    "checkInDate": "${checkInDate.year.toString().padLeft(4, '0')}-${checkInDate.month.toString().padLeft(2, '0')}-${checkInDate.day.toString().padLeft(2, '0')}",
    "checkInTime": checkInTime,
    "visitType": visitType,
    "description": description,
    "location": location,
    "physician": physician,
    "systolicBP": systolicBp,
    "temperature": temperature,
    "weight": weight,
    "diastolicBP": diastolicBp,
    "height": height,
    "bmi": bmi,
    "respiratoryRate": respiratoryRate,
    "heartRate": heartRate,
    "avpuStatus": avpuStatus,
    "status": status,
    "allergies": List<dynamic>.from(allergies.map((x) => x.toMap())),
    "immunizations": List<dynamic>.from(immunizations.map((x) => x.toMap())),
    "casenumber": casenumber,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class Allergy {
  String id;
  String type;
  String allergen;
  String reaction;

  Allergy({
    required this.id,
    required this.type,
    required this.allergen,
    required this.reaction,
  });

  factory Allergy.fromMap(Map<String, dynamic> json) => Allergy(
    id: json["id"],
    type: json["type"],
    allergen: json["allergen"],
    reaction: json["reaction"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
    "allergen": allergen,
    "reaction": reaction,
  };
}

class Immunization {
  String id;
  String type;
  DateTime date;

  Immunization({
    required this.id,
    required this.type,
    required this.date,
  });

  factory Immunization.fromMap(Map<String, dynamic> json) => Immunization(
    id: json["id"],
    type: json["type"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
  };
}

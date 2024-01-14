import 'dart:convert';

class Prescription {
  final String dosage;
  final String dosageType;

  Prescription({
    required this.dosage,
    required this.dosageType,
});
}


// To parse this JSON data, do
//
//     final labtest = labtestFromJson(jsonString);



List<Labtest> labtestFromJson(String str) => List<Labtest>.from(json.decode(str).map((x) => Labtest.fromJson(x)));

String labtestToJson(List<Labtest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Labtest {
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
  String doctorId;
  String doctorName;
  List<String> doctorSpecialization;
  String doctorContactInformation;
  List<PrescriptionDetail> prescriptionDetails;
  String? location;
  String? prescriptionType;
  String? nnotes;
  DateTime prescriptionDate;
  String? labtestId;
  PrescriptionDocument? prescriptionDocument;
  String caseNumber;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? appointmentid;
  String? prescriptionCategory;
  String? visitid;

  Labtest({
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
    required this.doctorId,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.doctorContactInformation,
    required this.prescriptionDetails,
    this.location,
    this.prescriptionType,
    this.nnotes,
    required this.prescriptionDate,
    this.labtestId,
    this.prescriptionDocument,
    required this.caseNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.appointmentid,
    this.prescriptionCategory,
    this.visitid,
  });

  factory Labtest.fromJson(Map<String, dynamic> json) => Labtest(
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
    doctorId: json["doctorId"],
    doctorName: json["doctorName"],
    doctorSpecialization: List<String>.from(json["doctorSpecialization"].map((x) => x)),
    doctorContactInformation: json["doctorContactInformation"],
    prescriptionDetails: List<PrescriptionDetail>.from(json["prescriptionDetails"].map((x) => PrescriptionDetail.fromJson(x))),
    location: json["location"],
    prescriptionType: json["prescriptionType"],
    nnotes: json["nnotes"],
    prescriptionDate: DateTime.parse(json["prescriptionDate"]),
    labtestId: json["id"],
    prescriptionDocument: json["prescriptionDocument"] == null ? null : PrescriptionDocument.fromJson(json["prescriptionDocument"]),
    caseNumber: json["case_number"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    appointmentid: json["appointmentid"],
    prescriptionCategory: json["prescriptionCategory"],
    visitid: json["visitid"],
  );

  Map<String, dynamic> toJson() => {
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
    "doctorId": doctorId,
    "doctorName": doctorName,
    "doctorSpecialization": List<dynamic>.from(doctorSpecialization.map((x) => x)),
    "doctorContactInformation": doctorContactInformation,
    "prescriptionDetails": List<dynamic>.from(prescriptionDetails.map((x) => x.toJson())),
    "location": location,
    "prescriptionType": prescriptionType,
    "nnotes": nnotes,
    "prescriptionDate": "${prescriptionDate.year.toString().padLeft(4, '0')}-${prescriptionDate.month.toString().padLeft(2, '0')}-${prescriptionDate.day.toString().padLeft(2, '0')}",
    "id": labtestId,
    "prescriptionDocument": prescriptionDocument?.toJson(),
    "case_number": caseNumber,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "appointmentid": appointmentid,
    "prescriptionCategory": prescriptionCategory,
    "visitid": visitid,
  };
}

class PrescriptionDetail {
  int id;
  String date;
  String medication;
  Indication indication;
  String dosageType;
  String dosage;
  String frequency;

  PrescriptionDetail({
    required this.id,
    required this.date,
    required this.medication,
    required this.indication,
    required this.dosageType,
    required this.dosage,
    required this.frequency,
  });

  factory PrescriptionDetail.fromJson(Map<String, dynamic> json) => PrescriptionDetail(
    id: json["id"],
    date: json["date"],
    medication: json["medication"],
    indication: indicationValues.map[json["indication"]]!,
    dosageType: json["dosageType"],
    dosage: json["dosage"],
    frequency: json["frequency"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "medication": medication,
    "indication": indicationValues.reverse[indication],
    "dosageType": dosageType,
    "dosage": dosage,
    "frequency": frequency,
  };
}

enum Indication {
  INDICATION,
  SDFG,
  WHITE
}

final indicationValues = EnumValues({
  "indication": Indication.INDICATION,
  "sdfg": Indication.SDFG,
  "white": Indication.WHITE
});

class PrescriptionDocument {
  String documentname;

  PrescriptionDocument({
    required this.documentname,
  });

  factory PrescriptionDocument.fromJson(Map<String, dynamic> json) => PrescriptionDocument(
    documentname: json["documentname"],
  );

  Map<String, dynamic> toJson() => {
    "documentname": documentname,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

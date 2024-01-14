// To parse this JSON data, do
//
//     final admissionModel = admissionModelFromMap(jsonString);

import 'dart:convert';

List<AdmissionModel> admissionModelFromMap(String str) => List<AdmissionModel>.from(json.decode(str).map((x) => AdmissionModel.fromMap(x)));

String admissionModelToMap(List<AdmissionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class AdmissionModel {
  String id;
  String patientname;
  String patientId;
  String patientidnumber;
  String email;
  String patientadmissiondate;
  String admissionType;
  String reason;
  String comment;
  String patienttype;
  String status;
  String location;
  String bedNumber;
  String assignedDoctor;
  String doctorid;
  String assignedNurse;
  String division;
  String gender;
  DateTime dateOfBirth;
  String siteid;
  String caseNumber;
  List<Allergy> allergies;
  List<Immunization> immunizations;
  VitalSigns vitalSigns;
  PaymentDetails paymentDetails;
  String readmission;
  String lateAdmissionRecord;
  String reasonForLateRecord;
  String hasAppointment;
  String admissionCentre;
  String createdAt;
  String updatedAt;
  int v;
  DischargeDetails? dischargeDetails;

  AdmissionModel({
    required this.id,
    required this.patientname,
    required this.patientId,
    required this.patientidnumber,
    required this.email,
    required this.patientadmissiondate,
    required this.admissionType,
    required this.reason,
    required this.comment,
    required this.patienttype,
    required this.status,
    required this.location,
    required this.bedNumber,
    required this.assignedDoctor,
    required this.doctorid,
    required this.assignedNurse,
    required this.division,
    required this.gender,
    required this.dateOfBirth,
    required this.siteid,
    required this.caseNumber,
    required this.allergies,
    required this.immunizations,
    required this.vitalSigns,
    required this.paymentDetails,
    required this.readmission,
    required this.lateAdmissionRecord,
    required this.reasonForLateRecord,
    required this.hasAppointment,
    required this.admissionCentre,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.dischargeDetails,
  });

  factory AdmissionModel.fromMap(Map<String, dynamic> json) => AdmissionModel(
    id: json["_id"],
    patientname: json["patientname"],
    patientId: json["patientId"],
    patientidnumber: json["patientidnumber"],
    email: json["email"],
    patientadmissiondate: json["patientadmissiondate"],
    admissionType: json["admissionType"],
    reason: json["reason"],
    comment: json["comment"],
    patienttype: json["patienttype"],
    status: json["status"],
    location: json["location"],
    bedNumber: json["bedNumber"],
    assignedDoctor: json["assignedDoctor"],
    doctorid: json["doctorid"],
    assignedNurse: json["assignedNurse"],
    division: json["division"],
    gender: json["gender"],
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    siteid: json["siteid"],
    caseNumber: json["caseNumber"],
    allergies: List<Allergy>.from(json["allergies"].map((x) => Allergy.fromMap(x))),
    immunizations: List<Immunization>.from(json["immunizations"].map((x) => Immunization.fromMap(x))),
    vitalSigns: VitalSigns.fromMap(json["vitalSigns"]),
    paymentDetails: PaymentDetails.fromMap(json["paymentDetails"]),
    readmission: json["readmission"],
    lateAdmissionRecord: json["lateAdmissionRecord"],
    reasonForLateRecord: json["reasonForLateRecord"],
    hasAppointment: json["hasAppointment"],
    admissionCentre: json["admissionCentre"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    dischargeDetails: json["dischargeDetails"] == null ? null : DischargeDetails.fromMap(json["dischargeDetails"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "patientname": patientname,
    "patientId": patientId,
    "patientidnumber": patientidnumber,
    "email": email,
    "patientadmissiondate": patientadmissiondate,
    "admissionType": admissionType,
    "reason": reason,
    "comment": comment,
    "patienttype": patienttype,
    "status": status,
    "location": location,
    "bedNumber": bedNumber,
    "assignedDoctor": assignedDoctor,
    "doctorid": doctorid,
    "assignedNurse": assignedNurse,
    "division": division,
    "gender": gender,
    "dateOfBirth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "siteid": siteid,
    "caseNumber": caseNumber,
    "allergies": List<dynamic>.from(allergies.map((x) => x.toMap())),
    "immunizations": List<dynamic>.from(immunizations.map((x) => x.toMap())),
    "vitalSigns": vitalSigns.toMap(),
    "paymentDetails": paymentDetails.toMap(),
    "readmission": readmission,
    "lateAdmissionRecord": lateAdmissionRecord,
    "reasonForLateRecord": reasonForLateRecord,
    "hasAppointment": hasAppointment,
    "admissionCentre": admissionCentre,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "dischargeDetails": dischargeDetails?.toMap(),
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

class DischargeDetails {
  String reason;
  DateTime date;

  DischargeDetails({
    required this.reason,
    required this.date,
  });

  factory DischargeDetails.fromMap(Map<String, dynamic> json) => DischargeDetails(
    reason: json["reason"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "reason": reason,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
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

class PaymentDetails {
  String paymentMethod;
  String? currency;
  int amount;
  String payerName;

  PaymentDetails({
    required this.paymentMethod,
    this.currency,
    required this.amount,
    required this.payerName,
  });

  factory PaymentDetails.fromMap(Map<String, dynamic> json) => PaymentDetails(
    paymentMethod: json["paymentMethod"],
    currency: json["currency"],
    amount: json["amount"],
    payerName: json["payerName"],
  );

  Map<String, dynamic> toMap() => {
    "paymentMethod": paymentMethod,
    "currency": currency,
    "amount": amount,
    "payerName": payerName,
  };
}

class VitalSigns {
  Vitals vitals;

  VitalSigns({
    required this.vitals,
  });

  factory VitalSigns.fromMap(Map<String, dynamic> json) => VitalSigns(
    vitals: Vitals.fromMap(json["vitals"]),
  );

  Map<String, dynamic> toMap() => {
    "vitals": vitals.toMap(),
  };
}

class Vitals {
  DateTime? captureDate;
  String? captureTime;
  String temperature;
  String resp;
  String weight;
  String height;
  String bmi;
  String bloodPressure;
  String bloodSugar;
  String heartRate;
  String pulse;

  Vitals({
    this.captureDate,
    this.captureTime,
    required this.temperature,
    required this.resp,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.bloodPressure,
    required this.bloodSugar,
    required this.heartRate,
    required this.pulse,
  });

  factory Vitals.fromMap(Map<String, dynamic> json) => Vitals(
    captureDate: json["captureDate"] == null ? null : DateTime.parse(json["captureDate"]),
    captureTime: json["captureTime"],
    temperature: json["temperature"],
    resp: json["resp"],
    weight: json["weight"],
    height: json["height"],
    bmi: json["bmi"],
    bloodPressure: json["bloodPressure"],
    bloodSugar: json["bloodSugar"],
    heartRate: json["heartRate"],
    pulse: json["pulse"],
  );

  Map<String, dynamic> toMap() => {
    "captureDate": "${captureDate!.year.toString().padLeft(4, '0')}-${captureDate!.month.toString().padLeft(2, '0')}-${captureDate!.day.toString().padLeft(2, '0')}",
    "captureTime": captureTime,
    "temperature": temperature,
    "resp": resp,
    "weight": weight,
    "height": height,
    "bmi": bmi,
    "bloodPressure": bloodPressure,
    "bloodSugar": bloodSugar,
    "heartRate": heartRate,
    "pulse": pulse,
  };
}

// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromMap(jsonString);

import 'dart:convert';

List<PaymentModel> paymentModelFromMap(String str) => List<PaymentModel>.from(json.decode(str).map((x) => PaymentModel.fromMap(x)));

String paymentModelToMap(List<PaymentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PaymentModel {
  String id;
  String reason;
  DateTime dateOfPayment;
  String? department;
  String amount;
  String paymentType;
  String invoiceNumber;
  String customerName;
  String paymentReference;
  String location;
  String comment;
  String currency;
  String patientId;
  String doctorId;
  int v;
  String createdAt;
  String updatedAt;
  String? invoiceCurrency;
  String? invoiceAmount;
  String? paymentAmount;
  String? paymentCurrency;
  String? modifier;

  PaymentModel({
    required this.id,
    required this.reason,
    required this.dateOfPayment,
    this.department,
    required this.amount,
    required this.paymentType,
    required this.invoiceNumber,
    required this.customerName,
    required this.paymentReference,
    required this.location,
    required this.comment,
    required this.currency,
    required this.patientId,
    required this.doctorId,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    this.invoiceCurrency,
    this.invoiceAmount,
    this.paymentAmount,
    this.paymentCurrency,
    this.modifier,
  });

  factory PaymentModel.fromMap(Map<String, dynamic> json) => PaymentModel(
    id: json["_id"],
    reason: json["reason"],
    dateOfPayment: DateTime.parse(json["dateOfPayment"]),
    department: json["department"],
    amount: json["amount"],
    paymentType: json["paymentType"],
    invoiceNumber: json["invoiceNumber"],
    customerName: json["customerName"],
    paymentReference: json["paymentReference"],
    location: json["location"],
    comment: json["comment"],
    currency: json["currency"],
    patientId: json["patientId"],
    doctorId: json["doctorId"],
    v: json["__v"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    invoiceCurrency: json["invoiceCurrency"],
    invoiceAmount: json["invoiceAmount"],
    paymentAmount: json["paymentAmount"],
    paymentCurrency: json["paymentCurrency"],
    modifier: json["modifier"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "reason": reason,
    "dateOfPayment": "${dateOfPayment.year.toString().padLeft(4, '0')}-${dateOfPayment.month.toString().padLeft(2, '0')}-${dateOfPayment.day.toString().padLeft(2, '0')}",
    "department": department,
    "amount": amount,
    "paymentType": paymentType,
    "invoiceNumber": invoiceNumber,
    "customerName": customerName,
    "paymentReference": paymentReference,
    "location": location,
    "comment": comment,
    "currency": currency,
    "patientId": patientId,
    "doctorId": doctorId,
    "__v": v,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "invoiceCurrency": invoiceCurrency,
    "invoiceAmount": invoiceAmount,
    "paymentAmount": paymentAmount,
    "paymentCurrency": paymentCurrency,
    "modifier": modifier,
  };
}

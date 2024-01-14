// To parse this JSON data, do
//
//     final invoicesModel = invoicesModelFromJson(jsonString);

import 'dart:convert';

List<InvoicesModel> invoicesModelFromJson(String str) => List<InvoicesModel>.from(json.decode(str).map((x) => InvoicesModel.fromJson(x)));

String invoicesModelToJson(List<InvoicesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvoicesModel {
  String id;
  InvoiceDetails invoiceDetails;
  Statuses statuses;
  String createdAt;
  String updatedAt;
  int v;

  InvoicesModel({
    required this.id,
    required this.invoiceDetails,
    required this.statuses,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory InvoicesModel.fromJson(Map<String, dynamic> json) => InvoicesModel(
    id: json["_id"],
    invoiceDetails: InvoiceDetails.fromJson(json["invoice-details"]),
    statuses: Statuses.fromJson(json["statuses"]),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "invoice-details": invoiceDetails.toJson(),
    "statuses": statuses.toJson(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class InvoiceDetails {
  String invoiceid;
  String patientContactInformation;
  String patientId;
  String patientFirstName;
  String patientlastName;
  DateTime patientDateOfBirth;
  String patientGender;
  String patientNationalId;
  DateTime invoiceDate;
  String paymentReference;
  String dueDate;
  List<Product> products;
  int? tax;
  int subtotal;
  double total;
  String location;
  String doctorid;
  String casenumber;
  String patientFullName;
  String currencyCode;
  String? invoiceType;
  String patientEmailAddress;
  String? quotationnumber;
  String? invoiceStatus;
  double? discountTotal;

  InvoiceDetails({
    required this.invoiceid,
    required this.patientContactInformation,
    required this.patientId,
    required this.patientFirstName,
    required this.patientlastName,
    required this.patientDateOfBirth,
    required this.patientGender,
    required this.patientNationalId,
    required this.invoiceDate,
    required this.paymentReference,
    required this.dueDate,
    required this.products,
    this.tax,
    required this.subtotal,
    required this.total,
    required this.location,
    required this.doctorid,
    required this.casenumber,
    required this.patientFullName,
    required this.currencyCode,
    this.invoiceType,
    required this.patientEmailAddress,
    this.quotationnumber,
    this.invoiceStatus,
    this.discountTotal,
  });

  factory InvoiceDetails.fromJson(Map<String, dynamic> json) => InvoiceDetails(
    invoiceid: json["invoiceid"],
    patientContactInformation: json["patientContactInformation"],
    patientId: json["patientId"],
    patientFirstName: json["patientFirstName"],
    patientlastName: json["patientlastName"],
    patientDateOfBirth: DateTime.parse(json["patientDateOfBirth"]),
    patientGender: json["patientGender"],
    patientNationalId: json["patientNationalId"],
    invoiceDate: DateTime.parse(json["invoiceDate"]),
    paymentReference: json["paymentReference"],
    dueDate: json["dueDate"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    tax: json["tax"],
    subtotal: json["subtotal"],
    total: json["total"]?.toDouble(),
    location: json["location"],
    doctorid: json["doctorid"],
    casenumber: json["casenumber"],
    patientFullName: json["patientFullName"],
    currencyCode: json["currencyCode"],
    invoiceType: json["invoiceType"],
    patientEmailAddress: json["patientEmailAddress"],
    quotationnumber: json["quotationnumber"],
    invoiceStatus: json["invoiceStatus"],
    discountTotal: json["discountTotal"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "invoiceid": invoiceid,
    "patientContactInformation": patientContactInformation,
    "patientId": patientId,
    "patientFirstName": patientFirstName,
    "patientlastName": patientlastName,
    "patientDateOfBirth": "${patientDateOfBirth.year.toString().padLeft(4, '0')}-${patientDateOfBirth.month.toString().padLeft(2, '0')}-${patientDateOfBirth.day.toString().padLeft(2, '0')}",
    "patientGender": patientGender,
    "patientNationalId": patientNationalId,
    "invoiceDate": "${invoiceDate.year.toString().padLeft(4, '0')}-${invoiceDate.month.toString().padLeft(2, '0')}-${invoiceDate.day.toString().padLeft(2, '0')}",
    "paymentReference": paymentReference,
    "dueDate": dueDate,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "tax": tax,
    "subtotal": subtotal,
    "total": total,
    "location": location,
    "doctorid": doctorid,
    "casenumber": casenumber,
    "patientFullName": patientFullName,
    "currencyCode": currencyCode,
    "invoiceType": invoiceType,
    "patientEmailAddress": patientEmailAddress,
    "quotationnumber": quotationnumber,
    "invoiceStatus": invoiceStatus,
    "discountTotal": discountTotal,
  };
}

class Product {
  String name;
  int price;
  int tax;
  int quantity;
  int discount;

  Product({
    required this.name,
    required this.price,
    required this.tax,
    required this.quantity,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    price: json["price"],
    tax: json["tax"],
    quantity: json["quantity"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "tax": tax,
    "quantity": quantity,
    "discount": discount,
  };
}

class Statuses {
  String status;

  Statuses({
    required this.status,
  });

  factory Statuses.fromJson(Map<String, dynamic> json) => Statuses(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

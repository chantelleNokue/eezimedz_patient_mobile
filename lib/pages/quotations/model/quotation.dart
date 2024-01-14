// To parse this JSON data, do
//
//     final quotationModel = quotationModelFromMap(jsonString);

import 'dart:convert';

List<QuotationModel> quotationModelFromMap(String str) => List<QuotationModel>.from(json.decode(str).map((x) => QuotationModel.fromMap(x)));

String quotationModelToMap(List<QuotationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class QuotationModel {
  String id;
  QuotationDetails quotationDetails;
  Statuses statuses;
  String createdAt;
  String updatedAt;
  int v;

  QuotationModel({
    required this.id,
    required this.quotationDetails,
    required this.statuses,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory QuotationModel.fromMap(Map<String, dynamic> json) => QuotationModel(
    id: json["_id"],
    quotationDetails: QuotationDetails.fromMap(json["quotation-details"]),
    statuses: Statuses.fromMap(json["statuses"]),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "quotation-details": quotationDetails.toMap(),
    "statuses": statuses.toMap(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class QuotationDetails {
  String patientContactInformation;
  String patientEmailAddress;
  String patientId;
  String patientName;
  String lastName;
  DateTime patientDateOfBirth;
  String patientGender;
  String patientNationalId;
  String status;
  String id;
  String invoiceDate;
  String paymentReference;
  String dueDate;
  List<Product> products;
  int tax;
  int subtotal;
  double total;
  double? discountTotal;
  String currency;
  String generatedRef;
  String casenumber;
  String currencyCode;
  String expiryDate;
  String? location;
  String? doctorid;
  String? invoiceType;

  QuotationDetails({
    required this.patientContactInformation,
    required this.patientEmailAddress,
    required this.patientId,
    required this.patientName,
    required this.lastName,
    required this.patientDateOfBirth,
    required this.patientGender,
    required this.patientNationalId,
    required this.status,
    required this.id,
    required this.invoiceDate,
    required this.paymentReference,
    required this.dueDate,
    required this.products,
    required this.tax,
    required this.subtotal,
    required this.total,
    this.discountTotal,
    required this.currency,
    required this.generatedRef,
    required this.casenumber,
    required this.currencyCode,
    required this.expiryDate,
    this.location,
    this.doctorid,
    this.invoiceType,
  });

  factory QuotationDetails.fromMap(Map<String, dynamic> json) => QuotationDetails(
    patientContactInformation: json["patientContactInformation"],
    patientEmailAddress: json["patientEmailAddress"],
    patientId: json["patientId"],
    patientName: json["patientName"],
    lastName: json["last_name"],
    patientDateOfBirth: DateTime.parse(json["patientDateOfBirth"]),
    patientGender: json["patientGender"],
    patientNationalId: json["patientNationalId"],
    status: json["status"],
    id: json["id"],
    invoiceDate: json["invoiceDate"],
    paymentReference: json["paymentReference"],
    dueDate: json["dueDate"],
    products: List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
    tax: json["tax"],
    subtotal: json["subtotal"],
    total: json["total"]?.toDouble(),
    discountTotal: json["discountTotal"]?.toDouble(),
    currency: json["currency"],
    generatedRef: json["generatedRef"],
    casenumber: json["casenumber"],
    currencyCode: json["currencyCode"],
    expiryDate: json["expiryDate"],
    location: json["location"],
    doctorid: json["doctorid"],
    invoiceType: json["invoiceType"],
  );

  Map<String, dynamic> toMap() => {
    "patientContactInformation": patientContactInformation,
    "patientEmailAddress": patientEmailAddress,
    "patientId": patientId,
    "patientName": patientName,
    "last_name": lastName,
    "patientDateOfBirth": "${patientDateOfBirth.year.toString().padLeft(4, '0')}-${patientDateOfBirth.month.toString().padLeft(2, '0')}-${patientDateOfBirth.day.toString().padLeft(2, '0')}",
    "patientGender": patientGender,
    "patientNationalId": patientNationalId,
    "status": status,
    "id": id,
    "invoiceDate": invoiceDate,
    "paymentReference": paymentReference,
    "dueDate": dueDate,
    "products": List<dynamic>.from(products.map((x) => x.toMap())),
    "tax": tax,
    "subtotal": subtotal,
    "total": total,
    "discountTotal": discountTotal,
    "currency": currency,
    "generatedRef": generatedRef,
    "casenumber": casenumber,
    "currencyCode": currencyCode,
    "expiryDate": expiryDate,
    "location": location,
    "doctorid": doctorid,
    "invoiceType": invoiceType,
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

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    name: json["name"],
    price: json["price"],
    tax: json["tax"],
    quantity: json["quantity"],
    discount: json["discount"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "price": price,
    "tax": tax,
    "quantity": quantity,
    "discount": discount,
  };
}

class Statuses {
  String status;
  String? comment;
  String? selectedReason;

  Statuses({
    required this.status,
    this.comment,
    this.selectedReason,
  });

  factory Statuses.fromMap(Map<String, dynamic> json) => Statuses(
    status: json["status"],
    comment: json["comment"],
    selectedReason: json["selectedReason"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "comment": comment,
    "selectedReason": selectedReason,
  };
}

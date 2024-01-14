// To parse this JSON data, do
//
//     final mockModel = mockModelFromMap(jsonString);

import 'dart:convert';

MockModel mockModelFromMap(String str) => MockModel.fromMap(json.decode(str));

String mockModelToMap(MockModel data) => json.encode(data.toMap());

class MockModel {
  String imagePath;
  String description;
  String dosage;
  String medicineName;
  String purpose;
  String price;
  String numberOfPacks;

  MockModel({
    required this.imagePath,
    required this.description,
    required this.dosage,
    required this.medicineName,
    required this.purpose,
    required this.price,
    required this.numberOfPacks,
  });

  factory MockModel.fromMap(Map<String, dynamic> json) => MockModel(
        imagePath: json["imagePath"],
        description: json["description"],
        dosage: json["dosage"],
        medicineName: json["medicineName"],
        purpose: json["purpose"],
        price: json["price"],
        numberOfPacks: json["numberOfPacks"],
      );

  Map<String, dynamic> toMap() => {
        "imagePath": imagePath,
        "description": description,
        "dosage": dosage,
        "medicineName": medicineName,
        "purpose": purpose,
        "price": price,
        "numberOfPacks": numberOfPacks,
      };
}

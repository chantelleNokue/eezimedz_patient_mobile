// To parse this JSON data, do
//
//     final documentsModel = documentsModelFromJson(jsonString);

import 'dart:convert';

List<DocumentsModel> documentsModelFromJson(String str) => List<DocumentsModel>.from(json.decode(str).map((x) => DocumentsModel.fromJson(x)));

String documentsModelToJson(List<DocumentsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DocumentsModel {
  String name;

  DocumentsModel({
    required this.name,
  });

  factory DocumentsModel.fromJson(Map<String, dynamic> json) => DocumentsModel(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

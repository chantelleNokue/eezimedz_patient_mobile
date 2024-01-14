import 'package:hive/hive.dart';
import 'dart:convert';


List<HiveAppointmentModel> hiveAppointmentModelFromJson(String str) => List<HiveAppointmentModel>.from(json.decode(str).map((x) => HiveAppointmentModel.fromJson(x)));


@HiveType(typeId: 0,)
class HiveAppointmentModel extends HiveObject{
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? phone_number;

  @HiveField(2)
  final String? patient_id;

  @HiveField(3)
  final String? first_name;

  @HiveField(4)
  final String? last_name;

  @HiveField(5)
  final String? date_of_birth;

  @HiveField(6)
  final String? email;

  @HiveField(7)
  final String? gender;

  @HiveField(8)
  final String? national_id;

  @HiveField(9)
  final String? medical_center;

  @HiveField(10)
  final String? applied_service;

  @HiveField(11)
  final String? department;

  @HiveField(12)
  final String? procedure;

  @HiveField(13)
  final String? preferred_appointment_date;

  @HiveField(14)
  final String? preferred_appointment_time;

  @HiveField(15)
  final String? backup_date;

  @HiveField(16)
  final String? backup_time;

  @HiveField(17)
  final String? appointmentid;

  @HiveField(18)
  final String? preferredDoctor;

  @HiveField(19)
  final String? service_provider;

  @HiveField(20)
  final String? status;

  @HiveField(21)
  final String? createdAt;

  @HiveField(22)
  final String? updatedAt;

  factory HiveAppointmentModel.fromJson(Map<String, dynamic> json) {
    return HiveAppointmentModel(
      json['id'] as String?,
      json['phone_number'] as String?,
      json['patient_id'] as String?,
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['date_of_birth'] as String?,
      json['email'] as String?,
      json['gender'] as String?,
      json['national_id'] as String?,
      json['medical_center'] as String?,
      json['applied_service'] as String?,
      json['department'] as String?,
      json['procedure'] as String?,
      json['preferred_appointment_date'] as String?,
      json['preferred_appointment_time'] as String?,
      json['backup_date'] as String?,
      json['backup_time'] as String?,
      json['appointmentid'] as String?,
      json['preferredDoctor'] as String?,
      json['service_provider'] as String?,
      json['status'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );
  }

  HiveAppointmentModel(
      this.id,
      this.phone_number,
      this.patient_id,
      this.first_name,
      this.last_name,
      this.date_of_birth,
      this.email,
      this.gender,
      this.national_id,
      this.medical_center,
      this.applied_service,
      this.department,
      this.procedure,
      this.preferred_appointment_date,
      this.preferred_appointment_time,
      this.backup_date,
      this.backup_time,
      this.appointmentid,
      this.preferredDoctor,
      this.service_provider,
      this.status,
      this.createdAt,
      this.updatedAt,
      );
}


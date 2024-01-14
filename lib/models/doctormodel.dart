// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

List<DoctorModel> doctorModelFromJson(String str) => List<DoctorModel>.from(json.decode(str).map((x) => DoctorModel.fromJson(x)));

String doctorModelToJson(List<DoctorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorModel {
  String id;
  PersonalDetails personalDetails;
  ContactDetails contactDetails;
  DoctorModelIdentityDetails identityDetails;
  QualificationsDetails qualificationsDetails;
  int v;
  String updatedAt;
  List<DoctorBookingSlot> doctorBookingSlots;
  OutOfOfficeClass? doctorModelOutOfOffice;
  EmploymentDetails? employmentDetails;
  List<DoctorAppointmentElement>? doctorModelDoctorAppointments;
  List<Communication> communications;
  dynamic documents;
  SpecialtyDetails specialtyDetails;
  dynamic experienceDetails;
  String? createdAt;
  OutOfOffice? outOfOffice;
  List<DoctorAppointment>? doctorAppointments;

  DoctorModel({
    required this.id,
    required this.personalDetails,
    required this.contactDetails,
    required this.identityDetails,
    required this.qualificationsDetails,
    required this.v,
    required this.updatedAt,
    required this.doctorBookingSlots,
    this.doctorModelOutOfOffice,
    this.employmentDetails,
    this.doctorModelDoctorAppointments,
    required this.communications,
    required this.documents,
    required this.specialtyDetails,
    this.experienceDetails,
    this.createdAt,
    this.outOfOffice,
    this.doctorAppointments,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    id: json["_id"],
    personalDetails: PersonalDetails.fromJson(json["personal-details"]),
    contactDetails: ContactDetails.fromJson(json["contact-details"]),
    identityDetails: DoctorModelIdentityDetails.fromJson(json["identity-details"]),
    qualificationsDetails: QualificationsDetails.fromJson(json["qualifications-details"]),
    v: json["__v"],
    updatedAt: json["updatedAt"],
    doctorBookingSlots: List<DoctorBookingSlot>.from(json["doctor-booking-slots"].map((x) => DoctorBookingSlot.fromJson(x))),
    doctorModelOutOfOffice: json["out_of_office"] == null ? null : OutOfOfficeClass.fromJson(json["out_of_office"]),
    employmentDetails: json["employment_details"] == null ? null : EmploymentDetails.fromJson(json["employment_details"]),
    doctorModelDoctorAppointments: json["doctor_appointments"] == null ? [] : List<DoctorAppointmentElement>.from(json["doctor_appointments"]!.map((x) => DoctorAppointmentElement.fromJson(x))),
    communications: List<Communication>.from(json["communications"].map((x) => Communication.fromJson(x))),
    documents: json["documents"],
    specialtyDetails: SpecialtyDetails.fromJson(json["specialty-details"]),
    experienceDetails: json["experience-details"],
    createdAt: json["createdAt"],
    outOfOffice: json["out-of-office"] == null ? null : OutOfOffice.fromJson(json["out-of-office"]),
    doctorAppointments: json["doctor-appointments"] == null ? [] : List<DoctorAppointment>.from(json["doctor-appointments"]!.map((x) => DoctorAppointment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "personal-details": personalDetails.toJson(),
    "contact-details": contactDetails.toJson(),
    "identity-details": identityDetails.toJson(),
    "qualifications-details": qualificationsDetails.toJson(),
    "__v": v,
    "updatedAt": updatedAt,
    "doctor-booking-slots": List<dynamic>.from(doctorBookingSlots.map((x) => x.toJson())),
    "out_of_office": doctorModelOutOfOffice?.toJson(),
    "employment_details": employmentDetails?.toJson(),
    "doctor_appointments": doctorModelDoctorAppointments == null ? [] : List<dynamic>.from(doctorModelDoctorAppointments!.map((x) => x.toJson())),
    "communications": List<dynamic>.from(communications.map((x) => x.toJson())),
    "documents": documents,
    "specialty-details": specialtyDetails.toJson(),
    "experience-details": experienceDetails,
    "createdAt": createdAt,
    "out-of-office": outOfOffice?.toJson(),
    "doctor-appointments": doctorAppointments == null ? [] : List<dynamic>.from(doctorAppointments!.map((x) => x.toJson())),
  };
}

class Communication {
  String recordedBy;
  DateTime communicationDate;
  String notificationType;
  String subject;
  String comment;

  Communication({
    required this.recordedBy,
    required this.communicationDate,
    required this.notificationType,
    required this.subject,
    required this.comment,
  });

  factory Communication.fromJson(Map<String, dynamic> json) => Communication(
    recordedBy: json["recordedBy"],
    communicationDate: DateTime.parse(json["communicationDate"]),
    notificationType: json["notificationType"],
    subject: json["subject"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "recordedBy": recordedBy,
    "communicationDate": "${communicationDate.year.toString().padLeft(4, '0')}-${communicationDate.month.toString().padLeft(2, '0')}-${communicationDate.day.toString().padLeft(2, '0')}",
    "notificationType": notificationType,
    "subject": subject,
    "comment": comment,
  };
}

class ContactDetails {
  String preferredMethodOfCommunication;
  List<EmailAddress> emailAddresses;
  List<PhoneNumber> phoneNumbers;
  List<AddressDetail> addressDetails;
  List<AddressDetail>? addressDetailsValue;

  ContactDetails({
    required this.preferredMethodOfCommunication,
    required this.emailAddresses,
    required this.phoneNumbers,
    required this.addressDetails,
    this.addressDetailsValue,
  });

  factory ContactDetails.fromJson(Map<String, dynamic> json) => ContactDetails(
    preferredMethodOfCommunication: json["preferred-method-of-communication"],
    emailAddresses: List<EmailAddress>.from(json["email-addresses"].map((x) => EmailAddress.fromJson(x))),
    phoneNumbers: List<PhoneNumber>.from(json["phone-numbers"].map((x) => PhoneNumber.fromJson(x))),
    addressDetails: List<AddressDetail>.from(json["address-details"].map((x) => AddressDetail.fromJson(x))),
    addressDetailsValue: json["address_details_value"] == null ? [] : List<AddressDetail>.from(json["address_details_value"]!.map((x) => AddressDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "preferred-method-of-communication": preferredMethodOfCommunication,
    "email-addresses": List<dynamic>.from(emailAddresses.map((x) => x.toJson())),
    "phone-numbers": List<dynamic>.from(phoneNumbers.map((x) => x.toJson())),
    "address-details": List<dynamic>.from(addressDetails.map((x) => x.toJson())),
    "address_details_value": addressDetailsValue == null ? [] : List<dynamic>.from(addressDetailsValue!.map((x) => x.toJson())),
  };
}

class AddressDetail {
  String region;
  String streetAddress;
  String city;
  String country;
  String? startDate;
  String zip;
  String? endDate;

  AddressDetail({
    required this.region,
    required this.streetAddress,
    required this.city,
    required this.country,
    this.startDate,
    required this.zip,
    this.endDate,
  });

  factory AddressDetail.fromJson(Map<String, dynamic> json) => AddressDetail(
    region: json["region"],
    streetAddress: json["street_address"],
    city: json["city"],
    country: json["country"],
    startDate: json["start_date"],
    zip: json["zip"],
    endDate: json["end_date"],
  );

  Map<String, dynamic> toJson() => {
    "region": region,
    "street_address": streetAddress,
    "city": city,
    "country": country,
    "start_date": startDate,
    "zip": zip,
    "end_date": endDate,
  };
}

class EmailAddress {
  dynamic isDefaultEmail;
  String email;

  EmailAddress({
    required this.isDefaultEmail,
    required this.email,
  });

  factory EmailAddress.fromJson(Map<String, dynamic> json) => EmailAddress(
    isDefaultEmail: json["is_default_email"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "is_default_email": isDefaultEmail,
    "email": email,
  };
}

class PhoneNumber {
  dynamic isDefaultNumber;
  dynamic phoneNumber;

  PhoneNumber({
    required this.isDefaultNumber,
    required this.phoneNumber,
  });

  factory PhoneNumber.fromJson(Map<String, dynamic> json) => PhoneNumber(
    isDefaultNumber: json["is_default_number"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "is_default_number": isDefaultNumber,
    "phone_number": phoneNumber,
  };
}

class DoctorAppointment {
  String firstName;
  String lastName;
  String dateOfBirth;
  String phoneNumber;
  String gender;
  String title;
  String nationalId;
  String streetAddress;
  String streetAddressLine2;
  String city;
  String state;
  String postalZipcode;
  String langauge;
  String diability;
  String otherServices;
  String communication;
  String sensoryProcessing;
  String cognitiveDisability;
  String appliedService;
  String department;
  String procedure;
  DateTime preferredAppointmentDate;
  String preferredAppointmentTime;
  String otherDate;

  DoctorAppointment({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.gender,
    required this.title,
    required this.nationalId,
    required this.streetAddress,
    required this.streetAddressLine2,
    required this.city,
    required this.state,
    required this.postalZipcode,
    required this.langauge,
    required this.diability,
    required this.otherServices,
    required this.communication,
    required this.sensoryProcessing,
    required this.cognitiveDisability,
    required this.appliedService,
    required this.department,
    required this.procedure,
    required this.preferredAppointmentDate,
    required this.preferredAppointmentTime,
    required this.otherDate,
  });

  factory DoctorAppointment.fromJson(Map<String, dynamic> json) => DoctorAppointment(
    firstName: json["first_name"],
    lastName: json["last_name"],
    dateOfBirth: json["date_of_birth"],
    phoneNumber: json["phone_number"],
    gender: json["gender"],
    title: json["title"],
    nationalId: json["national_id"],
    streetAddress: json["street_address"],
    streetAddressLine2: json["street_address_line2"],
    city: json["city"],
    state: json["state"],
    postalZipcode: json["postal_zipcode"],
    langauge: json["langauge"],
    diability: json["diability"],
    otherServices: json["other_services"],
    communication: json["communication"],
    sensoryProcessing: json["sensory_processing"],
    cognitiveDisability: json["cognitive_disability"],
    appliedService: json["applied_service"],
    department: json["department"],
    procedure: json["procedure"],
    preferredAppointmentDate: DateTime.parse(json["preferred_appointment_date"]),
    preferredAppointmentTime: json["preferred_appointment_time"],
    otherDate: json["other_date"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "date_of_birth": dateOfBirth,
    "phone_number": phoneNumber,
    "gender": gender,
    "title": title,
    "national_id": nationalId,
    "street_address": streetAddress,
    "street_address_line2": streetAddressLine2,
    "city": city,
    "state": state,
    "postal_zipcode": postalZipcode,
    "langauge": langauge,
    "diability": diability,
    "other_services": otherServices,
    "communication": communication,
    "sensory_processing": sensoryProcessing,
    "cognitive_disability": cognitiveDisability,
    "applied_service": appliedService,
    "department": department,
    "procedure": procedure,
    "preferred_appointment_date": "${preferredAppointmentDate.year.toString().padLeft(4, '0')}-${preferredAppointmentDate.month.toString().padLeft(2, '0')}-${preferredAppointmentDate.day.toString().padLeft(2, '0')}",
    "preferred_appointment_time": preferredAppointmentTime,
    "other_date": otherDate,
  };
}

class DoctorBookingSlot {
  int id;
  String day;
  String time;
  String isAvailable;

  DoctorBookingSlot({
    required this.id,
    required this.day,
    required this.time,
    required this.isAvailable,
  });

  factory DoctorBookingSlot.fromJson(Map<String, dynamic> json) => DoctorBookingSlot(
    id: json["id"],
    day: json["day"],
    time: json["time"],
    isAvailable: json["isAvailable"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "day": day,
    "time": time,
    "isAvailable": isAvailable,
  };
}

class DoctorAppointmentElement {
  String firstName;
  String lastName;
  String dateOfBirth;
  String phoneNumber;
  String gender;
  String title;
  String nationalId;
  String status;
  String streetAddress;
  String streetAddressLine2;
  String city;
  String state;
  String postalZipcode;
  String? langauge;
  String? diability;
  String otherServices;
  String communication;
  String sensoryProcessing;
  String cognitiveDisability;
  String appliedService;
  String department;
  String procedure;
  DateTime preferredAppointmentDate;
  String preferredAppointmentTime;
  String otherDate;
  String? paymentMethod;
  String? amount;
  String? cardHolder;
  String? cardNumber;
  String? expirationDate;
  String? cvvCvcCode;
  String? billingAddress;
  String? amountCharged;
  String? insuranceCompany;
  String? policyNumber;
  String? policyHolder;
  String? deductableAmount;
  String? insurancePlan;
  String? expiryDate;
  String? insuranceMemberNumber;
  String? callCentre;
  String? category;
  String? preferredDoctor;
  String? id;
  String? email;
  bool? isPrescribed;
  String? language;
  String? disability;

  DoctorAppointmentElement({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.gender,
    required this.title,
    required this.nationalId,
    required this.status,
    required this.streetAddress,
    required this.streetAddressLine2,
    required this.city,
    required this.state,
    required this.postalZipcode,
    this.langauge,
    this.diability,
    required this.otherServices,
    required this.communication,
    required this.sensoryProcessing,
    required this.cognitiveDisability,
    required this.appliedService,
    required this.department,
    required this.procedure,
    required this.preferredAppointmentDate,
    required this.preferredAppointmentTime,
    required this.otherDate,
    this.paymentMethod,
    this.amount,
    this.cardHolder,
    this.cardNumber,
    this.expirationDate,
    this.cvvCvcCode,
    this.billingAddress,
    this.amountCharged,
    this.insuranceCompany,
    this.policyNumber,
    this.policyHolder,
    this.deductableAmount,
    this.insurancePlan,
    this.expiryDate,
    this.insuranceMemberNumber,
    this.callCentre,
    this.category,
    this.preferredDoctor,
    this.id,
    this.email,
    this.isPrescribed,
    this.language,
    this.disability,
  });

  factory DoctorAppointmentElement.fromJson(Map<String, dynamic> json) => DoctorAppointmentElement(
    firstName: json["first_name"],
    lastName: json["last_name"],
    dateOfBirth: json["date_of_birth"],
    phoneNumber: json["phone_number"],
    gender: json["gender"],
    title: json["title"],
    nationalId: json["national_id"],
    status: json["status"],
    streetAddress: json["street_address"],
    streetAddressLine2: json["street_address_line2"],
    city: json["city"],
    state: json["state"],
    postalZipcode: json["postal_zipcode"],
    langauge: json["langauge"],
    diability: json["diability"],
    otherServices: json["other_services"],
    communication: json["communication"],
    sensoryProcessing: json["sensory_processing"],
    cognitiveDisability: json["cognitive_disability"],
    appliedService: json["applied_service"],
    department: json["department"],
    procedure: json["procedure"],
    preferredAppointmentDate: DateTime.parse(json["preferred_appointment_date"]),
    preferredAppointmentTime: json["preferred_appointment_time"],
    otherDate: json["other_date"],
    paymentMethod: json["payment_method"],
    amount: json["amount"],
    cardHolder: json["card_holder"],
    cardNumber: json["card_number"],
    expirationDate: json["expiration_date"],
    cvvCvcCode: json["cvv_cvc_code"],
    billingAddress: json["billing_address"],
    amountCharged: json["amount_charged"],
    insuranceCompany: json["insurance_company"],
    policyNumber: json["policy_number"],
    policyHolder: json["policy_holder"],
    deductableAmount: json["deductable_amount"],
    insurancePlan: json["insurance_plan"],
    expiryDate: json["expiry_date"],
    insuranceMemberNumber: json["insurance_member_number"],
    callCentre: json["call_centre"],
    category: json["category"],
    preferredDoctor: json["preferredDoctor"],
    id: json["id"],
    email: json["email"],
    isPrescribed: json["isPrescribed"],
    language: json["language"],
    disability: json["disability"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "date_of_birth": dateOfBirth,
    "phone_number": phoneNumber,
    "gender": gender,
    "title": title,
    "national_id": nationalId,
    "status": status,
    "street_address": streetAddress,
    "street_address_line2": streetAddressLine2,
    "city": city,
    "state": state,
    "postal_zipcode": postalZipcode,
    "langauge": langauge,
    "diability": diability,
    "other_services": otherServices,
    "communication": communication,
    "sensory_processing": sensoryProcessing,
    "cognitive_disability": cognitiveDisability,
    "applied_service": appliedService,
    "department": department,
    "procedure": procedure,
    "preferred_appointment_date": "${preferredAppointmentDate.year.toString().padLeft(4, '0')}-${preferredAppointmentDate.month.toString().padLeft(2, '0')}-${preferredAppointmentDate.day.toString().padLeft(2, '0')}",
    "preferred_appointment_time": preferredAppointmentTime,
    "other_date": otherDate,
    "payment_method": paymentMethod,
    "amount": amount,
    "card_holder": cardHolder,
    "card_number": cardNumber,
    "expiration_date": expirationDate,
    "cvv_cvc_code": cvvCvcCode,
    "billing_address": billingAddress,
    "amount_charged": amountCharged,
    "insurance_company": insuranceCompany,
    "policy_number": policyNumber,
    "policy_holder": policyHolder,
    "deductable_amount": deductableAmount,
    "insurance_plan": insurancePlan,
    "expiry_date": expiryDate,
    "insurance_member_number": insuranceMemberNumber,
    "call_centre": callCentre,
    "category": category,
    "preferredDoctor": preferredDoctor,
    "id": id,
    "email": email,
    "isPrescribed": isPrescribed,
    "language": language,
    "disability": disability,
  };
}

class OutOfOfficeClass {
  OutOfOfficeDetailsClass details;

  OutOfOfficeClass({
    required this.details,
  });

  factory OutOfOfficeClass.fromJson(Map<String, dynamic> json) => OutOfOfficeClass(
    details: OutOfOfficeDetailsClass.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "details": details.toJson(),
  };
}

class OutOfOfficeDetailsClass {
  String startDate;
  String endDate;
  String days;
  String status;
  String reason;
  String firstName;
  String lastName;
  String nationalId;
  String tittle;
  String hospitalName;
  String department;
  String consultantFirstName;
  String consultantLastName;
  String consultantNationalId;
  String? consultantTittle;
  String type;
  String personalPhoneNumber;
  String personalEmail;
  String workPhoneNumber;
  String workEmail;

  OutOfOfficeDetailsClass({
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.status,
    required this.reason,
    required this.firstName,
    required this.lastName,
    required this.nationalId,
    required this.tittle,
    required this.hospitalName,
    required this.department,
    required this.consultantFirstName,
    required this.consultantLastName,
    required this.consultantNationalId,
    this.consultantTittle,
    required this.type,
    required this.personalPhoneNumber,
    required this.personalEmail,
    required this.workPhoneNumber,
    required this.workEmail,
  });

  factory OutOfOfficeDetailsClass.fromJson(Map<String, dynamic> json) => OutOfOfficeDetailsClass(
    startDate: json["start_date"],
    endDate: json["end_date"],
    days: json["days"],
    status: json["status"],
    reason: json["reason"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    nationalId: json["national_id"],
    tittle: json["tittle"],
    hospitalName: json["hospital_name"],
    department: json["department"],
    consultantFirstName: json["consultant_first_name"],
    consultantLastName: json["consultant_last_name"],
    consultantNationalId: json["consultant_national_id"],
    consultantTittle: json["consultant_tittle"],
    type: json["type"],
    personalPhoneNumber: json["personal_phone_number"],
    personalEmail: json["personal_email"],
    workPhoneNumber: json["work_phone_number"],
    workEmail: json["work_email"],
  );

  Map<String, dynamic> toJson() => {
    "start_date": startDate,
    "end_date": endDate,
    "days": days,
    "status": status,
    "reason": reason,
    "first_name": firstName,
    "last_name": lastName,
    "national_id": nationalId,
    "tittle": tittle,
    "hospital_name": hospitalName,
    "department": department,
    "consultant_first_name": consultantFirstName,
    "consultant_last_name": consultantLastName,
    "consultant_national_id": consultantNationalId,
    "consultant_tittle": consultantTittle,
    "type": type,
    "personal_phone_number": personalPhoneNumber,
    "personal_email": personalEmail,
    "work_phone_number": workPhoneNumber,
    "work_email": workEmail,
  };
}

class Document {
  String documentId;
  String? documentPath;
  String? documentName;
  String? documentDocumentCriteria;
  String? documentType;
  String? documentExtension;
  String? documentCriteria;
  String? status;

  Document({
    required this.documentId,
    this.documentPath,
    this.documentName,
    this.documentDocumentCriteria,
    this.documentType,
    this.documentExtension,
    this.documentCriteria,
    this.status,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    documentId: json["document_id"],
    documentPath: json["document_path"],
    documentName: json["document_name"],
    documentDocumentCriteria: json["document_criteria"],
    documentType: json["document_type"],
    documentExtension: json["document_extension"],
    documentCriteria: json["documentCriteria"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "document_id": documentId,
    "document_path": documentPath,
    "document_name": documentName,
    "document_criteria": documentDocumentCriteria,
    "document_type": documentType,
    "document_extension": documentExtension,
    "documentCriteria": documentCriteria,
    "status": status,
  };
}

class EmploymentDetails {
  String medicalCentreName;
  String medicalCentreType;
  String medicalCentreBranch;
  String medicalCentreContactPerson;
  String phoneNumber;
  String email;
  String streetAddress;
  String streetAddressLine2;
  String city;
  String state;
  String postalZipcode;
  DateTime employmentDate;
  String employmentStatus;
  DateTime position;
  String daysOfEmployment;

  EmploymentDetails({
    required this.medicalCentreName,
    required this.medicalCentreType,
    required this.medicalCentreBranch,
    required this.medicalCentreContactPerson,
    required this.phoneNumber,
    required this.email,
    required this.streetAddress,
    required this.streetAddressLine2,
    required this.city,
    required this.state,
    required this.postalZipcode,
    required this.employmentDate,
    required this.employmentStatus,
    required this.position,
    required this.daysOfEmployment,
  });

  factory EmploymentDetails.fromJson(Map<String, dynamic> json) => EmploymentDetails(
    medicalCentreName: json["medical_centre_name"],
    medicalCentreType: json["medical_centre_type"],
    medicalCentreBranch: json["medical_centre_branch"],
    medicalCentreContactPerson: json["medical_centre_contact_person"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    streetAddress: json["street_address"],
    streetAddressLine2: json["street_address_line2"],
    city: json["city"],
    state: json["state"],
    postalZipcode: json["postal_zipcode"],
    employmentDate: DateTime.parse(json["employment_date"]),
    employmentStatus: json["employment_status"],
    position: DateTime.parse(json["position"]),
    daysOfEmployment: json["days_of_employment"],
  );

  Map<String, dynamic> toJson() => {
    "medical_centre_name": medicalCentreName,
    "medical_centre_type": medicalCentreType,
    "medical_centre_branch": medicalCentreBranch,
    "medical_centre_contact_person": medicalCentreContactPerson,
    "phone_number": phoneNumber,
    "email": email,
    "street_address": streetAddress,
    "street_address_line2": streetAddressLine2,
    "city": city,
    "state": state,
    "postal_zipcode": postalZipcode,
    "employment_date": "${employmentDate.year.toString().padLeft(4, '0')}-${employmentDate.month.toString().padLeft(2, '0')}-${employmentDate.day.toString().padLeft(2, '0')}",
    "employment_status": employmentStatus,
    "position": "${position.year.toString().padLeft(4, '0')}-${position.month.toString().padLeft(2, '0')}-${position.day.toString().padLeft(2, '0')}",
    "days_of_employment": daysOfEmployment,
  };
}

class ExperienceDetail {
  String organization;
  String position;
  String startDate;
  String endDate;
  String phoneNumber;
  String email;
  String city;
  String? udi;
  String? telePhone;
  String street;
  String country;
  String? doctorid;
  String? zipCode;
  String? region;

  ExperienceDetail({
    required this.organization,
    required this.position,
    required this.startDate,
    required this.endDate,
    required this.phoneNumber,
    required this.email,
    required this.city,
    this.udi,
    this.telePhone,
    required this.street,
    required this.country,
    this.doctorid,
    this.zipCode,
    this.region,
  });

  factory ExperienceDetail.fromJson(Map<String, dynamic> json) => ExperienceDetail(
    organization: json["organization"],
    position: json["position"],
    startDate: json["start-date"],
    endDate: json["end-date"],
    phoneNumber: json["phone-number"],
    email: json["email"],
    city: json["city"],
    udi: json["UDI"],
    telePhone: json["tele-phone"],
    street: json["street"],
    country: json["country"],
    doctorid: json["doctorid"],
    zipCode: json["zip-code"],
    region: json["region"],
  );

  Map<String, dynamic> toJson() => {
    "organization": organization,
    "position": position,
    "start-date": startDate,
    "end-date": endDate,
    "phone-number": phoneNumber,
    "email": email,
    "city": city,
    "UDI": udi,
    "tele-phone": telePhone,
    "street": street,
    "country": country,
    "doctorid": doctorid,
    "zip-code": zipCode,
    "region": region,
  };
}

class ExperienceDetailsClass {
  dynamic udi;
  String organization;
  String position;
  String phoneNumber;
  String email;
  String telePhone;
  String street;
  dynamic zipCode;
  String startDate;
  String endDate;
  String city;
  String region;
  String country;

  ExperienceDetailsClass({
    required this.udi,
    required this.organization,
    required this.position,
    required this.phoneNumber,
    required this.email,
    required this.telePhone,
    required this.street,
    required this.zipCode,
    required this.startDate,
    required this.endDate,
    required this.city,
    required this.region,
    required this.country,
  });

  factory ExperienceDetailsClass.fromJson(Map<String, dynamic> json) => ExperienceDetailsClass(
    udi: json["UDI"],
    organization: json["organization"],
    position: json["position"],
    phoneNumber: json["phone-number"],
    email: json["email"],
    telePhone: json["tele-phone"],
    street: json["street"],
    zipCode: json["zip-code"],
    startDate: json["start-date"],
    endDate: json["end-date"],
    city: json["city"],
    region: json["region"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "UDI": udi,
    "organization": organization,
    "position": position,
    "phone-number": phoneNumber,
    "email": email,
    "tele-phone": telePhone,
    "street": street,
    "zip-code": zipCode,
    "start-date": startDate,
    "end-date": endDate,
    "city": city,
    "region": region,
    "country": country,
  };
}

class DoctorModelIdentityDetails {
  String? identificationType;
  FluffyNationalIdDetails? nationalIdDetails;
  String? residentStatus;
  DateTime? issuedDate;
  String? passportNumber;
  DateTime? datePassportIssued;
  DateTime? passportExpirationDate;
  Keycloak? keycloak;
  FluffyPassportDetails? passportDetails;
  IdentityDetailsIdentityDetails? identityDetails;

  DoctorModelIdentityDetails({
    this.identificationType,
    this.nationalIdDetails,
    this.residentStatus,
    this.issuedDate,
    this.passportNumber,
    this.datePassportIssued,
    this.passportExpirationDate,
    this.keycloak,
    this.passportDetails,
    this.identityDetails,
  });

  factory DoctorModelIdentityDetails.fromJson(Map<String, dynamic> json) => DoctorModelIdentityDetails(
    identificationType: json["identification-type"],
    nationalIdDetails: json["national-id-details"] == null ? null : FluffyNationalIdDetails.fromJson(json["national-id-details"]),
    residentStatus: json["resident-status"],
    issuedDate: json["issued-date"] == null ? null : DateTime.parse(json["issued-date"]),
    passportNumber: json["passport-number"],
    datePassportIssued: json["date-passport-issued"] == null ? null : DateTime.parse(json["date-passport-issued"]),
    passportExpirationDate: json["passport-expiration-date"] == null ? null : DateTime.parse(json["passport-expiration-date"]),
    keycloak: json["keycloak"] == null ? null : Keycloak.fromJson(json["keycloak"]),
    passportDetails: json["passport-details"] == null ? null : FluffyPassportDetails.fromJson(json["passport-details"]),
    identityDetails: json["identity-details"] == null ? null : IdentityDetailsIdentityDetails.fromJson(json["identity-details"]),
  );

  Map<String, dynamic> toJson() => {
    "identification-type": identificationType,
    "national-id-details": nationalIdDetails?.toJson(),
    "resident-status": residentStatus,
    "issued-date": "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
    "passport-number": passportNumber,
    "date-passport-issued": "${datePassportIssued!.year.toString().padLeft(4, '0')}-${datePassportIssued!.month.toString().padLeft(2, '0')}-${datePassportIssued!.day.toString().padLeft(2, '0')}",
    "passport-expiration-date": "${passportExpirationDate!.year.toString().padLeft(4, '0')}-${passportExpirationDate!.month.toString().padLeft(2, '0')}-${passportExpirationDate!.day.toString().padLeft(2, '0')}",
    "keycloak": keycloak?.toJson(),
    "passport-details": passportDetails?.toJson(),
    "identity-details": identityDetails?.toJson(),
  };
}

class IdentityDetailsIdentityDetails {
  String identificationType;
  PurpleNationalIdDetails nationalIdDetails;
  PurplePassportDetails passportDetails;

  IdentityDetailsIdentityDetails({
    required this.identificationType,
    required this.nationalIdDetails,
    required this.passportDetails,
  });

  factory IdentityDetailsIdentityDetails.fromJson(Map<String, dynamic> json) => IdentityDetailsIdentityDetails(
    identificationType: json["identification-type"],
    nationalIdDetails: PurpleNationalIdDetails.fromJson(json["national-id-details"]),
    passportDetails: PurplePassportDetails.fromJson(json["passport-details"]),
  );

  Map<String, dynamic> toJson() => {
    "identification-type": identificationType,
    "national-id-details": nationalIdDetails.toJson(),
    "passport-details": passportDetails.toJson(),
  };
}

class PurpleNationalIdDetails {
  String nationalIdNumber;
  String countryIdIssued;
  DateTime issuedDate;

  PurpleNationalIdDetails({
    required this.nationalIdNumber,
    required this.countryIdIssued,
    required this.issuedDate,
  });

  factory PurpleNationalIdDetails.fromJson(Map<String, dynamic> json) => PurpleNationalIdDetails(
    nationalIdNumber: json["national-id-number"],
    countryIdIssued: json["country-id-issued"],
    issuedDate: DateTime.parse(json["issued-date"]),
  );

  Map<String, dynamic> toJson() => {
    "national-id-number": nationalIdNumber,
    "country-id-issued": countryIdIssued,
    "issued-date": "${issuedDate.year.toString().padLeft(4, '0')}-${issuedDate.month.toString().padLeft(2, '0')}-${issuedDate.day.toString().padLeft(2, '0')}",
  };
}

class PurplePassportDetails {
  String passportNumber;
  String countryPassportIssued;
  DateTime issuedDate;
  DateTime expirationDate;
  String residentStatus;

  PurplePassportDetails({
    required this.passportNumber,
    required this.countryPassportIssued,
    required this.issuedDate,
    required this.expirationDate,
    required this.residentStatus,
  });

  factory PurplePassportDetails.fromJson(Map<String, dynamic> json) => PurplePassportDetails(
    passportNumber: json["passport-number"],
    countryPassportIssued: json["country-passport-issued"],
    issuedDate: DateTime.parse(json["issued-date"]),
    expirationDate: DateTime.parse(json["expiration-date"]),
    residentStatus: json["resident-status"],
  );

  Map<String, dynamic> toJson() => {
    "passport-number": passportNumber,
    "country-passport-issued": countryPassportIssued,
    "issued-date": "${issuedDate.year.toString().padLeft(4, '0')}-${issuedDate.month.toString().padLeft(2, '0')}-${issuedDate.day.toString().padLeft(2, '0')}",
    "expiration-date": "${expirationDate.year.toString().padLeft(4, '0')}-${expirationDate.month.toString().padLeft(2, '0')}-${expirationDate.day.toString().padLeft(2, '0')}",
    "resident-status": residentStatus,
  };
}

class Keycloak {
  String departmentName;
  String departmentId;
  String? accessType;

  Keycloak({
    required this.departmentName,
    required this.departmentId,
    this.accessType,
  });

  factory Keycloak.fromJson(Map<String, dynamic> json) => Keycloak(
    departmentName: json["departmentName"],
    departmentId: json["departmentId"],
    accessType: json["accessType"],
  );

  Map<String, dynamic> toJson() => {
    "departmentName": departmentName,
    "departmentId": departmentId,
    "accessType": accessType,
  };
}

class FluffyNationalIdDetails {
  String nationalIdNumber;
  String? countryIdIssued;
  String? issuedDate;

  FluffyNationalIdDetails({
    required this.nationalIdNumber,
    this.countryIdIssued,
    this.issuedDate,
  });

  factory FluffyNationalIdDetails.fromJson(Map<String, dynamic> json) => FluffyNationalIdDetails(
    nationalIdNumber: json["national-id-number"],
    countryIdIssued: json["country-id-issued"],
    issuedDate: json["issued-date"],
  );

  Map<String, dynamic> toJson() => {
    "national-id-number": nationalIdNumber,
    "country-id-issued": countryIdIssued,
    "issued-date": issuedDate,
  };
}

class FluffyPassportDetails {
  String passportNumber;
  String countryPassportIssued;
  String issuedDate;
  String expirationDate;
  String residentStatus;

  FluffyPassportDetails({
    required this.passportNumber,
    required this.countryPassportIssued,
    required this.issuedDate,
    required this.expirationDate,
    required this.residentStatus,
  });

  factory FluffyPassportDetails.fromJson(Map<String, dynamic> json) => FluffyPassportDetails(
    passportNumber: json["passport-number"],
    countryPassportIssued: json["country-passport-issued"],
    issuedDate: json["issued-date"],
    expirationDate: json["expiration-date"],
    residentStatus: json["resident-status"],
  );

  Map<String, dynamic> toJson() => {
    "passport-number": passportNumber,
    "country-passport-issued": countryPassportIssued,
    "issued-date": issuedDate,
    "expiration-date": expirationDate,
    "resident-status": residentStatus,
  };
}

class OutOfOffice {
  OutOfOfficeDetails details;

  OutOfOffice({
    required this.details,
  });

  factory OutOfOffice.fromJson(Map<String, dynamic> json) => OutOfOffice(
    details: OutOfOfficeDetails.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "details": details.toJson(),
  };
}

class OutOfOfficeDetails {
  DateTime startDate;
  DateTime endDate;
  String days;
  String status;
  String reason;
  String firstName;
  String lastName;
  String nationalId;
  String tittle;
  String hospitalName;
  String department;
  String consultantFirstName;
  String consultantLastName;
  String consultantNationalId;
  String consultantTittle;
  String type;
  String personalPhoneNumber;
  String personalEmail;
  String workPhoneNumber;
  String workEmail;

  OutOfOfficeDetails({
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.status,
    required this.reason,
    required this.firstName,
    required this.lastName,
    required this.nationalId,
    required this.tittle,
    required this.hospitalName,
    required this.department,
    required this.consultantFirstName,
    required this.consultantLastName,
    required this.consultantNationalId,
    required this.consultantTittle,
    required this.type,
    required this.personalPhoneNumber,
    required this.personalEmail,
    required this.workPhoneNumber,
    required this.workEmail,
  });

  factory OutOfOfficeDetails.fromJson(Map<String, dynamic> json) => OutOfOfficeDetails(
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    days: json["days"],
    status: json["status"],
    reason: json["reason"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    nationalId: json["national_id"],
    tittle: json["tittle"],
    hospitalName: json["hospital_name"],
    department: json["department"],
    consultantFirstName: json["consultant_first_name"],
    consultantLastName: json["consultant_last_name"],
    consultantNationalId: json["consultant_national_id"],
    consultantTittle: json["consultant_tittle"],
    type: json["type"],
    personalPhoneNumber: json["personal_phone_number"],
    personalEmail: json["personal_email"],
    workPhoneNumber: json["work_phone_number"],
    workEmail: json["work_email"],
  );

  Map<String, dynamic> toJson() => {
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "days": days,
    "status": status,
    "reason": reason,
    "first_name": firstName,
    "last_name": lastName,
    "national_id": nationalId,
    "tittle": tittle,
    "hospital_name": hospitalName,
    "department": department,
    "consultant_first_name": consultantFirstName,
    "consultant_last_name": consultantLastName,
    "consultant_national_id": consultantNationalId,
    "consultant_tittle": consultantTittle,
    "type": type,
    "personal_phone_number": personalPhoneNumber,
    "personal_email": personalEmail,
    "work_phone_number": workPhoneNumber,
    "work_email": workEmail,
  };
}

class PersonalDetails {
  String id;
  String firstName;
  String lastName;
  DateTime? registrationDate;
  String identificationType;
  String nationalId;
  String dateOfBirth;
  String title;
  String maritalStatus;
  String gender;
  String? documents;

  PersonalDetails({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.registrationDate,
    required this.identificationType,
    required this.nationalId,
    required this.dateOfBirth,
    required this.title,
    required this.maritalStatus,
    required this.gender,
    this.documents,
  });

  factory PersonalDetails.fromJson(Map<String, dynamic> json) => PersonalDetails(
    id: json["id"],
    firstName: json["first-name"],
    lastName: json["last-name"],
    registrationDate: json["registration-date"] == null ? null : DateTime.parse(json["registration-date"]),
    identificationType: json["identification-type"],
    nationalId: json["national-id"],
    dateOfBirth: json["date-of-birth"],
    title: json["title"],
    maritalStatus: json["marital-status"],
    gender: json["gender"],
    documents: json["documents"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first-name": firstName,
    "last-name": lastName,
    "registration-date": "${registrationDate!.year.toString().padLeft(4, '0')}-${registrationDate!.month.toString().padLeft(2, '0')}-${registrationDate!.day.toString().padLeft(2, '0')}",
    "identification-type": identificationType,
    "national-id": nationalId,
    "date-of-birth": dateOfBirth,
    "title": title,
    "marital-status": maritalStatus,
    "gender": gender,
    "documents": documents,
  };
}

class QualificationsDetails {
  List<MemberAssociation> memberAssociations;
  List<Qualification> qualifications;

  QualificationsDetails({
    required this.memberAssociations,
    required this.qualifications,
  });

  factory QualificationsDetails.fromJson(Map<String, dynamic> json) => QualificationsDetails(
    memberAssociations: List<MemberAssociation>.from(json["member-associations"].map((x) => MemberAssociation.fromJson(x))),
    qualifications: List<Qualification>.from(json["qualifications"].map((x) => Qualification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "member-associations": List<dynamic>.from(memberAssociations.map((x) => x.toJson())),
    "qualifications": List<dynamic>.from(qualifications.map((x) => x.toJson())),
  };
}

class MemberAssociation {
  String association;
  String certification;
  String date;
  String dateOfExpiry;

  MemberAssociation({
    required this.association,
    required this.certification,
    required this.date,
    required this.dateOfExpiry,
  });

  factory MemberAssociation.fromJson(Map<String, dynamic> json) => MemberAssociation(
    association: json["association"],
    certification: json["certification"],
    date: json["date"],
    dateOfExpiry: json["dateOfExpiry"],
  );

  Map<String, dynamic> toJson() => {
    "association": association,
    "certification": certification,
    "date": date,
    "dateOfExpiry": dateOfExpiry,
  };
}

class Qualification {
  String institution;
  String qualification;
  DateTime date;

  Qualification({
    required this.institution,
    required this.qualification,
    required this.date,
  });

  factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(
    institution: json["institution"],
    qualification: json["qualification"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "institution": institution,
    "qualification": qualification,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
  };
}

class SpecialtyDetails {
  dynamic doctorId;
  String doctorType;
  List<String> specialization;
  List<String> services;
  String descriptionSpecialization;
  List<String>? medicalCenters;
  List<String>? location;
  String? practiceNumber;

  SpecialtyDetails({
    this.doctorId,
    required this.doctorType,
    required this.specialization,
    required this.services,
    required this.descriptionSpecialization,
    this.medicalCenters,
    this.location,
    this.practiceNumber,
  });

  factory SpecialtyDetails.fromJson(Map<String, dynamic> json) => SpecialtyDetails(
    doctorId: json["doctor-id"],
    doctorType: json["doctor-type"],
    specialization: List<String>.from(json["specialization"].map((x) => x)),
    services: List<String>.from(json["services"].map((x) => x)),
    descriptionSpecialization: json["description-specialization"],
    medicalCenters: json["medical-centers"] == null ? [] : List<String>.from(json["medical-centers"]!.map((x) => x)),
    location: json["location"] == null ? [] : List<String>.from(json["location"]!.map((x) => x)),
    practiceNumber: json["practiceNumber"],
  );

  Map<String, dynamic> toJson() => {
    "doctor-id": doctorId,
    "doctor-type": doctorType,
    "specialization": List<dynamic>.from(specialization.map((x) => x)),
    "services": List<dynamic>.from(services.map((x) => x)),
    "description-specialization": descriptionSpecialization,
    "medical-centers": medicalCenters == null ? [] : List<dynamic>.from(medicalCenters!.map((x) => x)),
    "location": location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
    "practiceNumber": practiceNumber,
  };
}

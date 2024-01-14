// To parse this JSON data, do
//
//     final vitalsModel = vitalsModelFromMap(jsonString);

import 'dart:convert';

VitalsModel vitalsModelFromMap(String str) => VitalsModel.fromMap(json.decode(str));

String vitalsModelToMap(VitalsModel data) => json.encode(data.toMap());

class VitalsModel {
  String id;
  VitalsModelPersonalDetails personalDetails;
  VitalsModelContactDetails contactDetails;
  NextOfKinDetails nextOfKinDetails;
  IdentityDetails identityDetails;
  List<dynamic> dependants;
  Questions questions;
  PrimaryInsurance primaryInsurance;
  SecondaryInsurance secondaryInsurance;
  TertiaryInsurance tertiaryInsurance;
  List<Document> documents;
  List<dynamic> patientDiagnosis;
  List<UpdatedVital> updatedVitals;
  List<dynamic> patientAssessment;
  List<dynamic> medicineSchedule;
  List<dynamic> communications;
  List<dynamic> newDocuments;
  List<dynamic> dentalHistory;
  String status;
  String createdAt;
  String updatedAt;
  int v;
  List<AmmendmentHistory> ammendmentHistory;

  VitalsModel({
    required this.id,
    required this.personalDetails,
    required this.contactDetails,
    required this.nextOfKinDetails,
    required this.identityDetails,
    required this.dependants,
    required this.questions,
    required this.primaryInsurance,
    required this.secondaryInsurance,
    required this.tertiaryInsurance,
    required this.documents,
    required this.patientDiagnosis,
    required this.updatedVitals,
    required this.patientAssessment,
    required this.medicineSchedule,
    required this.communications,
    required this.newDocuments,
    required this.dentalHistory,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.ammendmentHistory,
  });

  factory VitalsModel.fromMap(Map<String, dynamic> json) => VitalsModel(
    id: json["_id"],
    personalDetails: VitalsModelPersonalDetails.fromMap(json["personal-details"]),
    contactDetails: VitalsModelContactDetails.fromMap(json["contact-details"]),
    nextOfKinDetails: NextOfKinDetails.fromMap(json["next-of-kin-details"]),
    identityDetails: IdentityDetails.fromMap(json["identity-details"]),
    dependants: List<dynamic>.from(json["dependants"].map((x) => x)),
    questions: Questions.fromMap(json["questions"]),
    primaryInsurance: PrimaryInsurance.fromMap(json["primaryInsurance"]),
    secondaryInsurance: SecondaryInsurance.fromMap(json["secondaryInsurance"]),
    tertiaryInsurance: TertiaryInsurance.fromMap(json["tertiaryInsurance"]),
    documents: List<Document>.from(json["documents"].map((x) => Document.fromMap(x))),
    patientDiagnosis: List<dynamic>.from(json["patient_diagnosis"].map((x) => x)),
    updatedVitals: List<UpdatedVital>.from(json["updated_vitals"].map((x) => UpdatedVital.fromMap(x))),
    patientAssessment: List<dynamic>.from(json["patient_assessment"].map((x) => x)),
    medicineSchedule: List<dynamic>.from(json["medicine_schedule"].map((x) => x)),
    communications: List<dynamic>.from(json["communications"].map((x) => x)),
    newDocuments: List<dynamic>.from(json["new_documents"].map((x) => x)),
    dentalHistory: List<dynamic>.from(json["dental_history"].map((x) => x)),
    status: json["status"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    ammendmentHistory: List<AmmendmentHistory>.from(json["ammendmentHistory"].map((x) => AmmendmentHistory.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "personal-details": personalDetails.toMap(),
    "contact-details": contactDetails.toMap(),
    "next-of-kin-details": nextOfKinDetails.toMap(),
    "identity-details": identityDetails.toMap(),
    "dependants": List<dynamic>.from(dependants.map((x) => x)),
    "questions": questions.toMap(),
    "primaryInsurance": primaryInsurance.toMap(),
    "secondaryInsurance": secondaryInsurance.toMap(),
    "tertiaryInsurance": tertiaryInsurance.toMap(),
    "documents": List<dynamic>.from(documents.map((x) => x.toMap())),
    "patient_diagnosis": List<dynamic>.from(patientDiagnosis.map((x) => x)),
    "updated_vitals": List<dynamic>.from(updatedVitals.map((x) => x.toMap())),
    "patient_assessment": List<dynamic>.from(patientAssessment.map((x) => x)),
    "medicine_schedule": List<dynamic>.from(medicineSchedule.map((x) => x)),
    "communications": List<dynamic>.from(communications.map((x) => x)),
    "new_documents": List<dynamic>.from(newDocuments.map((x) => x)),
    "dental_history": List<dynamic>.from(dentalHistory.map((x) => x)),
    "status": status,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "ammendmentHistory": List<dynamic>.from(ammendmentHistory.map((x) => x.toMap())),
  };
}

class AmmendmentHistory {
  String ammmendmentType;
  DateTime ammendmentDate;
  PrevAddressElement? prevAddress;
  String? prevPhoneNumber;
  String? prevEmail;

  AmmendmentHistory({
    required this.ammmendmentType,
    required this.ammendmentDate,
    this.prevAddress,
    this.prevPhoneNumber,
    this.prevEmail,
  });

  factory AmmendmentHistory.fromMap(Map<String, dynamic> json) => AmmendmentHistory(
    ammmendmentType: json["ammmendmentType"],
    ammendmentDate: DateTime.parse(json["ammendmentDate"]),
    prevAddress: json["prevAddress"] == null ? null : PrevAddressElement.fromMap(json["prevAddress"]),
    prevPhoneNumber: json["prevPhoneNumber"],
    prevEmail: json["prevEmail"],
  );

  Map<String, dynamic> toMap() => {
    "ammmendmentType": ammmendmentType,
    "ammendmentDate": "${ammendmentDate.year.toString().padLeft(4, '0')}-${ammendmentDate.month.toString().padLeft(2, '0')}-${ammendmentDate.day.toString().padLeft(2, '0')}",
    "prevAddress": prevAddress?.toMap(),
    "prevPhoneNumber": prevPhoneNumber,
    "prevEmail": prevEmail,
  };
}

class PrevAddressElement {
  String streetAddress;
  String city;
  String region;
  String country;
  String zip;
  DateTime startDate;

  PrevAddressElement({
    required this.streetAddress,
    required this.city,
    required this.region,
    required this.country,
    required this.zip,
    required this.startDate,
  });

  factory PrevAddressElement.fromMap(Map<String, dynamic> json) => PrevAddressElement(
    streetAddress: json["street_address"],
    city: json["city"],
    region: json["region"],
    country: json["country"],
    zip: json["zip"],
    startDate: DateTime.parse(json["start_date"]),
  );

  Map<String, dynamic> toMap() => {
    "street_address": streetAddress,
    "city": city,
    "region": region,
    "country": country,
    "zip": zip,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
  };
}

class VitalsModelContactDetails {
  String preferredMethodOfCommunication;
  List<PurpleEmailAddress> emailAddresses;
  List<PurplePhoneNumber> phoneNumbers;
  List<PrevAddressElement> addressDetails;
  List<AddressDetailsValueElement> addressDetailsValue;
  List<AddressDetailsValueElement> addressDetailsValues;

  VitalsModelContactDetails({
    required this.preferredMethodOfCommunication,
    required this.emailAddresses,
    required this.phoneNumbers,
    required this.addressDetails,
    required this.addressDetailsValue,
    required this.addressDetailsValues,
  });

  factory VitalsModelContactDetails.fromMap(Map<String, dynamic> json) => VitalsModelContactDetails(
    preferredMethodOfCommunication: json["preferred-method-of-communication"],
    emailAddresses: List<PurpleEmailAddress>.from(json["email-addresses"].map((x) => PurpleEmailAddress.fromMap(x))),
    phoneNumbers: List<PurplePhoneNumber>.from(json["phone-numbers"].map((x) => PurplePhoneNumber.fromMap(x))),
    addressDetails: List<PrevAddressElement>.from(json["address-details"].map((x) => PrevAddressElement.fromMap(x))),
    addressDetailsValue: List<AddressDetailsValueElement>.from(json["address_details_value"].map((x) => AddressDetailsValueElement.fromMap(x))),
    addressDetailsValues: List<AddressDetailsValueElement>.from(json["address_details_values"].map((x) => AddressDetailsValueElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "preferred-method-of-communication": preferredMethodOfCommunication,
    "email-addresses": List<dynamic>.from(emailAddresses.map((x) => x.toMap())),
    "phone-numbers": List<dynamic>.from(phoneNumbers.map((x) => x.toMap())),
    "address-details": List<dynamic>.from(addressDetails.map((x) => x.toMap())),
    "address_details_value": List<dynamic>.from(addressDetailsValue.map((x) => x.toMap())),
    "address_details_values": List<dynamic>.from(addressDetailsValues.map((x) => x.toMap())),
  };
}

class AddressDetailsValueElement {
  String region;
  String streetAddress;
  String city;
  String country;
  DateTime startDate;
  DateTime endDate;
  String zip;

  AddressDetailsValueElement({
    required this.region,
    required this.streetAddress,
    required this.city,
    required this.country,
    required this.startDate,
    required this.endDate,
    required this.zip,
  });

  factory AddressDetailsValueElement.fromMap(Map<String, dynamic> json) => AddressDetailsValueElement(
    region: json["region"],
    streetAddress: json["street_address"],
    city: json["city"],
    country: json["country"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    zip: json["zip"],
  );

  Map<String, dynamic> toMap() => {
    "region": region,
    "street_address": streetAddress,
    "city": city,
    "country": country,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "zip": zip,
  };
}

class PurpleEmailAddress {
  bool isDefaultEmail;
  String email;

  PurpleEmailAddress({
    required this.isDefaultEmail,
    required this.email,
  });

  factory PurpleEmailAddress.fromMap(Map<String, dynamic> json) => PurpleEmailAddress(
    isDefaultEmail: json["is_default_email"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "is_default_email": isDefaultEmail,
    "email": email,
  };
}

class PurplePhoneNumber {
  bool isDefaultNumber;
  String phoneNumber;

  PurplePhoneNumber({
    required this.isDefaultNumber,
    required this.phoneNumber,
  });

  factory PurplePhoneNumber.fromMap(Map<String, dynamic> json) => PurplePhoneNumber(
    isDefaultNumber: json["is_default_number"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toMap() => {
    "is_default_number": isDefaultNumber,
    "phone_number": phoneNumber,
  };
}

class Document {
  String documentId;
  String documentName;
  String documentCriteria;
  String status;
  String documentType;
  String documentPath;

  Document({
    required this.documentId,
    required this.documentName,
    required this.documentCriteria,
    required this.status,
    required this.documentType,
    required this.documentPath,
  });

  factory Document.fromMap(Map<String, dynamic> json) => Document(
    documentId: json["document_id"],
    documentName: json["document_name"],
    documentCriteria: json["documentCriteria"],
    status: json["status"],
    documentType: json["document_type"],
    documentPath: json["document_path"],
  );

  Map<String, dynamic> toMap() => {
    "document_id": documentId,
    "document_name": documentName,
    "documentCriteria": documentCriteria,
    "status": status,
    "document_type": documentType,
    "document_path": documentPath,
  };
}

class IdentityDetails {
  String identificationType;
  NationalIdDetails nationalIdDetails;
  PassportDetails passportDetails;

  IdentityDetails({
    required this.identificationType,
    required this.nationalIdDetails,
    required this.passportDetails,
  });

  factory IdentityDetails.fromMap(Map<String, dynamic> json) => IdentityDetails(
    identificationType: json["identification-type"],
    nationalIdDetails: NationalIdDetails.fromMap(json["national-id-details"]),
    passportDetails: PassportDetails.fromMap(json["passport-details"]),
  );

  Map<String, dynamic> toMap() => {
    "identification-type": identificationType,
    "national-id-details": nationalIdDetails.toMap(),
    "passport-details": passportDetails.toMap(),
  };
}

class NationalIdDetails {
  String nationalIdNumber;
  String countryIdIssued;
  String issuedDate;

  NationalIdDetails({
    required this.nationalIdNumber,
    required this.countryIdIssued,
    required this.issuedDate,
  });

  factory NationalIdDetails.fromMap(Map<String, dynamic> json) => NationalIdDetails(
    nationalIdNumber: json["national-id-number"],
    countryIdIssued: json["country-id-issued"],
    issuedDate: json["issued-date"],
  );

  Map<String, dynamic> toMap() => {
    "national-id-number": nationalIdNumber,
    "country-id-issued": countryIdIssued,
    "issued-date": issuedDate,
  };
}

class PassportDetails {
  String passportNumber;
  String countryPassportIssued;
  String issuedDate;
  String expirationDate;
  String residentStatus;

  PassportDetails({
    required this.passportNumber,
    required this.countryPassportIssued,
    required this.issuedDate,
    required this.expirationDate,
    required this.residentStatus,
  });

  factory PassportDetails.fromMap(Map<String, dynamic> json) => PassportDetails(
    passportNumber: json["passport-number"],
    countryPassportIssued: json["country-passport-issued"],
    issuedDate: json["issued-date"],
    expirationDate: json["expiration-date"],
    residentStatus: json["resident-status"],
  );

  Map<String, dynamic> toMap() => {
    "passport-number": passportNumber,
    "country-passport-issued": countryPassportIssued,
    "issued-date": issuedDate,
    "expiration-date": expirationDate,
    "resident-status": residentStatus,
  };
}

class NextOfKinDetails {
  NextOfKinDetailsPersonalDetails personalDetails;
  NextOfKinDetailsContactDetails contactDetails;

  NextOfKinDetails({
    required this.personalDetails,
    required this.contactDetails,
  });

  factory NextOfKinDetails.fromMap(Map<String, dynamic> json) => NextOfKinDetails(
    personalDetails: NextOfKinDetailsPersonalDetails.fromMap(json["personal-details"]),
    contactDetails: NextOfKinDetailsContactDetails.fromMap(json["contact-details"]),
  );

  Map<String, dynamic> toMap() => {
    "personal-details": personalDetails.toMap(),
    "contact-details": contactDetails.toMap(),
  };
}

class NextOfKinDetailsContactDetails {
  String preferredMethodOfCommunication;
  List<FluffyEmailAddress> emailAddresses;
  List<FluffyPhoneNumber> phoneNumbers;
  List<AddressDetailsValueElement> addressDetails;

  NextOfKinDetailsContactDetails({
    required this.preferredMethodOfCommunication,
    required this.emailAddresses,
    required this.phoneNumbers,
    required this.addressDetails,
  });

  factory NextOfKinDetailsContactDetails.fromMap(Map<String, dynamic> json) => NextOfKinDetailsContactDetails(
    preferredMethodOfCommunication: json["preferred-method-of-communication"],
    emailAddresses: List<FluffyEmailAddress>.from(json["email-addresses"].map((x) => FluffyEmailAddress.fromMap(x))),
    phoneNumbers: List<FluffyPhoneNumber>.from(json["phone-numbers"].map((x) => FluffyPhoneNumber.fromMap(x))),
    addressDetails: List<AddressDetailsValueElement>.from(json["address-details"].map((x) => AddressDetailsValueElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "preferred-method-of-communication": preferredMethodOfCommunication,
    "email-addresses": List<dynamic>.from(emailAddresses.map((x) => x.toMap())),
    "phone-numbers": List<dynamic>.from(phoneNumbers.map((x) => x.toMap())),
    "address-details": List<dynamic>.from(addressDetails.map((x) => x.toMap())),
  };
}

class FluffyEmailAddress {
  String email;
  String isDefaultEmail;

  FluffyEmailAddress({
    required this.email,
    required this.isDefaultEmail,
  });

  factory FluffyEmailAddress.fromMap(Map<String, dynamic> json) => FluffyEmailAddress(
    email: json["email"],
    isDefaultEmail: json["is_default_email"],
  );

  Map<String, dynamic> toMap() => {
    "email": email,
    "is_default_email": isDefaultEmail,
  };
}

class FluffyPhoneNumber {
  String phoneNumber;
  String isDefaultNumber;

  FluffyPhoneNumber({
    required this.phoneNumber,
    required this.isDefaultNumber,
  });

  factory FluffyPhoneNumber.fromMap(Map<String, dynamic> json) => FluffyPhoneNumber(
    phoneNumber: json["phone_number"],
    isDefaultNumber: json["is_default_number"],
  );

  Map<String, dynamic> toMap() => {
    "phone_number": phoneNumber,
    "is_default_number": isDefaultNumber,
  };
}

class NextOfKinDetailsPersonalDetails {
  String firstName;
  String lastName;
  String identificationType;
  String nationalId;
  DateTime dateOfBirth;
  String title;
  String gender;
  String occupation;
  String relationship;
  String nationality;

  NextOfKinDetailsPersonalDetails({
    required this.firstName,
    required this.lastName,
    required this.identificationType,
    required this.nationalId,
    required this.dateOfBirth,
    required this.title,
    required this.gender,
    required this.occupation,
    required this.relationship,
    required this.nationality,
  });

  factory NextOfKinDetailsPersonalDetails.fromMap(Map<String, dynamic> json) => NextOfKinDetailsPersonalDetails(
    firstName: json["first-name"],
    lastName: json["last-name"],
    identificationType: json["identification-type"],
    nationalId: json["national-id"],
    dateOfBirth: DateTime.parse(json["date-of-birth"]),
    title: json["title"],
    gender: json["gender"],
    occupation: json["occupation"],
    relationship: json["relationship"],
    nationality: json["nationality"],
  );

  Map<String, dynamic> toMap() => {
    "first-name": firstName,
    "last-name": lastName,
    "identification-type": identificationType,
    "national-id": nationalId,
    "date-of-birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "title": title,
    "gender": gender,
    "occupation": occupation,
    "relationship": relationship,
    "nationality": nationality,
  };
}

class VitalsModelPersonalDetails {
  String id;
  String firstName;
  String lastName;
  DateTime registrationDate;
  String identificationType;
  String nationalId;
  DateTime dateOfBirth;
  String title;
  String maritalStatus;
  String gender;
  String doctor;
  String occupation;

  VitalsModelPersonalDetails({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.registrationDate,
    required this.identificationType,
    required this.nationalId,
    required this.dateOfBirth,
    required this.title,
    required this.maritalStatus,
    required this.gender,
    required this.doctor,
    required this.occupation,
  });

  factory VitalsModelPersonalDetails.fromMap(Map<String, dynamic> json) => VitalsModelPersonalDetails(
    id: json["id"],
    firstName: json["first-name"],
    lastName: json["last-name"],
    registrationDate: DateTime.parse(json["registration-date"]),
    identificationType: json["identification-type"],
    nationalId: json["national-id"],
    dateOfBirth: DateTime.parse(json["date-of-birth"]),
    title: json["title"],
    maritalStatus: json["marital-status"],
    gender: json["gender"],
    doctor: json["doctor"],
    occupation: json["occupation"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "first-name": firstName,
    "last-name": lastName,
    "registration-date": "${registrationDate.year.toString().padLeft(4, '0')}-${registrationDate.month.toString().padLeft(2, '0')}-${registrationDate.day.toString().padLeft(2, '0')}",
    "identification-type": identificationType,
    "national-id": nationalId,
    "date-of-birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "title": title,
    "marital-status": maritalStatus,
    "gender": gender,
    "doctor": doctor,
    "occupation": occupation,
  };
}

class PrimaryInsurance {
  String insuranceProviderPrimary;
  String newInsurerId;
  String newInsurerName;
  String newInsurerAttention;
  String newInsurerAddress1;
  String newInsurerAddress2;
  String newInsurerCountry;
  String newInsurerCity;
  String newInsurerRegion;
  String newInsurerZip;
  String newInsurerPhone;
  String newInsurerPayerId;
  String newInsurerPayerType;
  String newInsurerX12Partner;
  String cqmPaymentSource;
  String planName;
  String subscriber;
  String effectiveDate;
  String relationship;
  String policyNumber;
  String dateOfBirth;
  String groupNumber;
  String sS;
  String subscriberEmployer;
  String sex;
  String seAddress;
  String seAddress1;
  String seCity;
  String seZip;
  String seRegion;
  String seCountry;
  String subscriberAddress;
  String subscriberAddress1;
  String subscriberCity;
  String subscriberRegion;
  String subscriberCountry;
  String subscriberZip;
  String coPay;
  String acceptAssignment;

  PrimaryInsurance({
    required this.insuranceProviderPrimary,
    required this.newInsurerId,
    required this.newInsurerName,
    required this.newInsurerAttention,
    required this.newInsurerAddress1,
    required this.newInsurerAddress2,
    required this.newInsurerCountry,
    required this.newInsurerCity,
    required this.newInsurerRegion,
    required this.newInsurerZip,
    required this.newInsurerPhone,
    required this.newInsurerPayerId,
    required this.newInsurerPayerType,
    required this.newInsurerX12Partner,
    required this.cqmPaymentSource,
    required this.planName,
    required this.subscriber,
    required this.effectiveDate,
    required this.relationship,
    required this.policyNumber,
    required this.dateOfBirth,
    required this.groupNumber,
    required this.sS,
    required this.subscriberEmployer,
    required this.sex,
    required this.seAddress,
    required this.seAddress1,
    required this.seCity,
    required this.seZip,
    required this.seRegion,
    required this.seCountry,
    required this.subscriberAddress,
    required this.subscriberAddress1,
    required this.subscriberCity,
    required this.subscriberRegion,
    required this.subscriberCountry,
    required this.subscriberZip,
    required this.coPay,
    required this.acceptAssignment,
  });

  factory PrimaryInsurance.fromMap(Map<String, dynamic> json) => PrimaryInsurance(
    insuranceProviderPrimary: json["insuranceProviderPrimary"],
    newInsurerId: json["newInsurerId"],
    newInsurerName: json["newInsurerName"],
    newInsurerAttention: json["newInsurerAttention"],
    newInsurerAddress1: json["newInsurerAddress1"],
    newInsurerAddress2: json["newInsurerAddress2"],
    newInsurerCountry: json["newInsurerCountry"],
    newInsurerCity: json["newInsurerCity"],
    newInsurerRegion: json["newInsurerRegion"],
    newInsurerZip: json["newInsurerZip"],
    newInsurerPhone: json["newInsurerPhone"],
    newInsurerPayerId: json["newInsurerPayerId"],
    newInsurerPayerType: json["newInsurerPayerType"],
    newInsurerX12Partner: json["newInsurerX12Partner"],
    cqmPaymentSource: json["cqmPaymentSource"],
    planName: json["planName"],
    subscriber: json["subscriber"],
    effectiveDate: json["effectiveDate"],
    relationship: json["relationship"],
    policyNumber: json["policyNumber"],
    dateOfBirth: json["dateOfBirth"],
    groupNumber: json["groupNumber"],
    sS: json["sS"],
    subscriberEmployer: json["subscriberEmployer"],
    sex: json["sex"],
    seAddress: json["seAddress"],
    seAddress1: json["seAddress1"],
    seCity: json["seCity"],
    seZip: json["seZip"],
    seRegion: json["seRegion"],
    seCountry: json["seCountry"],
    subscriberAddress: json["subscriberAddress"],
    subscriberAddress1: json["subscriberAddress1"],
    subscriberCity: json["subscriberCity"],
    subscriberRegion: json["subscriberRegion"],
    subscriberCountry: json["subscriberCountry"],
    subscriberZip: json["subscriberZip"],
    coPay: json["coPay"],
    acceptAssignment: json["acceptAssignment"],
  );

  Map<String, dynamic> toMap() => {
    "insuranceProviderPrimary": insuranceProviderPrimary,
    "newInsurerId": newInsurerId,
    "newInsurerName": newInsurerName,
    "newInsurerAttention": newInsurerAttention,
    "newInsurerAddress1": newInsurerAddress1,
    "newInsurerAddress2": newInsurerAddress2,
    "newInsurerCountry": newInsurerCountry,
    "newInsurerCity": newInsurerCity,
    "newInsurerRegion": newInsurerRegion,
    "newInsurerZip": newInsurerZip,
    "newInsurerPhone": newInsurerPhone,
    "newInsurerPayerId": newInsurerPayerId,
    "newInsurerPayerType": newInsurerPayerType,
    "newInsurerX12Partner": newInsurerX12Partner,
    "cqmPaymentSource": cqmPaymentSource,
    "planName": planName,
    "subscriber": subscriber,
    "effectiveDate": effectiveDate,
    "relationship": relationship,
    "policyNumber": policyNumber,
    "dateOfBirth": dateOfBirth,
    "groupNumber": groupNumber,
    "sS": sS,
    "subscriberEmployer": subscriberEmployer,
    "sex": sex,
    "seAddress": seAddress,
    "seAddress1": seAddress1,
    "seCity": seCity,
    "seZip": seZip,
    "seRegion": seRegion,
    "seCountry": seCountry,
    "subscriberAddress": subscriberAddress,
    "subscriberAddress1": subscriberAddress1,
    "subscriberCity": subscriberCity,
    "subscriberRegion": subscriberRegion,
    "subscriberCountry": subscriberCountry,
    "subscriberZip": subscriberZip,
    "coPay": coPay,
    "acceptAssignment": acceptAssignment,
  };
}

class Questions {
  String location;
  String admissionReason;
  String smoker;
  String previousConditions;
  String takingMedications;
  String previousSurgeries;
  String receivingTreatment;
  String preExistingConditions;
  String previousConditionsState;
  String previousSurgeriesState;
  String takingMedicationState;
  String receivingTreatmentState;
  String preExistingConditionsState;
  String hasMedicalAid;
  List<dynamic> medicalAidProviders;

  Questions({
    required this.location,
    required this.admissionReason,
    required this.smoker,
    required this.previousConditions,
    required this.takingMedications,
    required this.previousSurgeries,
    required this.receivingTreatment,
    required this.preExistingConditions,
    required this.previousConditionsState,
    required this.previousSurgeriesState,
    required this.takingMedicationState,
    required this.receivingTreatmentState,
    required this.preExistingConditionsState,
    required this.hasMedicalAid,
    required this.medicalAidProviders,
  });

  factory Questions.fromMap(Map<String, dynamic> json) => Questions(
    location: json["location"],
    admissionReason: json["admissionReason"],
    smoker: json["smoker"],
    previousConditions: json["previous-conditions"],
    takingMedications: json["taking-medications"],
    previousSurgeries: json["previous-surgeries"],
    receivingTreatment: json["receiving-treatment"],
    preExistingConditions: json["preExisting-conditions"],
    previousConditionsState: json["previous-conditions-state"],
    previousSurgeriesState: json["previous-surgeries-state"],
    takingMedicationState: json["taking-medication-state"],
    receivingTreatmentState: json["receiving-treatment-state"],
    preExistingConditionsState: json["preExisting-conditions-state"],
    hasMedicalAid: json["hasMedicalAid"],
    medicalAidProviders: List<dynamic>.from(json["medicalAidProviders"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "location": location,
    "admissionReason": admissionReason,
    "smoker": smoker,
    "previous-conditions": previousConditions,
    "taking-medications": takingMedications,
    "previous-surgeries": previousSurgeries,
    "receiving-treatment": receivingTreatment,
    "preExisting-conditions": preExistingConditions,
    "previous-conditions-state": previousConditionsState,
    "previous-surgeries-state": previousSurgeriesState,
    "taking-medication-state": takingMedicationState,
    "receiving-treatment-state": receivingTreatmentState,
    "preExisting-conditions-state": preExistingConditionsState,
    "hasMedicalAid": hasMedicalAid,
    "medicalAidProviders": List<dynamic>.from(medicalAidProviders.map((x) => x)),
  };
}

class SecondaryInsurance {
  String insuranceProviderPrimary;
  String newInsurerId;
  String newInsurerName;
  String newInsurerAttention;
  String newInsurerAddress1;
  String newInsurerAddress2;
  String newInsurerCountry;
  String newInsurerCity;
  String newInsurerRegion;
  String newInsurerZip;
  String newInsurerPhone;
  String newInsurerPayerId;
  String newInsurerPayerType;
  String newInsurerX12Partner;
  String cqmPaymentSource;
  String planName;
  String subscriber;
  String effectiveDate;
  String relationship;
  String policyNumber;
  String dateOfBirth;
  String groupNumber;
  String sS;
  String subscriberEmployer;
  String sex;
  String seAddress;
  String seAddress1;
  String seCity;
  String seRegion;
  String seCountry;
  String subscriberAddress;
  String subscriberAddress1;
  String subscriberCity;
  String providerRegion;
  String subscriberCountry;
  String subscriberZip;
  String coPay;
  String acceptAssignment;

  SecondaryInsurance({
    required this.insuranceProviderPrimary,
    required this.newInsurerId,
    required this.newInsurerName,
    required this.newInsurerAttention,
    required this.newInsurerAddress1,
    required this.newInsurerAddress2,
    required this.newInsurerCountry,
    required this.newInsurerCity,
    required this.newInsurerRegion,
    required this.newInsurerZip,
    required this.newInsurerPhone,
    required this.newInsurerPayerId,
    required this.newInsurerPayerType,
    required this.newInsurerX12Partner,
    required this.cqmPaymentSource,
    required this.planName,
    required this.subscriber,
    required this.effectiveDate,
    required this.relationship,
    required this.policyNumber,
    required this.dateOfBirth,
    required this.groupNumber,
    required this.sS,
    required this.subscriberEmployer,
    required this.sex,
    required this.seAddress,
    required this.seAddress1,
    required this.seCity,
    required this.seRegion,
    required this.seCountry,
    required this.subscriberAddress,
    required this.subscriberAddress1,
    required this.subscriberCity,
    required this.providerRegion,
    required this.subscriberCountry,
    required this.subscriberZip,
    required this.coPay,
    required this.acceptAssignment,
  });

  factory SecondaryInsurance.fromMap(Map<String, dynamic> json) => SecondaryInsurance(
    insuranceProviderPrimary: json["insuranceProviderPrimary"],
    newInsurerId: json["newInsurerId"],
    newInsurerName: json["newInsurerName"],
    newInsurerAttention: json["newInsurerAttention"],
    newInsurerAddress1: json["newInsurerAddress1"],
    newInsurerAddress2: json["newInsurerAddress2"],
    newInsurerCountry: json["newInsurerCountry"],
    newInsurerCity: json["newInsurerCity"],
    newInsurerRegion: json["newInsurerRegion"],
    newInsurerZip: json["newInsurerZip"],
    newInsurerPhone: json["newInsurerPhone"],
    newInsurerPayerId: json["newInsurerPayerId"],
    newInsurerPayerType: json["newInsurerPayerType"],
    newInsurerX12Partner: json["newInsurerX12Partner"],
    cqmPaymentSource: json["cqmPaymentSource"],
    planName: json["planName"],
    subscriber: json["subscriber"],
    effectiveDate: json["effectiveDate"],
    relationship: json["relationship"],
    policyNumber: json["policyNumber"],
    dateOfBirth: json["dateOfBirth"],
    groupNumber: json["groupNumber"],
    sS: json["sS"],
    subscriberEmployer: json["subscriberEmployer"],
    sex: json["sex"],
    seAddress: json["seAddress"],
    seAddress1: json["seAddress1"],
    seCity: json["seCity"],
    seRegion: json["seRegion"],
    seCountry: json["seCountry"],
    subscriberAddress: json["subscriberAddress"],
    subscriberAddress1: json["subscriberAddress1"],
    subscriberCity: json["subscriberCity"],
    providerRegion: json["providerRegion"],
    subscriberCountry: json["subscriberCountry"],
    subscriberZip: json["subscriberZip"],
    coPay: json["coPay"],
    acceptAssignment: json["acceptAssignment"],
  );

  Map<String, dynamic> toMap() => {
    "insuranceProviderPrimary": insuranceProviderPrimary,
    "newInsurerId": newInsurerId,
    "newInsurerName": newInsurerName,
    "newInsurerAttention": newInsurerAttention,
    "newInsurerAddress1": newInsurerAddress1,
    "newInsurerAddress2": newInsurerAddress2,
    "newInsurerCountry": newInsurerCountry,
    "newInsurerCity": newInsurerCity,
    "newInsurerRegion": newInsurerRegion,
    "newInsurerZip": newInsurerZip,
    "newInsurerPhone": newInsurerPhone,
    "newInsurerPayerId": newInsurerPayerId,
    "newInsurerPayerType": newInsurerPayerType,
    "newInsurerX12Partner": newInsurerX12Partner,
    "cqmPaymentSource": cqmPaymentSource,
    "planName": planName,
    "subscriber": subscriber,
    "effectiveDate": effectiveDate,
    "relationship": relationship,
    "policyNumber": policyNumber,
    "dateOfBirth": dateOfBirth,
    "groupNumber": groupNumber,
    "sS": sS,
    "subscriberEmployer": subscriberEmployer,
    "sex": sex,
    "seAddress": seAddress,
    "seAddress1": seAddress1,
    "seCity": seCity,
    "seRegion": seRegion,
    "seCountry": seCountry,
    "subscriberAddress": subscriberAddress,
    "subscriberAddress1": subscriberAddress1,
    "subscriberCity": subscriberCity,
    "providerRegion": providerRegion,
    "subscriberCountry": subscriberCountry,
    "subscriberZip": subscriberZip,
    "coPay": coPay,
    "acceptAssignment": acceptAssignment,
  };
}

class TertiaryInsurance {
  String insuranceProviderPrimary;
  String newInsurerId;
  String newInsurerName;
  String newInsurerAttention;
  String newInsurerAddress1;
  String newInsurerAddress2;
  String newInsurerCountry;
  String newInsurerCity;
  String newInsurerRegion;
  String newInsurerZip;
  String newInsurerPhone;
  String newInsurerPayerId;
  String newInsurerPayerType;
  String newInsurerX12Partner;
  String cqmPaymentSource;
  String planName;
  String subscriber;
  String effectiveDate;
  String relationship;
  String policyNumber;
  String dateOfBirth;
  String groupNumber;
  String sS;
  String subscriberEmployer;
  String sex;
  String seAddress;
  String seAddress1;
  String seCity;
  String seRegion;
  String seCountry;
  String subscriberAddress;
  String subscriberAddress1;
  String subscriberCity;
  String subscriberRegion;
  String subscriberCountry;
  String subscriberZip;
  String coPay;
  String acceptAssignment;

  TertiaryInsurance({
    required this.insuranceProviderPrimary,
    required this.newInsurerId,
    required this.newInsurerName,
    required this.newInsurerAttention,
    required this.newInsurerAddress1,
    required this.newInsurerAddress2,
    required this.newInsurerCountry,
    required this.newInsurerCity,
    required this.newInsurerRegion,
    required this.newInsurerZip,
    required this.newInsurerPhone,
    required this.newInsurerPayerId,
    required this.newInsurerPayerType,
    required this.newInsurerX12Partner,
    required this.cqmPaymentSource,
    required this.planName,
    required this.subscriber,
    required this.effectiveDate,
    required this.relationship,
    required this.policyNumber,
    required this.dateOfBirth,
    required this.groupNumber,
    required this.sS,
    required this.subscriberEmployer,
    required this.sex,
    required this.seAddress,
    required this.seAddress1,
    required this.seCity,
    required this.seRegion,
    required this.seCountry,
    required this.subscriberAddress,
    required this.subscriberAddress1,
    required this.subscriberCity,
    required this.subscriberRegion,
    required this.subscriberCountry,
    required this.subscriberZip,
    required this.coPay,
    required this.acceptAssignment,
  });

  factory TertiaryInsurance.fromMap(Map<String, dynamic> json) => TertiaryInsurance(
    insuranceProviderPrimary: json["insuranceProviderPrimary"],
    newInsurerId: json["newInsurerId"],
    newInsurerName: json["newInsurerName"],
    newInsurerAttention: json["newInsurerAttention"],
    newInsurerAddress1: json["newInsurerAddress1"],
    newInsurerAddress2: json["newInsurerAddress2"],
    newInsurerCountry: json["newInsurerCountry"],
    newInsurerCity: json["newInsurerCity"],
    newInsurerRegion: json["newInsurerRegion"],
    newInsurerZip: json["newInsurerZip"],
    newInsurerPhone: json["newInsurerPhone"],
    newInsurerPayerId: json["newInsurerPayerId"],
    newInsurerPayerType: json["newInsurerPayerType"],
    newInsurerX12Partner: json["newInsurerX12Partner"],
    cqmPaymentSource: json["cqmPaymentSource"],
    planName: json["planName"],
    subscriber: json["subscriber"],
    effectiveDate: json["effectiveDate"],
    relationship: json["relationship"],
    policyNumber: json["policyNumber"],
    dateOfBirth: json["dateOfBirth"],
    groupNumber: json["groupNumber"],
    sS: json["sS"],
    subscriberEmployer: json["subscriberEmployer"],
    sex: json["sex"],
    seAddress: json["seAddress"],
    seAddress1: json["seAddress1"],
    seCity: json["seCity"],
    seRegion: json["seRegion"],
    seCountry: json["seCountry"],
    subscriberAddress: json["subscriberAddress"],
    subscriberAddress1: json["subscriberAddress1"],
    subscriberCity: json["subscriberCity"],
    subscriberRegion: json["subscriberRegion"],
    subscriberCountry: json["subscriberCountry"],
    subscriberZip: json["subscriberZip"],
    coPay: json["coPay"],
    acceptAssignment: json["acceptAssignment"],
  );

  Map<String, dynamic> toMap() => {
    "insuranceProviderPrimary": insuranceProviderPrimary,
    "newInsurerId": newInsurerId,
    "newInsurerName": newInsurerName,
    "newInsurerAttention": newInsurerAttention,
    "newInsurerAddress1": newInsurerAddress1,
    "newInsurerAddress2": newInsurerAddress2,
    "newInsurerCountry": newInsurerCountry,
    "newInsurerCity": newInsurerCity,
    "newInsurerRegion": newInsurerRegion,
    "newInsurerZip": newInsurerZip,
    "newInsurerPhone": newInsurerPhone,
    "newInsurerPayerId": newInsurerPayerId,
    "newInsurerPayerType": newInsurerPayerType,
    "newInsurerX12Partner": newInsurerX12Partner,
    "cqmPaymentSource": cqmPaymentSource,
    "planName": planName,
    "subscriber": subscriber,
    "effectiveDate": effectiveDate,
    "relationship": relationship,
    "policyNumber": policyNumber,
    "dateOfBirth": dateOfBirth,
    "groupNumber": groupNumber,
    "sS": sS,
    "subscriberEmployer": subscriberEmployer,
    "sex": sex,
    "seAddress": seAddress,
    "seAddress1": seAddress1,
    "seCity": seCity,
    "seRegion": seRegion,
    "seCountry": seCountry,
    "subscriberAddress": subscriberAddress,
    "subscriberAddress1": subscriberAddress1,
    "subscriberCity": subscriberCity,
    "subscriberRegion": subscriberRegion,
    "subscriberCountry": subscriberCountry,
    "subscriberZip": subscriberZip,
    "coPay": coPay,
    "acceptAssignment": acceptAssignment,
  };
}

class UpdatedVital {
  Vitals vitals;
  CardioVascular? cardioVascular;
  DigestiveNutrition? digestiveNutrition;
  Neurological? neurological;
  String? psychosocial;
  Skin? skin;
  Musculoskeletal? musculoskeletal;

  UpdatedVital({
    required this.vitals,
    this.cardioVascular,
    this.digestiveNutrition,
    this.neurological,
    this.psychosocial,
    this.skin,
    this.musculoskeletal,
  });

  factory UpdatedVital.fromMap(Map<String, dynamic> json) => UpdatedVital(
    vitals: Vitals.fromMap(json["vitals"]),
    cardioVascular: json["cardioVascular"] == null ? null : CardioVascular.fromMap(json["cardioVascular"]),
    digestiveNutrition: json["digestiveNutrition"] == null ? null : DigestiveNutrition.fromMap(json["digestiveNutrition"]),
    neurological: json["neurological"] == null ? null : Neurological.fromMap(json["neurological"]),
    psychosocial: json["psychosocial"],
    skin: json["skin"] == null ? null : Skin.fromMap(json["skin"]),
    musculoskeletal: json["musculoskeletal"] == null ? null : Musculoskeletal.fromMap(json["musculoskeletal"]),
  );

  Map<String, dynamic> toMap() => {
    "vitals": vitals.toMap(),
    "cardioVascular": cardioVascular?.toMap(),
    "digestiveNutrition": digestiveNutrition?.toMap(),
    "neurological": neurological?.toMap(),
    "psychosocial": psychosocial,
    "skin": skin?.toMap(),
    "musculoskeletal": musculoskeletal?.toMap(),
  };
}

class CardioVascular {
  String chestPain;
  String peripheralPulses;
  String dizziness;
  String edema;
  String heartSound;
  String heartSoundClass;
  String capRefillSize;
  String neckVeinDistention;

  CardioVascular({
    required this.chestPain,
    required this.peripheralPulses,
    required this.dizziness,
    required this.edema,
    required this.heartSound,
    required this.heartSoundClass,
    required this.capRefillSize,
    required this.neckVeinDistention,
  });

  factory CardioVascular.fromMap(Map<String, dynamic> json) => CardioVascular(
    chestPain: json["chestPain"],
    peripheralPulses: json["peripheralPulses"],
    dizziness: json["dizziness"],
    edema: json["edema"],
    heartSound: json["heartSound"],
    heartSoundClass: json["heartSoundClass"],
    capRefillSize: json["capRefillSize"],
    neckVeinDistention: json["neckVeinDistention"],
  );

  Map<String, dynamic> toMap() => {
    "chestPain": chestPain,
    "peripheralPulses": peripheralPulses,
    "dizziness": dizziness,
    "edema": edema,
    "heartSound": heartSound,
    "heartSoundClass": heartSoundClass,
    "capRefillSize": capRefillSize,
    "neckVeinDistention": neckVeinDistention,
  };
}

class DigestiveNutrition {
  String bowelSounds;
  String digestiveNutrition;

  DigestiveNutrition({
    required this.bowelSounds,
    required this.digestiveNutrition,
  });

  factory DigestiveNutrition.fromMap(Map<String, dynamic> json) => DigestiveNutrition(
    bowelSounds: json["bowelSounds"],
    digestiveNutrition: json["digestiveNutrition"],
  );

  Map<String, dynamic> toMap() => {
    "bowelSounds": bowelSounds,
    "digestiveNutrition": digestiveNutrition,
  };
}

class Musculoskeletal {
  String musculoskeletal;
  String paralysis;
  String gripStrength;

  Musculoskeletal({
    required this.musculoskeletal,
    required this.paralysis,
    required this.gripStrength,
  });

  factory Musculoskeletal.fromMap(Map<String, dynamic> json) => Musculoskeletal(
    musculoskeletal: json["musculoskeletal"],
    paralysis: json["paralysis"],
    gripStrength: json["gripStrength"],
  );

  Map<String, dynamic> toMap() => {
    "musculoskeletal": musculoskeletal,
    "paralysis": paralysis,
    "gripStrength": gripStrength,
  };
}

class Neurological {
  String neurological;
  String vision;
  String hearing;

  Neurological({
    required this.neurological,
    required this.vision,
    required this.hearing,
  });

  factory Neurological.fromMap(Map<String, dynamic> json) => Neurological(
    neurological: json["neurological"],
    vision: json["vision"],
    hearing: json["hearing"],
  );

  Map<String, dynamic> toMap() => {
    "neurological": neurological,
    "vision": vision,
    "hearing": hearing,
  };
}

class Skin {
  String skin;
  String tugor;

  Skin({
    required this.skin,
    required this.tugor,
  });

  factory Skin.fromMap(Map<String, dynamic> json) => Skin(
    skin: json["skin"],
    tugor: json["tugor"],
  );

  Map<String, dynamic> toMap() => {
    "skin": skin,
    "tugor": tugor,
  };
}

class Vitals {
  DateTime captureDate;
  String captureTime;
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
    required this.captureDate,
    required this.captureTime,
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
    captureDate: DateTime.parse(json["captureDate"]),
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
    "captureDate": "${captureDate.year.toString().padLeft(4, '0')}-${captureDate.month.toString().padLeft(2, '0')}-${captureDate.day.toString().padLeft(2, '0')}",
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


import 'package:Live_Connected_Admin/core/shared/date_formats.dart';

class ChildDto {
  String id;
  bool active = true;
  List<String> allergies;
  bool captureMedicalDetails = true;
  DateTime created;
  DateTime dob;
  String gender;
  String doctorName;
  String doctorNumber;
  String familyId;
  String firstName;
  String lastName;
  String emailAddress;
  String cellNumber;
  String medicalAidName;
  String medicalAidNumber;
  DateTime modified;
  String userId;
  bool ownChild;
  ChildDto( this.id, this.active, allergies, this.userId, this.captureMedicalDetails, String dob, String gender,
      String created, this.doctorName, this.doctorNumber, this.familyId, this.firstName, this.lastName,
      this.medicalAidNumber, this.medicalAidName, String modified, this.ownChild, this.emailAddress, this.cellNumber){
    this.allergies = allergies != null ? (allergies as List).map((data) =>data).toList() : null;
    this.created = created != null ? responseDateFormat.parse(created) : null;
    this.dob = dob != null ? responseDateFormat.parse(dob) : null;
    this.modified = modified != null ? responseDateFormat.parse(modified) : null;
  }

  ChildDto.newInstance(
      {
        this.allergies,
        this.dob,
        this.firstName,
        this.lastName,
        this.ownChild,
        this.emailAddress,
        this.cellNumber
      }

      );

  ChildDto.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    active = json['active'];
    allergies = json.containsKey('allergies') && json['allergies'] != null ? (json['allergies'] as List).map((data) =>data as String).toList() : null;
    captureMedicalDetails = json['captureMedicalDetails'];
    created = json.containsKey('created') && json['created'] != null ? responseDateFormat.parse(json['created']) : null;
    dob = json.containsKey('dob') && json['dob'] != null ? responseDateFormat.parse(json['dob']) : null;
    gender = json['gender'];
    doctorName = json['doctorName'];
    doctorNumber = json['doctorNumber'];
    familyId = json['familyId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    medicalAidNumber = json['medicalAidNumber'];
    medicalAidName = json['medicalAidName'];
    modified = json.containsKey('modified') && json['modified'] != null ? responseDateFormat.parse(json['modified']) : null;
    ownChild = json['ownChild'];
    emailAddress = json['emailAddress'];
    cellNumber = json['cellNumber'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['_id'] = this.id;
    }
    if (this.active != null) {
      data['active'] = this.active;
    }
    if (this.allergies != null) {
      data['allergies'] = this.allergies;
    }
    if(this.dob != null) {
      data['dob'] = this.dob.toIso8601String();
    }
    if (this.gender != null) {
      data['gender'] = this.gender;
    }
    if (this.captureMedicalDetails != null) {
      data['captureMedicalDetails'] = this.captureMedicalDetails;
    }
    if (this.doctorName != null) {
      data['doctorName'] = this.doctorName;
    }
    if (this.doctorNumber != null) {
      data['doctorNumber'] = this.doctorNumber;
    }
    if (this.familyId != null) {
      data['familyId'] = this.familyId;
    }
    if (this.firstName != null) {
      data['firstName'] = this.firstName;
    }
    if (this.lastName != null) {
      data['lastName'] = this.lastName;
    }
    if (this.medicalAidName != null) {
      data['medicalAidName'] = this.medicalAidName;
    }
    if (this.medicalAidNumber != null) {
      data['medicalAidNumber'] = this.medicalAidNumber;
    }
    if (this.ownChild != null) {
      data['ownChild'] = this.ownChild;
    }
    if (this.emailAddress != null) {
      data['emailAddress'] = this.emailAddress;
    }
    if (this.cellNumber != null) {
      data['cellNumber'] = this.cellNumber;
    }

    return data;
  }
}
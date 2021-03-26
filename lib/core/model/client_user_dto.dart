

import 'package:nomah/core/shared/date_formats.dart';

import 'device.dart';

class ClientUserDto {
  String _id;
  String _firstName;
  String _lastName;
  String emailAddress;
  String _cellNumber;
  String uid;
  String emergencyContactName;
  String emergencyContactNumber;
  String medicalAidName;
  String medicalAidNumber;
  String relationship;
  String accessRights;
  DateTime dob;
  String gender;
  String userType;
  String passport;
  String idNumber;
  String familyId;
  String doctorName;
  String doctorNumber;
  Device device;
  bool loggedIn;
  String idToken;

  ClientUserDto(
      this.idToken,
      this._id,
      this.familyId,
      this.doctorName,
      this.doctorNumber,
      this.idNumber,
      this._firstName,
      this._lastName,
      this.emailAddress,
      this._cellNumber,
      this.emergencyContactName,
      this.emergencyContactNumber,
      this.relationship,
      this.accessRights,
      this.medicalAidName,
      this.medicalAidNumber,
      dob,
      this.gender,
      this.userType,
      this.passport,
      device,
      photoUrl) {
    this.dob = dob != null ? responseDateFormat.parse(dob) : null;
    this.device = device != null ? Device.fromJson(device) : null;
  }

  String get id => _id;

  String get firstName => _firstName ?? "";

  String get lastName => _lastName ?? "";

  String get cellNumber => _cellNumber ?? "";


  set firstName(String value) {
    _firstName = value;
  }

  set lastName(String value) {
    _lastName = value;
  }

  set cellNumber(String value) {
    _cellNumber = value;
  }

  ClientUserDto.initial()
      : _id = " ",
        idNumber = "",
        emailAddress = '',
        uid = '';

  ClientUserDto.newInstance(
      this._firstName,
      this._lastName,
      this._cellNumber,
      {this.emailAddress,
      this.emergencyContactNumber,
      this.relationship,
      this.accessRights,
      this.idNumber,
      this.loggedIn});

  ClientUserDto.fromJson(Map<String, dynamic> json) {
    _id = json['_id'];
    idNumber = json['idNumber'];
    doctorNumber = json['doctorNumber'];
    doctorName = json['doctorName'];
    familyId = json['familyId'];
    _firstName = json['firstName'];
    uid = json['uid'];
    _lastName = json['lastName'];
    relationship = json['relationship'];
    accessRights = json['accessRights'];
    emailAddress = json['emailAddress'];
    _cellNumber = json['cellNumber'];
    emergencyContactName = json['emergencyContactName'];
    emergencyContactNumber = json['emergencyContactNumber'];
    medicalAidNumber = json['medicalAidNumber'];
    medicalAidName = json['medicalAidName'];
    dob = json.containsKey('dob') && json['dob'] != null
        ? responseDateFormat.parse(json['dob'])
        : null;
    gender = json['gender'];
    userType = json['userType'];
    passport = json['passport'];
    device = json.containsKey('device') && json['device'] != null
        ? Device.fromJson(json['device'])
        : null;
    idToken = json['idToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._id != null) {
      data['_id'] = this._id;
    }

    if (this.idNumber != null) {
      data['idNumber'] = this.idNumber;
    }
    if (this._firstName != null) {
      data['firstName'] = this._firstName;
    }
    if (this.uid != null) {
      data['uid'] = this.uid;
    }
    if (this._lastName != null) {
      data['lastName'] = this._lastName;
    }
    if (this.emailAddress != null) {
      data['emailAddress'] = this.emailAddress;
    }
    if (this._cellNumber != null) {
      data['cellNumber'] = this._cellNumber;
    }
    if (this.emergencyContactName != null) {
      data['emergencyContactName'] = this.emergencyContactName;
    }
    if (this.emergencyContactNumber != null) {
      data['emergencyContactNumber'] = this.emergencyContactNumber;
    }

    if (this.medicalAidName != null) {
      data['medicalAidName'] = this.medicalAidName;
    }
    if (this.medicalAidNumber != null) {
      data['medicalAidNumber'] = this.medicalAidNumber;
    }
    if (this.dob != null) {
      data['dob'] = this.dob.toIso8601String();
    }
    if (this.gender != null) {
      data['gender'] = this.gender;
    }
    if (this.userType != null) {
      data['userType'] = this.userType;
    }
    if (this.passport != null) {
      data['passport'] = this.passport;
    }
    if (this.familyId != null) {
      data['familyId'] = this.familyId;
    }
    if (this.doctorName != null) {
      data['doctorName'] = this.doctorName;
    }
    if (this.doctorNumber != null) {
      data['doctorNumber'] = this.doctorNumber;
    }
    if (this.device != null) {
      data['device'] = this.device.toJson();
    }
    if (this.relationship != null) {
      data['relationship'] = this.relationship;
    }
    if (this.accessRights != null) {
      data['accessRights'] = this.accessRights;
    }
    if (this.idToken != null) {
      data['idToken'] = this.idToken;
    }
    return data;
  }
}

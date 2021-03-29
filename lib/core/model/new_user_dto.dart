
import 'package:Live_Connected_Admin/core/model/device.dart';

class NewUserDto {
  Device device;
  String firstName;
  String lastName;
  String emailAddress;
  String cellNumber;
  String emergencyContactName;
  String emergencyContactNumber;
  String medicalAidName;
  String medicalAidNumber;
  bool captureMedicalDetails;
  String uid;

  NewUserDto(
      {this.firstName,
      this.lastName,
      this.emailAddress,
      this.cellNumber,
      device,
      this.emergencyContactName,
      this.emergencyContactNumber,
      this.captureMedicalDetails,
      this.medicalAidName,
      this.medicalAidNumber,
      this.uid}) {
    this.device = device != null ? Device.fromJson(device) : null;
  }

  NewUserDto.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    cellNumber = json['cellNumber'];
    device = json.containsKey("device") && json["device"] != null
        ? Device.fromJson(json["device"])
        : null;
    emergencyContactName = json['emergencyContactName'];
    emergencyContactNumber = json['emergencyContactNumber'];
    captureMedicalDetails = json['captureMedicalDetails'];
    medicalAidName = json['medicalAidName'];
    medicalAidNumber = json['medicalAidNumber'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.firstName != null) {
      data['firstName'] = this.firstName;
    }
    if (this.lastName != null) {
      data['lastName'] = this.lastName;
    }
    if (this.emailAddress != null) {
      data['emailAddress'] = this.emailAddress;
    }
    if (this.cellNumber != null) {
      data['cellNumber'] = this.cellNumber;
    }
    if (this.emergencyContactName != null) {
      data['emergencyContactName'] = this.emergencyContactName;
    }
    if (this.emergencyContactNumber != null) {
      data['emergencyContactNumber'] = this.emergencyContactNumber;
    }
    if (this.captureMedicalDetails != null) {
      data['captureMedicalDetails'] = this.captureMedicalDetails;
    }
    if (this.medicalAidName != null) {
      data['medicalAidName'] = this.medicalAidName;
    }
    if (this.medicalAidNumber != null) {
      data['medicalAidName'] = this.medicalAidNumber;
    }
    if (this.device != null) {
      data['device'] = this.device.toJson();
    }
    if (this.uid != null) {
      data['uid'] = this.uid;
    }

    return data;
  }
}

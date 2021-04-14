
import 'package:Live_Connected_Admin/core/model/file_dto.dart';

import 'device.dart';

class MilestoneDto {
  String _id;
  String title;
  String description;
  FileDto photoUrl;
  Device device;
  MilestoneDto(
      device,
      photoUrl) {
    this.device = device != null ? Device.fromJson(device) : null;
    this.photoUrl = photoUrl != null ? FileDto.fromJson(device) : null;
  }

  String get id => _id;

  MilestoneDto.initial()
      : _id = " ";

  MilestoneDto.newInstance(
      {this.title,
        this.description,});

  MilestoneDto.fromJson(Map<String, dynamic> json) {
    _id = json['_id'];
    title = json['title'];
    description = json['description'];
    photoUrl = json.containsKey('photoUrl') && json['photoUrl'] != null
        ? FileDto.fromJson(json['photoUrl'])
        : null;
    device = json.containsKey('device') && json['device'] != null
        ? Device.fromJson(json['device'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.device != null) {
      data['device'] = this.device;
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.description != null) {
      data['description'] = this.description;
    }
    if (this.photoUrl != null) {
      data['photoUrl'] = this.photoUrl.toJson();
    }
    return data;
  }
}
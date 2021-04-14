import 'package:Live_Connected_Admin/core/model/activity_dto.dart';
import 'package:Live_Connected_Admin/core/shared/date_formats.dart';

class OccurrenceDto {
  String id;
  String children;
  String assignedTo;
  String pickupAddress;
  DateTime startDate;
  DateTime endDate;
  String title;
  bool myActivity;
  ActivityDto activityDto;

  OccurrenceDto(this.startDate, this.endDate, this.title);

  OccurrenceDto.dummyInstance(this.title, this.startDate);

  OccurrenceDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    children = json['children'];
    assignedTo = json['assignedTo'];
    pickupAddress = json['pickupAddress'];
    startDate = json.containsKey('startDate') && json['startDate'] != null
        ? responseDateFormat.parse(json['startDate']) : null;
    endDate = json.containsKey('endDate') && json['endDate'] != null
        ? responseDateFormat.parse(json['endDate']) : null;
    title = json['title'];
    myActivity = json['myActivity'];
    activityDto = json.containsKey('activityDto') && json['activityDto'] != null ? ActivityDto.fromJson(json['activityDto']) :  null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.id != null) {
      data['id'] = this.id;
    }
    if(this.children != null) {
      data['children'] = this.children;
    }
    if(this.assignedTo != null) {
      data['assignedTo'] = this.assignedTo;
    }
    if(this.pickupAddress != null) {
      data['pickupAddress'] = this.pickupAddress;
    }
    if (this.startDate != null) {
      data['startDate'] = this.startDate.toIso8601String();
    }
    if (this.endDate != null) {
      data['endDate'] = this.endDate.toIso8601String();
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.myActivity != null) {
      data['myActivity'] = this.myActivity;
    }
    return data;
  }

  Map<String, dynamic> toJson2() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.id != null) {
      data['id'] = this.id;
    }
    if(this.children != null) {
      data['children'] = this.children;
    }
    if(this.assignedTo != null) {
      data['assignedTo'] = this.assignedTo;
    }
    if(this.pickupAddress != null) {
      data['pickupAddress'] = this.pickupAddress;
    }
    if (this.startDate != null) {
      data['startDate'] = this.startDate.toIso8601String();
    }
    if (this.endDate != null) {
      data['endDate'] = this.endDate.toIso8601String();
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.myActivity != null) {
      data['myActivity'] = this.myActivity;
    }
    if (this.activityDto != null) {
      data['activityDto'] = this.activityDto.toJson();
    }
    return data;
  }
}
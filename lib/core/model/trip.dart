
import 'package:Live_Connected_Admin/core/model/alert.dart';
import 'package:Live_Connected_Admin/core/shared/date_formats.dart';

import 'occurrence_dto.dart';

class Trip {
  String id;
  DateTime created;
  DateTime statusChange;
  String activityId;
  String tripStatus;
  double rating;
  String assignedUserId;
  OccurrenceDto occurrenceDto;
  List<Alert> alertList;

  Trip(this.id, this.created, this.statusChange, this.activityId,
      this.tripStatus, this.rating, this.assignedUserId, this.occurrenceDto, this.alertList);

  Trip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json.containsKey('created') && json['created'] != null
        ? responseDateFormat.parse(json['created']) : null;
    statusChange = json.containsKey('statusChange') && json['statusChange'] != null
        ? responseDateFormat.parse(json['statusChange']) : null;
    activityId = json['activityId'];
    tripStatus = json['tripStatus'];
    rating = json['rating'];
    assignedUserId = json['assignedUserId'];
    occurrenceDto = json.containsKey('occurrenceDto') && json['occurrenceDto'] != null
        ? OccurrenceDto.fromJson(json['occurrenceDto']) :  null;
    alertList = json.containsKey('alertList') && json['alertList'] != null
        ? (json['alertList'] as List).map((data) => Alert.fromJson(data)).toList(): null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.created != null) {
      data['created'] = this.created.toIso8601String();
    }
    if (this.statusChange != null) {
      data['statusChange'] = this.statusChange.toIso8601String();
    }
    if (this.activityId != null) {
      data['activityId'] = this.activityId;
    }
    if (this.tripStatus != null) {
      data['tripStatus'] = this.tripStatus;
    }
    if (this.rating != null) {
      data['rating'] = this.rating;
    }
    if (this.assignedUserId != null) {
      data['assignedUserId'] = this.assignedUserId;
    }
    if (this.occurrenceDto != null) {
      data['occurrenceDto'] = this.occurrenceDto.toJson();
    }
    if (this.alertList != null) {
      data['alertList'] = this.alertList.map((data) => data.toJson()).toList();
    }

    return data;
  }
}
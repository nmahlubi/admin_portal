
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/place_dto.dart';
import 'package:Live_Connected_Admin/core/model/route.dart';
import 'package:Live_Connected_Admin/core/model/trip.dart';
import 'package:Live_Connected_Admin/core/shared/date_formats.dart';

import 'child_dto.dart';
import 'occurrence_dto.dart';
class ActivityDto {
  String _id;
  String title;
  DateTime created;
  List<String> childIds;
  List<ChildDto> children;
  List<String> customDays;
  DateTime startDateTime;
  DateTime endDateTime;
  DateTime lastOccurrenceDate;
  String frequency;
  PlaceDto pickupLocation;
  PlaceDto dropOffLocation;
  ClientUserDto assignedVillager;
  String userId;
  String extraMessage;
  String activityColor;
  DateTime modified;
  Route route;
  List<OccurrenceDto> occurrences;
  String customFrequency;
  String monthlyRepeatOption;
  List<Trip> trips;
  String accessRights;
  ClientUserDto owner;

  ActivityDto.newInstance(
      this.title,
      this.children,
      this.startDateTime,
      this.endDateTime,
      this.frequency,
      this.pickupLocation,
      this.dropOffLocation);

  ActivityDto.dummyInstance(
      this.title,
      this.startDateTime
      );

  ActivityDto(
      this._id,
      {this.title,
        this.created,
        this.childIds,
        this.children,
        this.startDateTime,
        this.endDateTime,
        this.lastOccurrenceDate,
        this.frequency,
        this.pickupLocation,
        this.dropOffLocation,
        this.assignedVillager,
        this.userId,
        this.extraMessage,
        this.activityColor,
        this.modified,
        this.route,
        this.occurrences,
        this.customFrequency,
        this.customDays,
        this.monthlyRepeatOption,
        this.trips,
        this.accessRights,
        this.owner
      });

  ActivityDto.fromJson(Map<String, dynamic> json) {
    _id = json['_id'];
    title = json['title'];
    created = json.containsKey('created') && json['created'] != null
        ? responseDateFormat.parse(json['created']) : null;
    childIds = json.containsKey('childIds') && json['childIds'] != null
        ? (json['childIds'] as List).map((data) =>data as String).toList() : null;
    children = json.containsKey('children') && json['children'] != null
        ? (json['children'] as List).map((data) => ChildDto.fromJson(data)).toList(): null;
    startDateTime = json.containsKey('startDateTime') && json['startDateTime'] != null
        ? responseDateFormat.parse(json['startDateTime']) : null;
    endDateTime = json.containsKey('endDateTime') && json['endDateTime'] != null
        ? responseDateFormat.parse(json['endDateTime']) : null;
    lastOccurrenceDate = json.containsKey('lastOccurrenceDate') && json['lastOccurrenceDate'] != null
        ? responseDateFormat.parse(json['lastOccurrenceDate']) : null;
    frequency = json['frequency'];
    pickupLocation = json.containsKey('pickupLocation') && json['pickupLocation'] != null ? PlaceDto.fromJson(json['pickupLocation']) :  null;
    dropOffLocation = json.containsKey('dropOffLocation') && json['dropOffLocation'] != null ? PlaceDto.fromJson(json['dropOffLocation']) :  null;
    assignedVillager = json.containsKey('assignedVillager') && json['assignedVillager'] != null ? ClientUserDto.fromJson(json['assignedVillager']) :  null;
    userId = json['userId'];
    extraMessage = json['extraMessage'];
    activityColor = json['activityColor'];
    modified = json.containsKey('modified') && json['modified'] != null
        ? responseDateFormat.parse(json['modified']) : null;
    route = json.containsKey('route') && json['route'] != null ? Route.fromJson(json['route']) :  null;
    occurrences = json.containsKey('occurrences') && json['occurrences'] != null
        ? (json['occurrences'] as List).map((data) => OccurrenceDto.fromJson(data)).toList(): null;
    customFrequency = json['customFrequency'];
    monthlyRepeatOption = json['monthlyRepeatOption'];
    customDays = json.containsKey('customDays') && json['customDays'] != null
        ? (json['customDays'] as List).map((data) =>data as String).toList() : null;
    trips = json.containsKey('trips') && json['trips'] != null
        ? (json['trips'] as List).map((data) => Trip.fromJson(data)).toList(): null;
    accessRights = json['accessRights'];
    owner = json.containsKey('owner') && json['owner'] != null ? ClientUserDto.fromJson(json['owner']) :  null;
  }

  String get id => _id;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._id != null) {
      data['_id'] = this._id;
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.created != null) {
      data['created'] = this.created.toIso8601String();
    }
    if (this.childIds != null) {
      data['childIds'] = this.childIds;
    }
    if (this.children != null) {
      data['children'] = this.children.map((data) => data.toJson()).toList();
    }
    if (this.startDateTime != null) {
      data['startDateTime'] = this.startDateTime.toIso8601String();
    }
    if (this.endDateTime != null) {
      data['endDateTime'] = this.endDateTime.toIso8601String();
    }
    if (this.lastOccurrenceDate != null) {
      data['lastOccurrenceDate'] = this.lastOccurrenceDate.toIso8601String();
    }
    if (this.frequency != null) {
      data['frequency'] = this.frequency;
    }
    if (this.pickupLocation != null) {
      data['pickupLocation'] = this.pickupLocation.toJson();
    }
    if (this.dropOffLocation != null) {
      data['dropOffLocation'] = this.dropOffLocation.toJson();
    }
    if (this.assignedVillager != null) {
      data['assignedVillager'] = this.assignedVillager.toJson();
    }
    if (this.userId != null) {
      data['userId'] = this.userId;
    }
    if (this.extraMessage != null) {
      data['extraMessage'] = this.extraMessage;
    }
    if (this.activityColor != null) {
      data['activityColor'] = this.activityColor;
    }
    if (this.modified != null) {
      data['modified'] = this.modified.toIso8601String();
    }
    if (this.customFrequency != null) {
      data['customFrequency'] = this.customFrequency;
    }
    if (this.customDays != null) {
      data['customDays'] = this.customDays;
    }
    if (this.monthlyRepeatOption != null) {
      data['monthlyRepeatOption'] = this.monthlyRepeatOption;
    }

    return data;
  }

  Map<String, dynamic> toJson2() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._id != null) {
      data['_id'] = this._id;
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.created != null) {
      data['created'] = this.created.toIso8601String();
    }
    if (this.childIds != null) {
      data['childIds'] = this.childIds;
    }
    if (this.children != null) {
      data['children'] = this.children.map((data) => data.toJson()).toList();
    }
    if (this.startDateTime != null) {
      data['startDateTime'] = this.startDateTime.toIso8601String();
    }
    if (this.endDateTime != null) {
      data['endDateTime'] = this.endDateTime.toIso8601String();
    }
    if (this.lastOccurrenceDate != null) {
      data['lastOccurrenceDate'] = this.lastOccurrenceDate.toIso8601String();
    }
    if (this.frequency != null) {
      data['frequency'] = this.frequency;
    }
    if (this.pickupLocation != null) {
      data['pickupLocation'] = this.pickupLocation.toJson();
    }
    if (this.dropOffLocation != null) {
      data['dropOffLocation'] = this.dropOffLocation.toJson();
    }
    if (this.assignedVillager != null) {
      data['assignedVillager'] = this.assignedVillager.toJson();
    }
    if (this.userId != null) {
      data['userId'] = this.userId;
    }
    if (this.extraMessage != null) {
      data['extraMessage'] = this.extraMessage;
    }
    if (this.activityColor != null) {
      data['activityColor'] = this.activityColor;
    }
    if (this.modified != null) {
      data['modified'] = this.modified.toIso8601String();
    }
    if (this.occurrences != null) {
      data['occurrences'] = occurrences.length;
    }
    if (this.customFrequency != null) {
      data['customFrequency'] = this.customFrequency;
    }
    if (this.customDays != null) {
      data['customDays'] = this.customDays;
    }
    if (this.monthlyRepeatOption != null) {
      data['monthlyRepeatOption'] = this.monthlyRepeatOption;
    }
    if (this.trips != null) {
      data['trips'] = this.trips.map((data) => data.toJson()).toList();
    }
    if (this.accessRights != null) {
      data['accessRights'] = this.accessRights;
    }

    return data;
  }
}
import 'package:Live_Connected_Admin/core/model/activity_dto.dart';
import 'package:Live_Connected_Admin/core/model/child_dto.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/milestone.dart';

class UserDto {
  List<ChildDto> children;
  List<ClientUserDto> familyMembers;
  List<MilestoneDto> milestones;
  List<ActivityDto> activities;

  UserDto(
      children,
      familyMembers,
      milestones,
      activities
      ) {
    this.children = children != null ? (children as List).map((data) =>ChildDto.fromJson(data)).toList() : null;
    this.familyMembers = familyMembers != null ? (familyMembers as List).map((data) =>ClientUserDto.fromJson(data)).toList() : null;
    this.milestones = milestones != null ? (milestones as List).map((data) =>MilestoneDto.fromJson(data)).toList() : null;
    this.activities = activities != null ? (activities as List).map((data) =>ActivityDto.fromJson(data)).toList() : null;
  }
  UserDto.newInstance({
    this.children,
    this.familyMembers,
    this.milestones,
    this.activities
  });
  UserDto.fromJson(Map<String, dynamic> json) {
    children = json.containsKey("children") && json["children"] != null
        ? (json['children'] as List).map((data) =>ChildDto.fromJson(data)).toList()  : null;
    familyMembers =
    json.containsKey("familyMembers") && json["familyMembers"] != null
        ? (json['familyMembers'] as List).map((data) =>ClientUserDto.fromJson(data)).toList()  : null;
    milestones = json.containsKey("milestones") && json["milestones"] != null
        ? (json['milestones'] as List).map((data) =>MilestoneDto.fromJson(data)).toList()  : null;
    activities = json.containsKey("activities") && json["activities"] != null
        ? (json['activities'] as List).map((data) =>ActivityDto.fromJson(data)).toList()  : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.children != null) {
      data['children'] = this.children.map((data) => data.toJson()).toList();
    }
    if (this.familyMembers != null) {
      data['familyMembers'] = this.familyMembers.map((data) => data.toJson()).toList();
    }
    if (this.milestones != null) {
      data['milestones'] = this.milestones.map((data) => data.toJson()).toList();
    }
    if (this.activities != null) {
      data['activities'] = this.activities.map((data) => data.toJson()).toList();
    }
    return data;
  }
}
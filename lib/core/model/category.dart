import 'package:Live_Connected_Admin/core/shared/date_formats.dart';

class Category {
  String id;
  bool active;
  String categoryType;
  DateTime created;
  DateTime modified;
  String name;
  String parentId;

  Category(
      {this.id,
      this.name,
      this.created,
      this.modified,
      this.categoryType,
      this.parentId,
      this.active});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    categoryType = json['categoryType'];
    parentId = json['parentId'];
    active = json['active'];
    name = json['name'];
    modified = json.containsKey('modified') && json['modified'] != null
        ? responseDateFormat.parse(json['modified'])
        : null;
    created = json.containsKey('created') && json['created'] != null
        ? responseDateFormat.parse(json['created'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (name != null) {
      data['name'] = this.name;
    }
    if (categoryType != null) {
      data['categoryType'] = this.categoryType;
    }
    if (parentId != null) {
      data['parentId'] = this.parentId;
    }
    if (active != null) {
      data['active'] = this.active;
    }
    if (created != null) {
      data['created'] = this.created.toIso8601String();
    }
    if (modified != null) {
      data['modified'] = this.modified.toIso8601String();
    }
  }
}

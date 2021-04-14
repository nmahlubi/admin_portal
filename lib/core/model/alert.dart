
import 'package:Live_Connected_Admin/core/shared/date_formats.dart';

import 'client_user_dto.dart';
import 'message_data.dart';

class Alert {
  String id;
  ClientUserDto sender;
  ClientUserDto receiver;
  MessageData content;
  bool isRead;
  DateTime created;
  DateTime actioned;
  String alertType;
  String actionMessage;
  String alertStatus;

  Alert(
      {this.id,
        this.sender,
        this.receiver,
        this.content,
        this.isRead,
        this.created,
        this.actioned,
        this.alertType,
        this.actionMessage,
        this.alertStatus});

  Alert.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json.containsKey('sender') && json['sender'] != null ? ClientUserDto.fromJson(json['sender']) :  null;
    receiver = json.containsKey('receiver') && json['receiver'] != null ? ClientUserDto.fromJson(json['receiver']) :  null;
    content = json.containsKey('content') && json['content'] != null ? MessageData.fromJson(json['content']) :  null;
    isRead = json['isRead'];
    created = json.containsKey('created') && json['created'] != null ? responseDateFormat.parse(json['created']) : null;
    actioned = json.containsKey('actioned') && json['actioned'] != null ? responseDateFormat.parse(json['actioned']) : null;
    alertType = json['alertType'];
    actionMessage = json['actionMessage'];
    alertStatus = json['alertStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.sender != null) {
      data['sender'] = this.sender.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver.toJson();
    }
    if (this.content != null) {
      data['content'] = this.content.toJson();
    }
    if (this.isRead != null) {
      data['isRead'] = this.isRead;
    }
    if (this.created != null) {
      data['created'] = this.created.toIso8601String();
    }
    if (this.actioned != null) {
      data['actioned'] = this.actioned.toIso8601String();
    }
    if (this.alertType != null) {
      data['alertType'] = this.alertType;
    }
    if (this.actionMessage != null) {
      data['actionMessage'] = this.actionMessage;
    }
    if (this.alertStatus != null) {
      data['alertStatus'] = this.alertStatus;
    }

    return data;
  }
}
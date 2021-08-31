import 'package:Live_Connected_Admin/core/shared/date_formats.dart';
import 'package:flutter/foundation.dart';

import 'alert.dart';
import 'client_user_dto.dart';
import 'file_dto.dart';

class Advert {
  String id;
  String title;
  String subtitle;
  String description;
  Category category;
  String buttonText;
  FileDto carouselImage;
  FileDto mainImageUrl;
  String emailAddress;
  String website;
  String cellNumber;
  String facebookLink;
  String instagramLink;
  String linkedInLink;
  String twitterLink;
  DateTime created;
  DateTime modified;
  bool active = true;
  bool addToCarousel;
  String background;
  List<String> likes;
  List<String> views;
  Category subCategory;
  ClientUserDto owner;
  FileDto iconUrl;
  List<Alert> alertList;

  Advert(
      {this.subCategory,
      this.views,
      this.owner,
      this.iconUrl,
      this.alertList,
      this.id,
      this.title,
      this.subtitle,
      this.description,
      this.category,
      this.buttonText,
      this.carouselImage,
      this.mainImageUrl,
      this.emailAddress,
      this.website,
      this.cellNumber,
      this.facebookLink,
      this.instagramLink,
      this.linkedInLink,
      this.twitterLink,
      this.background,
      created,
      modified,
      this.active,
      this.addToCarousel,
      this.likes}) {
    this.created = created != null ? responseDateFormat.parse(created) : null;
    this.modified =
        modified != null ? responseDateFormat.parse(modified) : null;
  }
  Advert.newInstance(
      {this.title,
      this.subtitle,
      this.category,
      this.carouselImage,
      this.description,
      this.emailAddress,
      this.cellNumber});

  Advert.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    subtitle = json["subtitle"];
    description = json["description"];
    // category = json.containsKey('category') && json['category'] != null
    //     ? Category.fromJson(json['category'])
    //     : null;
    // subCategory = json.containsKey('subCategory') && json['subCategory'] != null
    //     ? Category.fromJson(json['subCategory'])
    //     : null;
    background = json["background"];
    buttonText = json["buttonText"];
    likes = json.containsKey('likes') && json['likes'] != null
        ? (json['likes'] as List).map((data) => data as String).toList()
        : null;
    carouselImage =
        json.containsKey('carouselImage') && json['carouselImage'] != null
            ? FileDto.fromJson(json['carouselImage'])
            : null;
    mainImageUrl =
        json.containsKey('mainImageUrl') && json['mainImageUrl'] != null
            ? FileDto.fromJson(json['mainImageUrl'])
            : null;
    emailAddress = json["emailAddress"];
    website = json["website"];
    cellNumber = json["cellNumber"];
    facebookLink = json["facebookLink"];
    instagramLink = json["instagramLink"];
    twitterLink = json["twitterLink"];
    modified = json.containsKey('modified') && json['modified'] != null
        ? responseDateFormat.parse(json['modified'])
        : null;
    created = json.containsKey('created') && json['created'] != null
        ? responseDateFormat.parse(json['created'])
        : null;
    linkedInLink = json["linkedInLink"];
    active = json["active"];
    addToCarousel = json["addToCarousel"];
    views = json.containsKey('views') && json['views'] != null
        ? (json['views'] as List).map((data) => data as String).toList()
        : null;
    owner = json.containsKey('owner') && json['owner'] != null
        ? ClientUserDto.fromJson(json['owner'])
        : null;
    iconUrl = json.containsKey('iconUrl') && json['iconUrl'] != null
        ? FileDto.fromJson(json['iconUrl'])
        : null;
    alertList = json.containsKey('alertList') && json['alertList'] != null
        ? (json['alertList'] as List)
            .map((data) => Alert.fromJson(data))
            .toList()
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['_id'] = this.id;
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.subtitle != null) {
      data['subtitle'] = this.subtitle;
    }
    if (this.background != null) {
      data['background'] = this.background;
    }
    // if (this.category != null) {
    //   data['category'] = this.category.toJson();
    // }
    // if (this.subCategory != null) {
    //   data['subCategory'] = this.subCategory.toJson();
    // }
    if (this.buttonText != null) {
      data['buttonText'] = this.buttonText;
    }
    if (this.carouselImage != null) {
      data['carouselImage'] = this.carouselImage.toJson();
    }
    if (this.mainImageUrl != null) {
      data['mainImageUrl'] = this.mainImageUrl.toJson();
    }
    if (this.emailAddress != null) {
      data['emailAddress'] = this.emailAddress;
    }
    if (this.website != null) {
      data['website'] = this.website;
    }
    if (this.cellNumber != null) {
      data['cellNumber'] = this.cellNumber;
    }
    if (this.facebookLink != null) {
      data['facebookLink'] = this.facebookLink;
    }
    if (this.instagramLink != null) {
      data['instagramLink'] = this.instagramLink;
    }
    if (this.twitterLink != null) {
      data['twitterLink'] = this.twitterLink;
    }
    if (this.modified != null) {
      data['modified'] = this.modified.toIso8601String();
    }
    if (this.created != null) {
      data['created'] = this.created.toIso8601String;
    }
    if (this.description != null) {
      data['description'] = this.description;
    }
    if (this.linkedInLink != null) {
      data['linkedInLink'] = this.linkedInLink;
    }
    if (this.active != null) {
      data['active'] = this.active;
    }
    if (this.addToCarousel != null) {
      data['addToCarousel'] = this.addToCarousel;
    }
    if (this.likes != null) {
      data['likes'] = this.likes;
    }
    if (this.views != null) {
      data['views'] = this.views;
    }
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    if (this.iconUrl != null) {
      data['iconUrl'] = this.iconUrl;
    }
    if (this.alertList != null) {
      data['alertList'] = this.alertList;
    }
    return data;
  }
}

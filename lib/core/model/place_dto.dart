import 'dart:convert';

class PlaceDto {
  String address;
  List<double> loc;
  String suburb;
  String city;
  int code;
  String province;
  String country;

  PlaceDto({this.address, loc, this.suburb, this.city, this.code,
    this.province, this.country}) {
    this.loc = loc != null ? (loc as List).map((data) => data).toList() : null;
  }

  PlaceDto.newInstance(this.address, this.loc);

  PlaceDto.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    loc = json.containsKey('loc') && json['loc'] != null ? (json['loc'] as List).map((data) => double.parse("$data")).toList() : null;
    suburb = json['suburb'];
    city = json['city'];
    code = json['code'];
    province = json['province'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address;
    }
    if (this.loc != null) {
      data['loc'] = this.loc;
    }
    if (this.suburb != null) {
      data['suburb'] = this.suburb;
    }
    if (this.city != null) {
      data['city'] = this.city;
    }
    if (this.code != null) {
      data['code'] = this.code;
    }
    if (this.province != null) {
      data['province'] = this.province;
    }
    if (this.country != null) {
      data['country'] = this.country;
    }

    return data;
  }
}
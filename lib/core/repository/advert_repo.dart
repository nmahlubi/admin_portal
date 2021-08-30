import 'dart:convert';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:flutter/services.dart';

class AdvertRepo {
  Future<String> parseJsonFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath);
  }

  Future<List<Advert>> getLocalCorouselData() async {
    String advertJson =
        await parseJsonFromAssets("assets/json/advert_list.json");
    return (json.decode(advertJson) as List)
        .map((data) => Advert.fromJson(data))
        .toList();
  }
}

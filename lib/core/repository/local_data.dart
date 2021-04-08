import 'dart:convert';

import 'package:Live_Connected_Admin/core/model/country.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class LocalDataRepo {
  Future<String> parseJsonFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath);
  }

  Future<List<Country>> getCountryList() async {
    String categoryJson =
        await parseJsonFromAssets("assets/json/country_list.json");
    return (json.decode(categoryJson) as List)
        .map((data) => Country.fromJson(data))
        .toList();
  }

  // Future<List<StringOption>> getProvinceList() async {
  //   String categoryJson =
  //       await parseJsonFromAssets("assets/json/province_list.json");
  //   return (json.decode(categoryJson) as List)
  //       .map((data) => StringOption.fromJson(data))
  //       .toList();
  // }

  // Future<List<Category>> getCategoryList() async {
  //   String categoryJson =
  //       await parseJsonFromAssets("assets/json/category_list.json");
  //   return (json.decode(categoryJson) as List)
  //       .map((data) => Category.fromJson(data))
  //       .toList();
  // }
}

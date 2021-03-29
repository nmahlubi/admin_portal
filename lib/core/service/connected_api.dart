import 'dart:convert';
import 'dart:io';

import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/device.dart';
import 'package:Live_Connected_Admin/core/model/new_user_dto.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';

class ConnectedApi {
  static const TAG = 'ConnectedApi';
  static String endpoint = debug ? 'api.connected.topcode.co.za:8091': 'api.connectedstay.topcode.co.za';
  static String endpointType = debug ? 'open' : 'secure';
  static String authorityType = debug ? 'http' : "https";

  var client = new http.Client();

  Future<ClientUserDto> register({String authToken, Device device}) async {
    Map<String, String> requestHeaders = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
      "X-Authorization-Firebase": authToken
    };
    Uri uri = authorityType == "http"
        ? Uri.http(endpoint, "/api/v1/user/open/registerAdmin")
        : Uri.https(endpoint, "/api/v1/user/open/registerAdmin");
    final response = await client.post(uri,
        headers: requestHeaders, body: json.encode(device.toJson()));
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return ClientUserDto.fromJson(json.decode(response.body));
    } else if (response.body != null) {
      print(response.body);
      return Future.error(response.body);
    } else {
      print('${response.toString()}');
      return Future.error('${response.toString()}');
    }
  }

  Future<bool> checkUserExists(String uid, Device device) async{
    Map<String, String> requestHeaders = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    Uri uri = authorityType == "http" ? Uri.http(endpoint, "/api/v1/user/open/$uid/exists") : Uri.https(endpoint, "/api/v1/user/open/$uid/exists");
    final response = await client.post(uri, headers: requestHeaders, body: json.encode(device.toJson()));
    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 203 || response.statusCode == 204) {
      return response.body == "true";
    }else if(response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }
}
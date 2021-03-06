import 'dart:convert';
import 'dart:io';

import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/model/category.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/device.dart';
import 'package:Live_Connected_Admin/core/model/occurrence_dto.dart';
import 'package:Live_Connected_Admin/core/model/user_community_count_dto.dart';
import 'package:Live_Connected_Admin/core/model/user_dto.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';

class ConnectedApi {
  static const TAG = 'ConnectedApi';
  static String endpoint = debug
      ? 'api.connected.topcode.co.za:8091'
      : 'api.connectedstay.topcode.co.za';
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

  Future<Map<String, String>> getHeaders({String authToken}) async {
    Map<String, String> requestHeaders = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    bool gms = true; //await CoreHelpers.isGMS();
    if (!gms) {
      requestHeaders.addAll({"Auth-Type": "AUTH_TYPE_HMS"});
    }
    if (authToken != null) {
      requestHeaders.addAll({"X-Authorization-Firebase": authToken});
    }
    return requestHeaders;
  }

  Future<List<ClientUserDto>> getAllUsers(
      {String token,
      bool active = true,
      int page,
      int pageSize,
      String search}) async {
    Map<String, String> requestHeaders = await getHeaders(authToken: token);
    Map<String, String> queryParameters = {
      'active': "$active",
      'currentPage': "$page",
      'pageSize': "$pageSize",
    };
    if (search != null) {
      queryParameters.addAll({"searchQuery": search});
    }
    Uri uri = authorityType == "http"
        ? Uri.https(endpoint, "/api/v1/user/$endpointType/getAllForAdmin",
            queryParameters)
        : Uri.https(endpoint, "/api/v1/user/$endpointType/getAllForAdmin",
            queryParameters);
    final response = await client.get(uri, headers: requestHeaders);
    print("response body ${response.body.length}");
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return (json.decode(response.body) as List)
          .map((data) => ClientUserDto.fromJson(data))
          .toList();
    } else if (response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<List<ClientUserDto>> getAllSubscribedUsers(
      {String token,
      bool active = true,
      int page,
      int pageSize,
      String search}) async {
    Map<String, String> requestHeaders = await getHeaders(authToken: token);
    Map<String, String> queryParameters = {
      'active': "$active",
      //'currentPage': "$page",
      //'pageSize': "$pageSize",
    };
    if (search != null) {
      queryParameters.addAll({"searchQuery": search});
    }
    Uri uri = authorityType == "http"
        ? Uri.https(
            endpoint,
            "/api/v1/user/$endpointType/getAllSubscribedUsersForAdmin",
            queryParameters)
        : Uri.https(
            endpoint,
            "/api/v1/user/$endpointType/getAllSubscribedUsersForAdmin",
            queryParameters);
    final response = await client.get(uri, headers: requestHeaders);
    print("response body ${response.body.length}");
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return (json.decode(response.body) as List)
          .map((data) => ClientUserDto.fromJson(data))
          .toList();
    } else if (response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<UserDto> getUserDetails({String token, String userId}) async {
    Map<String, String> requestHeaders = {
      "X-Authorization-Firebase": token,
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    Map<String, String> queryParameters = {
      'userId': userId,
    };
    Uri uri = authorityType == "http"
        ? Uri.http(
            endpoint,
            "/api/v1/activity/$endpointType/getUserCommunityDetails",
            queryParameters)
        : Uri.https(
            endpoint,
            "/api/v1/activity/$endpointType/getUserCommunityDetails",
            queryParameters);
    final response = await client.get(uri, headers: requestHeaders);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return UserDto.fromJson(json.decode(response.body));
    } else if (response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<bool> checkUserExists(String uid, Device device) async {
    Map<String, String> requestHeaders = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    Uri uri = authorityType == "http"
        ? Uri.http(endpoint, "/api/v1/user/open/$uid/exists")
        : Uri.https(endpoint, "/api/v1/user/open/$uid/exists");
    final response = await client.post(uri,
        headers: requestHeaders, body: json.encode(device.toJson()));
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return response.body == "true";
    } else if (response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<UserCommunityCountDto> getAllCountForAdmin({
    String token,
    bool active = true,
  }) async {
    Map<String, String> requestHeaders = await getHeaders(authToken: token);
    Map<String, String> queryParameters = {
      'active': "$active",
    };
    Uri uri = authorityType == "http"
        ? Uri.https(endpoint, "/api/v1/user/$endpointType/getAllCountsForAdmin",
            queryParameters)
        : Uri.https(endpoint, "/api/v1/user/$endpointType/getAllCountsForAdmin",
            queryParameters);
    final response = await client.get(uri, headers: requestHeaders);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      print("response body ${response.body.length}");
      return UserCommunityCountDto.fromJson(json.decode(response.body));
    } else if (response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<List<Advert>> getAdverts({String token, bool active = true}) async {
    Map<String, String> requestHeaders = {
      "X-Authorization-Firebase": token,
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    Map<String, String> queryParameters = {
      'active': "$active",
    };
    Uri uri = authorityType == "http"
        ? Uri.http(
            endpoint, "/api/v1/advert/$endpointType/findAll", queryParameters)
        : Uri.https(
            endpoint, "/api/v1/advert/$endpointType/findAll", queryParameters);
    final response = await client.get(uri, headers: requestHeaders);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return (json.decode(response.body) as List)
          .map((data) => Advert.fromJson(data))
          .toList();
    } else if (response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<List<Category>> getCategoryById(
      {String token, String getByUserId, bool active = true}) async {
    Map<String, String> requestHeaders = {
      "X-Authorization-Firebase": token,
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    Map<String, String> queryParameters = {
      //'getByUserId': "$getByUserId",
      'active': "$active",
    };
    Uri uri = authorityType == "http"
        ? Uri.http(endpoint, "/api/v1/category/$endpointType/$queryParameters",
            queryParameters)
        : Uri.https(endpoint, "/api/v1/category/$endpointType/$queryParameters",
            queryParameters);
    final response = await client.get(uri, headers: requestHeaders);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return (json.decode(response.body) as List)
          .map((data) => Category.fromJson(data))
          .toList();
    } else if (response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<bool> likeAdvert(
    String userId,
    String advertId,
  ) async {
    Map<String, String> requestHeaders = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    Map<String, String> queryParameters = {
      'userId': "$userId",
      'advertId': "advertId",
    };
    Uri uri = authorityType == "http"
        ? Uri.http(endpoint, "/api/v1/advert/$endpointType/$advertId/like")
        : Uri.https(endpoint, "/api/v1/advert/$endpointType/$advertId/like");
    final response = await client.post(uri, headers: requestHeaders);
    print('we are here now');
    print(response);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return response.body == "true";
    } else if (response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<bool> deleteActivity(
      {String token,
      String activityId,
      String userId,
      OccurrenceDto occurrenceDto}) async {
    Map<String, String> requestHeaders = {
      "X-Authorization-Firebase": token,
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    Map<String, String> queryParameters = {
      'userId': "$userId",
    };
    var response;
    if (occurrenceDto != null) {
      Uri uri = authorityType == "http"
          ? Uri.http(
              endpoint,
              "/api/v1/activity/$endpointType/$activityId/deleteRecurring",
              queryParameters)
          : Uri.https(
              endpoint,
              "/api/v1/activity/$endpointType/$activityId/deleteRecurring",
              queryParameters);
      response = await client.post(uri,
          headers: requestHeaders, body: json.encode(occurrenceDto.toJson()));
    } else {
      Uri uri = authorityType == "http"
          ? Uri.http(
              endpoint,
              "/api/v1/activity/$endpointType/$activityId/delete",
              queryParameters)
          : Uri.https(
              endpoint,
              "/api/v1/activity/$endpointType/$activityId/delete",
              queryParameters);
      response = await client.delete(uri, headers: requestHeaders);
    }
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return response.body == "true";
    } else if (response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<Advert> getAdvertById(
      {String token, String advertId, bool active = true}) async {
    Map<String, String> requestHeaders = {
      "X-Authorization-Firebase": token,
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    Map<String, String> queryParameters = {
      'active': "$active",
    };
    Uri uri = authorityType == "http"
        ? Uri.http(
            endpoint, "/api/v1/advert/$endpointType/$advertId", queryParameters)
        : Uri.https(endpoint, "/api/v1/advert/$endpointType/$advertId",
            queryParameters);
    final response = await client.get(uri, headers: requestHeaders);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return Advert.fromJson(json.decode(response.body));
    } else if (response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<Advert> putNewAdvert(
      {String token, String userId, Advert advert}) async {
    Map<String, String> requestHeaders = {
      "X-Authorization-Firebase": token,
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    Map<String, String> queryParameters;
    queryParameters = {
      'userId': "$userId",
    };
    Uri uri = Uri.https(
        endpoint, "/api/v1/advert/$endpointType/new", queryParameters);
    final response = await client.put(uri,
        headers: requestHeaders, body: json.encode(advert.toJson()));
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return Advert.fromJson(json.decode(response.body));
    } else if (response.body != null) {
      return Future.error(json.encode(response.toString()));
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<Advert> updateAdvert(
      {String token, String userId, Advert advert}) async {
    Map<String, String> requestHeaders = {
      "X-Authorization-Firebase": token,
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    Map<String, String> queryParameters;
    queryParameters = {
      'userId': "$userId",
    };
    Uri uri = Uri.https(
        endpoint, "/api/v1/advert/$endpointType/update", queryParameters);
    final response = await client.put(uri,
        headers: requestHeaders, body: json.encode(advert.toJson()));
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return Advert.fromJson(json.decode(response.body));
    } else if (response.body != null) {
      return Future.error(json.encode(response.toString()));
    } else {
      return Future.error('${response.toString()}');
    }
  }

  Future<bool> deleteAdvert(
      {String token, String advertId, String userId}) async {
    Map<String, String> requestHeaders = {
      "X-Authorization-Firebase": token,
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    Map<String, String> queryParameters = {
      'userId': "$userId",
    };
    Uri uri = authorityType == "http"
        ? Uri.http(endpoint, "/api/v1/family/$endpointType/", queryParameters)
        : Uri.https(endpoint, "/api/v1/family/$endpointType/", queryParameters);
    final response = await client.delete(uri, headers: requestHeaders);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203 ||
        response.statusCode == 204) {
      return true;
    } else if (response.body != null) {
      return Future.error(response.body);
    } else {
      return Future.error('${response.toString()}');
    }
  }
}

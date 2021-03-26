import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nomah/core/model/client_user_dto.dart';
import 'package:nomah/core/model/device.dart';
import 'package:nomah/core/model/new_user_dto.dart';
import 'package:nomah/core/repository/firebase_repo.dart';
import 'package:nomah/core/shared/core_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../locator.dart';
import 'connected_api.dart';

class AuthenticationService {
  static const TAG = 'AuthenticationService';
  ConnectedApi _connectedApi = locator<ConnectedApi>();
  FirebaseRepo _firebaseRepo = locator<FirebaseRepo>();
  SharedPreferences sharedPreferences = locator<SharedPreferences>();
  StreamController<ClientUserDto> userController =
  StreamController<ClientUserDto>();

  FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();

  ClientUserDto getClientUserDto() {
    final String savedUser = sharedPreferences.getString(CoreHelpers.savedUserKey);
    if (savedUser != null ) {
      ClientUserDto clientUserDto = ClientUserDto.fromJson(json.decode(savedUser));
      return clientUserDto;
    } else{
      return ClientUserDto.initial();
    }
  }

  Future<ClientUserDto> login(String email, String password) async {
    var hasUser = false;
    var user;
    var uid = await _firebaseRepo.signIn(email, password);
    if (uid != null) {
      NewUserDto newUserDto = NewUserDto(uid: uid, emailAddress: email);
      var uuid = Uuid();
      String deviceToken = "-";
      Device device = Device(
          CoreHelpers.getDeviceType(), deviceToken, uuid.v4().toString(), null);
      newUserDto.device = device;
      var fetchedUser = await _connectedApi.register(newUserDto);
      hasUser = fetchedUser != null;
      if (hasUser) {
        fetchedUser.device = device;
        userController.add(fetchedUser);
        await sharedPreferences.setString(
            CoreHelpers.savedUserKey, json.encode(fetchedUser.toJson()));
        user = fetchedUser;
      }
    }
    return user;
  }

  Future<String> getUserToken() async {
    var idToken = await _firebaseRepo.getUserToken();
    if (idToken != null) {
      return idToken;
    } else {
      throw Exception("Could not get User Token for Authentication");
    }
  }

  Future<ClientUserDto> register(
      String email,
      String cellNumber,
      String password,
      String firstName,
      String lastName,
      ) async {
    var hasUser = false;
    var uid = await _firebaseRepo.signUp(email, password);
    var uuid = Uuid();
    ClientUserDto fetchedUser;
    if (uid != null) {
      String deviceToken = "-";
      Device device = Device(
          CoreHelpers.getDeviceType(), deviceToken, uuid.v4().toString(), null);
      NewUserDto newUserDto = NewUserDto(
          uid: uid,
          emailAddress: email,
          cellNumber: cellNumber,
          firstName: firstName,
          lastName: lastName);
      newUserDto.device = device;
      fetchedUser = await _connectedApi.register(newUserDto);
      hasUser = fetchedUser != null;
      if (hasUser) {
        userController.add(fetchedUser);
        await sharedPreferences.setString(
            CoreHelpers.savedUserKey, json.encode(fetchedUser.toJson()));
      }
    }
    return fetchedUser;
  }

  Future<bool> checkUserSignedIn() async {
    var userExists = false;
    String savedUser = sharedPreferences.getString(CoreHelpers.savedUserKey);
    var uuid = Uuid();
    String deviceToken = "-";
    User firebaseUser = await _firebaseAuth.authStateChanges().first;
    String deviceType = CoreHelpers.getDeviceType();
    Device newDevice =
    Device(deviceType, deviceToken, uuid.v4().toString(), null);
    if (savedUser != null && firebaseUser != null) {
      ClientUserDto clientUserDto =
      ClientUserDto.fromJson(json.decode(savedUser));
      //print("AuthenticationService User Obj: ${json.encode(clientUserDto.toJson())}");
      var device = clientUserDto.device;
      if (device != null) {
        device.fcmToken = deviceToken;
      } else {
        device = newDevice;
      }
      clientUserDto.device = device;
      userController.add(clientUserDto);
      await sharedPreferences.setString(
          CoreHelpers.savedUserKey, json.encode(clientUserDto.toJson()));
      userExists =
      await _connectedApi.checkUserExists(clientUserDto.uid, device);
      print("Checking if user exists $userExists");
      return userExists;
    } else {
      print("Checking if user exists $userExists");
      userExists = false;
    }

    return userExists;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    return _firebaseRepo.sendPasswordResetEmail(email);
  }
}
import 'dart:convert';

import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/user_dto.dart';
import 'package:Live_Connected_Admin/core/repository/local_data.dart';
import 'package:Live_Connected_Admin/core/service/authentication_service.dart';
import 'package:Live_Connected_Admin/core/service/connected_api.dart';
import 'package:flutter/cupertino.dart';

import '../../locator.dart';
import 'base_model.dart';

class UserModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final ConnectedApi _connectedAPI = locator<ConnectedApi>();
  final LocalDataRepo _countryRepo = locator<LocalDataRepo>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController nationalityController =
      TextEditingController(text: "South Africa");
  final TextEditingController genderController = TextEditingController();
  final TextEditingController cellNumberController = TextEditingController();
  String searchTerm;
  String selectedCategory;
  String errorMessage;
  String successMessage;
  ClientUserDto user;
  List<ClientUserDto> userList = [];
  List<ClientUserDto> usersFilter = [];
  List<Advert> advertList = [];
  UserDto userDto;
  int page = 0;
  int pageSize = 20;
  bool isLoading = false;
  bool showCloseSearch = false;
  String token;
  Advert advert;

  void setShowCloseSearch(bool show) {
    showCloseSearch = show;
    page = 0;
    setState(ViewState.Idle);
  }

  Future search(String searchTerm) async {
    setState(ViewState.Busy);
    errorMessage = null;
    userList = [];
    usersFilter = [];
    _authenticationService.getUserToken().then((token) {
      return _connectedAPI.getAllUsers(
        token: token,
        page: 0,
        pageSize: 50,
        search: searchTerm,
      );
    }).then((user) {
      if (user != null) {
        this.userList = user;
        this.usersFilter = user;
        if (user.isEmpty) {
          errorMessage = "No User Found";
        }
      } else {
        errorMessage = "Failed to load User";
      }
      showCloseSearch = true;
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }

  void getUserDetails(String userId) {
    setState(ViewState.Busy);
    errorMessage = null;
    userDto = null;
    _authenticationService.getUserToken().then((token) {
      return _connectedAPI.getUserDetails(token: token, userId: userId);
    }).then((userDetails) {
      print("user details ${userDetails.familyMembers}");
      userDto = userDetails;
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }

  Future getUsers({Function initController}) async {
    if (!isLoading) {
      isLoading = true;
    }
    if (page == 0) {
      setState(ViewState.Busy);
      userList = [];
    }
    errorMessage = null;
    String token = await _authenticationService.getUserToken();
    _connectedAPI
        .getAllUsers(token: token, page: page, pageSize: pageSize)
        .then((userlist) {
      this.userList.addAll(userlist);
      this.usersFilter.addAll(userlist);
      isLoading = true;
      page++;
      if (initController != null) {
        initController();
      }
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }

  // ignore: missing_return
  // Future putNewAdvert(String userId) {
  //   setState(ViewState.Busy);
  //   errorMessage = null;
  //   userDto = null;
  //   _authenticationService.getUserToken().then((token) {
  //     return _connectedAPI.postAdvert(token: token, advert: advert);
  //   }).then((advert) {
  //     setState(ViewState.Idle);
  //   }).catchError((error) {
  //     errorMessage = '${error.toString()}';
  //     setState(ViewState.Idle);
  //   });
  // }
}

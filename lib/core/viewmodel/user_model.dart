import 'dart:convert';

import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/country.dart';
import 'package:Live_Connected_Admin/core/repository/local_data.dart';
import 'package:Live_Connected_Admin/core/service/authentication_service.dart';
import 'package:Live_Connected_Admin/core/service/connected_api.dart';
import 'package:Live_Connected_Admin/core/shared/core_helpers.dart';
import 'package:Live_Connected_Admin/core/shared/date_formats.dart';
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

  String errorMessage;
  String successMessage;
  ClientUserDto user;
  List<Country> countryList = [];
  List<ClientUserDto> userList = [];

  Future getCountries() async {
    setState(ViewState.Busy);
    errorMessage = null;
    countryList = [];
    _countryRepo.getCountryList().then((categories) {
      this.countryList.addAll(categories);
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }

  Future getUsers() async {
    setState(ViewState.Busy);
    errorMessage = null;
    userList = [];
    String token = await _authenticationService.getUserToken();
    _connectedAPI.getAllUsers(token: token).then((userlist) {
      this.userList = userlist;
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }
}

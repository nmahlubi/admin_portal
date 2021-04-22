import 'dart:convert';

import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
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
  UserDto userDto;
  int page = 0;
  int pageSize = 20;
  bool isLoading = false;

  Future search(String searchTerm) async{
    setState(ViewState.Busy);
    errorMessage = null;
    userList = [];
    usersFilter = [];
    _authenticationService.getUserToken()
        .then((token) {
      return _connectedAPI.getAllUsers(token: token, page: page, pageSize: pageSize,search: searchTerm,);
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
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }

//  Future search(String searchTerm) async {
//    setState(ViewState.Busy);
//    if (searchTerm.isEmpty) {
//      usersFilter = userList;
//    } else {
//      List tempUserList = new List<ClientUserDto>();
//      print("User List ${usersFilter.length}");
//      for (int i = 0; i < userList.length; i++) {
//        if (userList[i]
//                .firstName
//                .toLowerCase()
//                .contains(searchTerm.toLowerCase()) ||
//            userList[i]
//                .emailAddress
//                .toLowerCase()
//                .contains(searchTerm.toLowerCase()) ||
//            userList[i]
//                .lastName
//                .toLowerCase()
//                .contains(searchTerm.toLowerCase())) {
//          tempUserList.add(userList[i]);
//        }
//      }
//
//      usersFilter = tempUserList;
//    }
//    this.searchTerm = searchTerm;
//    setState(ViewState.Idle);
//  }

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
    if(!isLoading) {
      isLoading = true;
    }
    errorMessage = null;
    String token = await _authenticationService.getUserToken();
    _connectedAPI.getAllUsers(token: token, page: page, pageSize: pageSize).then((userlist) {
      this.userList.addAll(userlist);
      this.usersFilter.addAll(userlist);
      isLoading = true;
      page++;
      if(initController != null) {
        initController();
      }
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }
}

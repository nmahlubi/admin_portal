import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/user_community_count_dto.dart';
import 'package:Live_Connected_Admin/core/service/authentication_service.dart';
import 'package:Live_Connected_Admin/core/service/connected_api.dart';
import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/core/viewmodel/base_model.dart';

import '../../locator.dart';

class HomeModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final ConnectedApi _connectedApi = locator<ConnectedApi>();
  String errorMessage;
  List<UserCommunityCountDto> userCommunityCountDtoList = [];
  UserCommunityCountDto userCommunityCountDto;

//  Future getMyStores() async {
//    setState(ViewState.Busy);
//    errorMessage = null;
//    stores = [];
//    _authenticationService.getCurrentUserWithToken().then((clientUserDto) {
//    }).then((stores) {
//      this.stores = stores;
//      setState(ViewState.Idle);
//    }).catchError((error) {
//      errorMessage = '${error.toString()}';
//      setState(ViewState.Idle);
//    });
//  }
  Future getAllCountForAdmin() async {
    setState(ViewState.Busy);
    errorMessage = null;
    userCommunityCountDto = null;
    userCommunityCountDtoList = [];
    _connectedApi.getAllCountForAdmin().then((userCommunityDto) {
      print("This reaches here ");
      if (userCommunityDto != null ) {
        this.userCommunityCountDto = userCommunityDto;
        setState(ViewState.Idle);
      } else {
        errorMessage = "userCommunityCountDto details not found";
        Future.delayed(const Duration(seconds: 1)).then((any) {
          setState(ViewState.Idle);
        });
      }
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }
}

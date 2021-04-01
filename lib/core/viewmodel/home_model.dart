import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
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
  List<ClientUserDto> stores = [];

  Future getMyStores() async {
    setState(ViewState.Busy);
    errorMessage = null;
    stores = [];
    _authenticationService.getCurrentUserWithToken().then((clientUserDto) {
      // return ConnectedApi.getStoresByOwnerId(
      //  token: clientUserDto.idToken, userId: clientUserDto.id);
    }).then((stores) {
      this.stores = stores;
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }
}

import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/repository/advert_repo.dart';
import 'package:Live_Connected_Admin/core/service/authentication_service.dart';
import 'package:Live_Connected_Admin/core/service/connected_api.dart';
import 'package:flutter/cupertino.dart';

import '../../locator.dart';
import 'base_model.dart';

class FavouriteModel extends BaseModel {
  ConnectedApi _connectedApi = ConnectedApi();
  AuthenticationService _authenticationService = AuthenticationService();
  final AdvertRepo advertRepo = locator<AdvertRepo>();
  String errorMessage;
  List<Advert> advertList;
  String token;

  Future getAdvertList() async {
    setState(ViewState.Busy);
    errorMessage = null;
    advertList = [];
    token = await _authenticationService.getUserToken();
    _connectedApi.getAdverts(token: token).then((adverts) {
      if (adverts != null) {
        advertList = adverts;
        setState(ViewState.Idle);
      } else {
        errorMessage = "favourites not found";
        Future.delayed(const Duration(seconds: 1)).then((any) {
          setState(ViewState.Idle);
        });
      }
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      Future.delayed(const Duration(seconds: 1)).then((any) {
        setState(ViewState.Idle);
      });
    });
  }
}

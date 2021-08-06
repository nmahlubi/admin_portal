import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/model/category.dart';
import 'package:Live_Connected_Admin/core/service/authentication_service.dart';
import 'package:Live_Connected_Admin/core/service/connected_api.dart';

import '../../locator.dart';
import 'base_model.dart';

class AdvertModel extends BaseModel {
  ConnectedApi _connectedApi = ConnectedApi();
  AuthenticationService _authenticationService = AuthenticationService();
  // final AdvertRepo advertRepo = locator<AdvertRepo>();
  String errorMessage;
  List<Advert> localCarouselItems;
  List<Advert> advertList;
  List<Category> categoryList;
  String currentUserId;
  String token;
  int pageSize = 20;
  bool isLoading = false;

  Future getAdvertList({Function initController}) async {
    setState(ViewState.Busy);
    errorMessage = null;
    advertList = [];
    token = await _authenticationService.getUserToken();
    _connectedApi.getAdverts(token: token).then((adverts) {
      if (adverts != null) {
        advertList = adverts;
        setState(ViewState.Idle);
      } else {
        errorMessage = "Advert not found";
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

  Future getCategoryById() async {
    setState(ViewState.Busy);
    errorMessage = null;
    categoryList = [];
    token = await _authenticationService.getUserToken();
    _connectedApi.getCategoryById(token: token).then((category) {
      if (category != null) {
        categoryList = category;
        setState(ViewState.Idle);
      } else {
        errorMessage = "categoryList details not found";
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

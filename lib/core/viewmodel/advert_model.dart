import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/model/category.dart';
import 'package:Live_Connected_Admin/core/repository/advert_repo.dart';
import 'package:Live_Connected_Admin/core/service/authentication_service.dart';
import 'package:Live_Connected_Admin/core/service/connected_api.dart';

import '../../locator.dart';
import 'base_model.dart';

class AdvertModel extends BaseModel {
  ConnectedApi _connectedApi = ConnectedApi();
  AuthenticationService _authenticationService = AuthenticationService();
  final AdvertRepo advertRepo = locator<AdvertRepo>();
  String errorMessage;
  List<Advert> localCarouselItems;
  List<Advert> advertList = [];
  List<Category> categoryList;
  String currentUserId;
  String token;
  int pageSize = 20;
  bool isLoading = false;
  Advert advert;

  Future getLocalData() async {
    setState(ViewState.Busy);
    errorMessage = null;
    localCarouselItems = [];
    advertRepo.getLocalCorouselData().then((advert) {
      if (advert != null) {
        localCarouselItems = (advert);
        setState(ViewState.Idle);
      } else {
        errorMessage = "Advert details not found";
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
        errorMessage = "There are no advert yet...";
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

  void likeAdvert(
    String userId,
    String advertId,
  ) {
    setState(ViewState.Busy);
    errorMessage = null;
    _authenticationService.getUserToken().then((token) {
      return _connectedApi.deleteActivity(token: token, userId: userId ?? null);
    }).then((success) {
      setState(ViewState.Idle);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }

  Future getAdvertById(String advertId) async {
    setState(ViewState.Busy);
    errorMessage = null;
    advert = null;
    token = await _authenticationService.getUserToken();
    _connectedApi
        .getAdvertById(token: token, advertId: advertId)
        .then((advert) {
      if (advert != null) {
        this.advert = advert;
        setState(ViewState.Idle);
      } else {
        errorMessage = "advert details not found";
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

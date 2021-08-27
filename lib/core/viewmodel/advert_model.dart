import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/model/category.dart';
import 'package:Live_Connected_Admin/core/repository/advert_repo.dart';
import 'package:Live_Connected_Admin/core/service/authentication_service.dart';
import 'package:Live_Connected_Admin/core/service/connected_api.dart';
import 'package:Live_Connected_Admin/core/shared/core_helpers.dart';
import 'package:flutter/cupertino.dart';

import '../../locator.dart';
import 'base_model.dart';

class AdvertModel extends BaseModel {
  ConnectedApi _connectedApi = ConnectedApi();
  AuthenticationService _authenticationService = AuthenticationService();
  final AdvertRepo advertRepo = locator<AdvertRepo>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController cellNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController allergiesController = TextEditingController();
  final TextEditingController ownChildController =
      TextEditingController(text: "false");

  String errorMessage;
  List<Advert> localCarouselItems;
  List<Advert> advertList = [];
  List<Category> categoryList;
  String currentUserId;
  String token;
  int pageSize = 20;
  bool isLoading = false;
  Advert advert;

  void init({Advert advert}) {
    titleController.text = advert?.title ?? "";
    subtitleController.text = advert?.subtitle ?? "";
    emailAddressController.text = advert?.emailAddress ?? "";
    cellNumberController.text = advert?.cellNumber ?? "";
    descriptionController.text = advert?.description ?? "";
  }

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

  Future<Advert> putNewAdvert({Advert advert}) async {
    setState(ViewState.Busy);
    errorMessage = null;
    advert = null;
    token = await _authenticationService.getUserToken();
    _connectedApi.putNewAdvert(token: token, advert: advert).then((advert) {
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

  Future<Advert> updateAdvert(Advert advert) async {
    setState(ViewState.Busy);
    errorMessage = null;
    advert = null;
    token = await _authenticationService.getUserToken();
    _connectedApi.putNewAdvert(token: token, advert: advert).then((advert) {
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

  void addAdvert({bool runOnComplete = true}) {
    setState(ViewState.Busy);
    errorMessage = null;

    // String validationError = CoreHelpers.validateChildDetails(firstNameController.text,
    //     lastNameController.text, ownChildController.text);
    // if (validationError != null) {
    //   errorMessage = validationError;
    //   setState(ViewState.Idle);
    // } else {
    //   ChildDto childDto = ChildDto.newInstance(firstName: firstNameController.text,
    //     lastName: lastNameController.text, emailAddress: emailController.text,
    //     cellNumber: cellNumberController.text, ownChild: ownChildController.text == "true",
    //   );
    //   if(dobController.text.isNotEmpty) {
    //     childDto.dob = responseDateFormat.parse(dobController.text);
    //   }
    //   if(allergiesController.text.isNotEmpty) {
    //     childDto.allergies = allergiesController.text.split(",");
    //   }
    //   _authenticationService.getUserToken().then((token) {
    //     return _connectedApi.addChild(
    //         token: token, child: childDto, userId: currentUserId);
    //   }).then((savedVehicle) {
    //     onBoardingChildAdded = true;
    //     childrenAdded += 1;
    //     setState(ViewState.Idle);
    //     if(runOnComplete) {
    //       onComplete();
    //     } else {
    //       init();
    //     }
    //   }).catchError((error) {
    //     errorMessage = '${error.toString()}';
    //     setState(ViewState.Idle);
    //   });
    // }
  }
}

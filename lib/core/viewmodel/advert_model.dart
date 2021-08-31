import 'dart:html';

import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/model/alert.dart';
import 'package:Live_Connected_Admin/core/model/category.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/file_dto.dart';
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
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController subcategoryController = TextEditingController();
  final TextEditingController ownerController = TextEditingController();
  final TextEditingController carouselImageController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController mainImageUrlController = TextEditingController();
  final TextEditingController createdController = TextEditingController();
  final TextEditingController likesController = TextEditingController();
  final TextEditingController modifiedController = TextEditingController();
  final TextEditingController activeController = TextEditingController();
  final TextEditingController backgroundController = TextEditingController();
  final TextEditingController facebookLinkController = TextEditingController();
  final TextEditingController buttonTextController = TextEditingController();
  final TextEditingController addToCarouselController = TextEditingController();
  final TextEditingController alertListController = TextEditingController();
  final TextEditingController viewsController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController twitterLinkController = TextEditingController();
  final TextEditingController iconUrlController = TextEditingController();
  final TextEditingController subCategoryController = TextEditingController();

  String errorMessage;
  List<Advert> localCarouselItems;
  List<Advert> advertList = [];
  List<Category> categoryList;
  String currentUserId;
  Function onComplete;
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
    categoryController.text = advert?.category ?? "";
    ownerController.text = advert?.owner ?? "";
    emailAddressController.text = advert?.emailAddress ?? "";
    cellNumberController.text = advert?.cellNumber ?? "";
    descriptionController.text = advert?.description ?? "";
    carouselImageController.text = advert?.carouselImage ?? "";
    idController.text = advert?.id ?? "";
    mainImageUrlController.text = advert?.mainImageUrl ?? "";
    createdController.text = advert?.created ?? "";
    likesController.text = advert?.likes ?? "";
    modifiedController.text = advert?.modified ?? "";
    activeController.text = advert?.active ?? "";
    backgroundController.text = advert?.background ?? "";
    facebookLinkController.text = advert?.facebookLink ?? "";
    buttonTextController.text = advert?.buttonText ?? "";
    addToCarouselController.text = advert?.addToCarousel ?? "";
    alertListController.text = advert?.alertList ?? "";
    viewsController.text = advert?.views ?? "";
    websiteController.text = advert?.website ?? "";
    twitterLinkController.text = advert?.twitterLink ?? "";
    iconUrlController.text = advert?.iconUrl ?? "";
    subCategoryController.text = advert?.subCategory ?? "";
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

  // Future<Advert> putNewAdvert({String userId, Advert advert}) async {
  //   setState(ViewState.Busy);
  //   errorMessage = null;
  //   advert = null;
  //   token = await _authenticationService.getUserToken();
  //   _connectedApi
  //       .putNewAdvert(token: token, advert: advert, userId: currentUserId)
  //       .then((advert) {
  //     if (advert != null) {
  //       this.advert = advert;
  //       setState(ViewState.Idle);
  //     } else {
  //       errorMessage = "advert details not found";
  //       Future.delayed(const Duration(seconds: 1)).then((any) {
  //         setState(ViewState.Idle);
  //       });
  //     }
  //   }).catchError((error) {
  //     errorMessage = '${error.toString()}';
  //     Future.delayed(const Duration(seconds: 1)).then((any) {
  //       setState(ViewState.Idle);
  //     });
  //   });
  // }

  void updateAdvertDetails(Advert advert) {
    setState(ViewState.Busy);
    errorMessage = null;
    String validationError = CoreHelpers.validateAdvertDetails(
      titleController.text,
      subtitleController.text,
      emailAddressController.text,
      cellNumberController.text,
      backgroundController.text,
      facebookLinkController.text,
      buttonTextController.text,
      idController.text,
      websiteController.text,
      twitterLinkController.text,
      iconUrlController.text,
      carouselImageController.text,
      mainImageUrlController.text,
      createdController.text,
      likesController.text,
      modifiedController.text,
      activeController.text,
      ownerController.text,
      addToCarouselController.text,
      alertListController.text,
      viewsController.text,
    );
    if (validationError != null) {
      errorMessage = validationError;
      setState(ViewState.Idle);
    } else {
      advert.title = titleController.text;
      advert.subtitle = subtitleController.text;
      advert.emailAddress = emailAddressController.text;
      advert.cellNumber = cellNumberController.text;
      advert.background = backgroundController.text;
      advert.facebookLink = facebookLinkController.text;
      advert.buttonText = buttonTextController.text;
      advert.id = idController.text;
      advert.website = websiteController.text;
      advert.twitterLink = twitterLinkController.text;
      advert.iconUrl = iconUrlController.text as FileDto;
      advert.carouselImage = carouselImageController.text as FileDto;
      advert.mainImageUrl = mainImageUrlController.text as FileDto;
      advert.created = createdController.text as DateTime;
      advert.likes = likesController.text as List<String>;
      advert.modified = modifiedController.text as DateTime;
      advert.active = activeController.text as bool;
      advert.owner = ownerController.text as ClientUserDto;
      advert.addToCarousel = addToCarouselController.text as bool;
      advert.alertList = alertListController.text as List<Alert>;
      advert.views = viewsController.text as List<String>;
      // advert.subCategory = subCategoryController.text ;
      // advert.category = categoryController.text ;

      _authenticationService.getUserToken().then((token) {
        return _connectedApi.updateAdvert(
            token: token, advert: advert, userId: currentUserId);
      }).then((savedVehicle) {
        setState(ViewState.Idle);
        onComplete();
      }).catchError((error) {
        errorMessage = '${error.toString()}';
        setState(ViewState.Idle);
      });
    }
  }

  void deleteAdvert({String advertId}) {
    setState(ViewState.Busy);
    errorMessage = null;
    _authenticationService.getUserToken().then((token) {
      return _connectedApi.deleteAdvert(
          token: token, advertId: advertId, userId: currentUserId);
    }).then((success) {
      setState(ViewState.Idle);
      getAdvertById(advertId);
    }).catchError((error) {
      errorMessage = '${error.toString()}';
      setState(ViewState.Idle);
    });
  }

  void addAdvert({String userId, bool runOnComplete = true}) {
    setState(ViewState.Busy);
    errorMessage = null;


    String validationError = CoreHelpers.validateAdvertDetails(
      titleController.text,
      subtitleController.text,
      emailAddressController.text,
      cellNumberController.text,
      descriptionController.text,
      categoryController.text,
      backgroundController.text,
      facebookLinkController.text,
      buttonTextController.text,
      idController.text,
      websiteController.text,
      subCategoryController.text,
      twitterLinkController.text,
      iconUrlController.text,
      mainImageUrlController.text,
     createdController.text,
     likesController.text,
     modifiedController.text,
     activeController.text,
     ownerController.text ,
     addToCarouselController.text,
    );

    if (validationError != null) {
      errorMessage = validationError;
      setState(ViewState.Idle);
    } else {
      Advert advert = Advert.newInstance(
        title: titleController.text,
        subtitle: subtitleController.text,
        emailAddress: emailAddressController.text,
        cellNumber: cellNumberController.text,
      );
      _authenticationService.getUserToken().then((token) {
        return _connectedApi.addAdvert(
            token: token, advert: advert, userId: currentUserId);
      }).then((savedVehicle) {
        setState(ViewState.Idle);
        if (runOnComplete) {
          onComplete();
        } else {
          init();
        }
      }).catchError((error) {
        errorMessage = '${error.toString()}';
        setState(ViewState.Idle);
      });
    }
  }
}

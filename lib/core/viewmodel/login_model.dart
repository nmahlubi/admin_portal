import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/service/authentication_service.dart';

import '../../locator.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage;
  String registerErrorMessage;
  int registerPage = 1;
  ClientUserDto clientUserDto;
  bool loginSuccess = false;
  bool registerSuccess = false;
  bool updateUserSuccess = false;
  bool captureEnabled;
  bool supportsAppleSignIn = false;

  void init() {
    errorMessage = null;
  }
  void login(
      String emailText, String passwordText, final Function(ClientUserDto) navigateToHome) {
    setState(ViewState.Busy);

    errorMessage = null;
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailText);

    if (emailText.isEmpty || !emailValid) {
      errorMessage = 'Please Enter a valid Email';
      setState(ViewState.Idle);
    } else if (passwordText.isEmpty) {
      errorMessage = 'Please Enter Password';
      setState(ViewState.Idle);
    } else {
      _authenticationService
          .login(emailText, passwordText)
          .then((userObj) {
        setState(ViewState.Idle);
        navigateToHome(userObj);
      }).catchError((error) {
        errorMessage = '${error.toString()}';
        setState(ViewState.Idle);
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/service/authentication_service.dart';
import 'package:Live_Connected_Admin/core/shared/core_helpers.dart';

import '../../locator.dart';
import 'base_model.dart';

class RegisterModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();

  String errorMessage;
  bool skipEnabled = false;
  bool loginEnabled = true;
  Function(ClientUserDto) navigateToHome;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cellNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyPasswordController =
  TextEditingController();
  final TextEditingController termsController =
  TextEditingController(text: "false");

  void init() {
    errorMessage = "";
    firstNameController.text = "";
    lastNameController.text = "";
    emailController.text = "";
    passwordController.text = "";
    verifyPasswordController.text = "";
    cellNumberController.text = "";
  }

  void register() {
    setState(ViewState.Busy);
    errorMessage = null;

    String registerErrorMessage = CoreHelpers.validateRegistrationDetails(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        cellNumberController.text,
        passwordController.text,
        verifyPasswordController.text,
        termsController.text);
    if (registerErrorMessage != null) {
      errorMessage = registerErrorMessage;
      setState(ViewState.Idle);
    } else {
      _authenticationService
          .register(
          emailController.text,
          cellNumberController.text,
          passwordController.text,
          firstNameController.text,
          lastNameController.text)
          .then((createdUser) {
        if (createdUser == null) {
          errorMessage = "Something went wrong. Please try again.";
        }
        setState(ViewState.Idle);
        navigateToHome(createdUser);
      }).catchError((error) {
        errorMessage = '${error.toString()}';
        setState(ViewState.Idle);
      });
    }
  }
}
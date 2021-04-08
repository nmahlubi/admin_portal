import 'package:Live_Connected_Admin/core/model/country.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/plain_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cell_text_field.dart';
import 'date_selection_field.dart';
import 'dropdown_selection_field.dart';

class UserProfileContent extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController dobController;
  final TextEditingController nationalityController;
  final TextEditingController genderController;
  final TextEditingController cellNumberController;

  final String errorMessage;
  final String successMessage;
  final Function onClickSave;
  final Function onClickCancel;
  final List<Country> countryList;

  const UserProfileContent(
      {Key key,
      this.firstNameController,
      this.lastNameController,
      this.dobController,
      this.nationalityController,
      this.genderController,
      this.cellNumberController,
      this.errorMessage,
      this.onClickSave,
      this.countryList,
      this.onClickCancel,
      this.successMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('here...'),
    );
  }
}

import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/country.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserContent extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController dobController;
  final TextEditingController nationalityController;
  final TextEditingController genderController;
  final TextEditingController cellNumberController;
  final ClientUserDto user;

  final String errorMessage;
  final String successMessage;
  final Function onClickSave;
  final Function onClickCancel;
  final List<Country> countryList;

  const UserContent(
      {Key key,
      this.user,
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: primaryColorDark, width: 1)),
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpaceMedium(),
                    Text(
                      "${user.firstName}",
                      style: textStyle,
                    ),
                    Text(
                      "${user.lastName}",
                      style: textStyle,
                    ),
                    Text(
                      "${user.emailAddress}",
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
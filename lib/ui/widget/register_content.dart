import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/service/connected_api.dart';
import 'package:Live_Connected_Admin/core/shared/core_helpers.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/cell_text_field.dart';
import 'package:Live_Connected_Admin/ui/widget/padded_divider.dart';
import 'package:Live_Connected_Admin/ui/widget/plain_text_field.dart';
import 'email_text_field.dart';
import 'labelled_check_box_widget.dart';
import 'password_text_field.dart';

class RegisterContent extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController cellNumberController;
  final TextEditingController passwordController;
  final TextEditingController verifyPasswordController;
  final TextEditingController termsController;
  final String errorMessage;
  final ViewState state;
  final Function onClickSignUp;

  const RegisterContent(
      {Key key,
      this.firstNameController,
      this.lastNameController,
      this.emailController,
      this.cellNumberController,
      this.passwordController,
      this.verifyPasswordController,
      this.termsController,
      this.errorMessage,
      this.state,
      this.onClickSignUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        PlainTextField(
          controller: firstNameController,
          hint: "First Name*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PlainTextField(
          controller: lastNameController,
          hint: "Last Name*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        EmailTextField(
          controller: emailController,
          hint: "Email Address*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        CellTextField(
          controller: cellNumberController,
          hint: "Cell phone Number*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PasswordTextField(
          controller: passwordController,
          hint: "Password*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceXSmall(),
        PasswordTextField(
          controller: verifyPasswordController,
          hint: "Confirm Password*",
          horizontalPadding: 0,
        ),
        UIHelper.verticalSpaceMediumLarge(),
        Text(
          "Please accept the Live Connected Terms of Service to complete your registration",
          textAlign: TextAlign.center,
          style: textStyle,
        ),
        UIHelper.verticalSpaceXSmall(),
        PaddedDivider(
          color: Colors.black26,
        ),
        FlatButton(
            child: Text('View T\'s & C\'s',
                style: textStyleSecondary),
            onPressed: () async {
              await CoreHelpers.openLink(
                  "${ConnectedApi.authorityType}://${ConnectedApi.endpoint}/ConnectedLifeStayApplication_TermsofUseService.html");
            }),
        PaddedDivider(
          color: Colors.black26,
        ),
        UIHelper.verticalSpaceXSmall(),
        Center(
          child: LabelledCheckboxWidget(
            title: "Accept terms and conditions",
            controller: termsController,
            titleStyle: textStyleSecondary,
          ),
        ),
        errorMessage != null
            ? Center(
                child: Text(
                errorMessage,
                style: errorStyleRed,
                textAlign: TextAlign.center,
              ))
            : Container(),
        UIHelper.verticalSpaceXSmall(),
        state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : SizedBox(
                width: 300,
                height: 50,
                child: Container(
                  child: RaisedButton(
                      color: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'Continue',
                        style: titleStyleWhite,
                      ),
                      onPressed: onClickSignUp),
                )),
        UIHelper.verticalSpaceLarge(),
      ],
    );
  }
}

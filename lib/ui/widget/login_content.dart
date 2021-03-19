import 'package:flutter/material.dart';
import 'package:nomah/core/enums/viewstate.dart';
import 'package:nomah/ui/shared/app_colors.dart';
import 'package:nomah/ui/shared/text_styles.dart';
import 'package:nomah/ui/shared/ui_helpers.dart';
import 'package:nomah/ui/widget/email_text_field.dart';
import 'package:nomah/ui/widget/image_widget.dart';
import 'package:nomah/ui/widget/password_text_field.dart';

class LoginContent extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String errorMessage;
  final ViewState state;
  final Function onClickForgotPassword;
  final Function onClickLogin;
  final Function onClickSignUp;
  final Function onClickFacebookSignUp;
  final Function onClickGoogleSignUp;
  final Function onClickAppleSignUp;
  final bool supportsAppleSignIn;

  const LoginContent(
      {Key key,
      this.emailController,
      this.passwordController,
      this.errorMessage,
      this.state,
      this.onClickForgotPassword,
      this.onClickLogin,
      this.onClickSignUp,
      this.onClickFacebookSignUp,
      this.onClickGoogleSignUp,
      this.onClickAppleSignUp,
      this.supportsAppleSignIn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageWidget(
          marginTop: 0,
          imageRadius: 75,
          height: 150,
        ),
        UIHelper.verticalSpaceLarge(),
        EmailTextField(
          controller: emailController,
          boarder: true,
          horizontalPadding: 0,
          horizontalContentPadding: 16
        ),
        UIHelper.verticalSpaceMedium(),
        PasswordTextField(
          controller: passwordController,
          boarder: true,
          horizontalPadding: 0,
          horizontalContentPadding: 16,
        ),
        UIHelper.verticalSpaceXSmall(),
        Container(
          child: FlatButton(
              child: Text('Forgot Password', style: textStyleWhiteLight),
              onPressed: onClickForgotPassword),
        ),
        UIHelper.verticalSpaceXSmall(),
        errorMessage != null
            ? Center(
                child: Text(
                errorMessage,
                style: errorStyleRed,
                textAlign: TextAlign.center,
              ))
            : Container(),
        UIHelper.verticalSpaceSmall(),
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
                        'Login',
                        style: titleStyleWhite,
                      ),
                      onPressed: onClickLogin),
                )),
        UIHelper.verticalSpaceXSmall(),
        FlatButton(
            child: Text('Sign Up',
                style: textStylePrimary),
            onPressed: onClickSignUp),
        UIHelper.verticalSpaceSmall(),
        Container(
          decoration: BoxDecoration(
              color: widgetBgColor, borderRadius: BorderRadius.circular(30.0)),
          width: 300,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: IconButton(
                        onPressed: onClickFacebookSignUp,
                        icon: ImageWidget(
                          marginTop: 0,
                          imageRadius: 30,
                          height: 60,
                          path: 'assets/icons/facebook.png',
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                        onPressed: onClickGoogleSignUp,
                        icon: ImageWidget(
                          marginTop: 0,
                          imageRadius: 30,
                          height: 60,
                          path: 'assets/icons/google.png',
                        ),
                      ),
                    )),
              ),
              supportsAppleSignIn ? Expanded(
                child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: widgetBgColor,
                          borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: .7, color: widgetLightGreyColor)),
                      child: IconButton(
                        onPressed: onClickAppleSignUp,
                        icon: ImageWidget(
                          marginTop: 0,
                          imageRadius: 30,
                          height: 60,
                          path: 'assets/icons/apple.png',
                        ),
                      ),
                    )),
              ) : Container(),
            ],
          ),
        ),
        UIHelper.verticalSpaceXSmall(),

        Container(
          width: 300,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  supportsAppleSignIn ? "Facebook" :"Login using Facebook",
                  textAlign: TextAlign.center,
                  style: textStyleWhiteSmall,
                ),
              ),
              Expanded(
                child: Text(
                  supportsAppleSignIn ? "Google" : "Login using Google",
                  textAlign: TextAlign.center,
                  style: textStyleWhiteSmall,
                ),
              ),
              supportsAppleSignIn ? Expanded(
                child: Text(
                  "Apple",
                  textAlign: TextAlign.center,
                  style: textStyleWhiteSmall,
                ),
              ): Container()
            ],
          ),
        ),
        UIHelper.verticalSpaceLarge(),
      ],
    );
  }
}

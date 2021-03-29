import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/shared/core_helpers.dart';
import 'package:Live_Connected_Admin/core/viewmodel/login_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/view/base_view.dart';
import 'package:Live_Connected_Admin/ui/widget/login_content.dart';


class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      onModelReady: (model) {
      },
      builder: (BuildContext context, LoginModel model, Widget child) {
        return Scaffold(
          backgroundColor: secondaryColor,
          body: ListView(
            children: <Widget>[
              UIHelper.verticalSpaceLarge(),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  alignment: Alignment.centerLeft,
                  child: LoginContent(
                    emailController: emailController,
                    passwordController: passwordController,
                    onClickForgotPassword: () {
                      Navigator.pushNamed(context, 'resetPassword');
                    },
                    onClickLogin: () {
                      model.login(emailController.text, passwordController.text,
                              (userObj) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/', (Route<dynamic> route) => false,
                                arguments: userObj);
                          });
                    },
                    onClickSignUp: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    errorMessage: model.errorMessage,
                    state: model.state,
                    supportsAppleSignIn: model.supportsAppleSignIn,
                  ))
            ],
          ),
        );
      },
    );
  }

}

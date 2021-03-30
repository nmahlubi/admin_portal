import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/shared/core_helpers.dart';
import '../../locator.dart';
import '../shared/app_colors.dart';
import '../shared/text_styles.dart';
import '../shared/ui_helpers.dart';
import 'menu_item.dart';

class CustomDrawer extends StatelessWidget {
  final String selected;

  const CustomDrawer({Key key, this.selected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightShadowColor,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                MenuItem(
                  title: "Home",
                  imagePath: "assets/images/home.png",
                  press: () {
                    _onClickHome(context);
                  },
                  selected: selected == "Home",
                ),
                UIHelper.verticalSpaceMedium(),
                MenuItem(
                  title: "Users",
                  imagePath: "assets/images/profile.png",
                  press: () {
                    _onClickUsers(context);
                  },
                  selected: selected == "users",
                ),
                UIHelper.verticalSpaceMedium(),
                MenuItem(
                  title: "Subscriptions",
                  imagePath: "assets/images/orders.png",
                  press: () {
                    _onClickSubscription(context);
                  },
                  selected: selected == "Subscriptions",
                ),
                UIHelper.verticalSpaceMedium(),
              ],
            ),
          ),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: Container(
                child: FlatButton(
                    color: primaryColor,
                    child: Text(
                      'Logout',
                      style: titleStyleWhiteLight,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _onClickLogout(context);
                    }),
              )),
        ],
      ),
    );
  }

  _onClickHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, '/', (Route<dynamic> route) => false);
  }

  _onClickUsers(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, 'users', (Route<dynamic> route) => false);
  }

  _onClickSubscription(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, 'Subscription', (Route<dynamic> route) => false);
  }

  _onClickLogout(BuildContext context) async {
    SharedPreferences sharedPreferences = locator<SharedPreferences>();
    await sharedPreferences.remove(CoreHelpers.savedUserKey);
    Navigator.pushNamedAndRemoveUntil(
        context, 'login', (Route<dynamic> route) => false);
  }
}

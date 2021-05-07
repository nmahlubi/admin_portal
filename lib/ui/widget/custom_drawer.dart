import 'package:Live_Connected_Admin/ui/view/subscribers_view.dart';
import 'package:Live_Connected_Admin/ui/view/user_details_view.dart';
import 'package:Live_Connected_Admin/ui/view/users_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      color: textColorWhite,
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 60,
              child: Container(
                child: FlatButton(
                    color: textColorLightGrey,
                    child: Text(
                      'DASHBOARD',
                      style: titleStyleWhiteLight,
                    ),
                    onPressed: () {}),
              )),
          SizedBox(height: 30.0),
          Expanded(
            child: ListView(
              children: <Widget>[
                MenuItem(
                  title: "Home",
                  imagePath: "assets/icons/home(1).png",
                  press: () {
                    _onClickHome(context);
                  },
                  selected: selected == "Home",
                ),
                UIHelper.verticalSpaceMedium(),
                MenuItem(
                  title: "Users",
                  imagePath: "assets/icons/group(1).png",
                  press: () {
                    _onClickUsers(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UsersView()));
                  },
                  selected: selected == "Users",
                ),
                UIHelper.verticalSpaceMedium(),
                MenuItem(
                  title: "Subscriptions",
                  imagePath: "subscription",
                  press: () {
                    _onClickUsers(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubscribersView()));
                  },
                  selected: selected == "subscribersView",
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
                    color: textColorLightGrey,
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

  _onClickDetailsUsers(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, 'userDetailsView', (Route<dynamic> route) => false);
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

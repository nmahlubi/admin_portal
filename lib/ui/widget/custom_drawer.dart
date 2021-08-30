import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/viewmodel/advert_model.dart';
import 'package:Live_Connected_Admin/ui/view/advert_view.dart';
import 'package:Live_Connected_Admin/ui/view/children_view.dart';
import 'package:Live_Connected_Admin/ui/view/event_view.dart';
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
import 'advert_item.dart';
import 'menu_item.dart';

class CustomDrawer extends StatelessWidget {
  final String selected;

  CustomDrawer({Key key, this.selected}) : super(key: key);
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightShadowColor,
      child: Column(
        children: [
          //  SizedBox(height: 10.0),
          Expanded(
            child: ListView(
              children: <Widget>[
                MenuItem(
                  title: "Home",
                  imagePath: "assets/images/home.png",
                  color: textColorGrey,
                  press: () {
                    _onClickHome(context);
                  },
                  selected: selected == "Home",
                ),
                MenuItem(
                  title: "Users",
                  imagePath: "assets/images/group.png",
                  color: textColorGrey,
                  press: () {
                    _onClickUsers(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UsersView()));
                  },
                  selected: selected == "Users",
                ),
                MenuItem(
                  title: "Subscriptions",
                  imagePath: "assets/images/renew.png",
                  color: textColorGrey,
                  press: () {
                    _onClickUsers(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubscribersView()));
                  },
                  selected: selected == "Subscribers",
                ),
                MenuItem(
                  title: "Children",
                  imagePath: "assets/icons/boy.png",
                  color: textColorGrey,
                  press: () {
                    _onClickUsers(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChildrenView()));
                  },
                  selected: selected == "Children",
                ),
                MenuItem(
                  title: "Events",
                  imagePath: "assets/images/calendar.png",
                  color: textColorGrey,
                  press: () {
                    _onClickUsers(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventView()));
                  },
                  selected: selected == "Events",
                ),
                MenuItem(
                  title: "Advert",
                  imagePath: "assets/icons/shopping-cart.png",
                  color: textColorGrey,
                  press: () {
                    _onClickUsers(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdvertView()));
                  },
                  selected: selected == "Advert",
                ),
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

  _onClickDetailsUsers(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, 'userDetailsView', (Route<dynamic> route) => false);
  }

  _onClickSubscription(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, 'Subscription', (Route<dynamic> route) => false);
  }

  _onClickEvents(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, 'Events', (Route<dynamic> route) => false);
  }

  _onClickChildren(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, 'Children', (Route<dynamic> route) => false);
  }

  _onClickAdvert(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, 'Advert', (Route<dynamic> route) => false);
  }

  _onClickLogout(BuildContext context) async {
    SharedPreferences sharedPreferences = locator<SharedPreferences>();
    await sharedPreferences.remove(CoreHelpers.savedUserKey);
    Navigator.pushNamedAndRemoveUntil(
        context, 'login', (Route<dynamic> route) => false);
  }

  Widget getChildrenUi(
      List<Advert> adverts, BuildContext context, AdvertModel model, Key key) {
    return RefreshIndicator(
      key: key,
      onRefresh: () {
        // return model.getAdvertById();
      },
      child: ListView.separated(
        itemCount: adverts.length,
        itemBuilder: (context, index) => AdvertItem(
            advert: adverts[index],
            deleteAdvert: (id) {
              UIHelper.showDialogTwoActions(
                  context,
                  "Delete Child",
                  Text("Are you sure you wish to delete?"),
                  () {
                    model.deleteAdvert(advertId: id);
                  },
                  "Yes",
                  () {
                    print("Not deleting the child I guess");
                  },
                  "No");
            },
            updateAdvertDetails: (advert) async {
              await Navigator.of(context)
                  .pushNamed("addChild", arguments: advert);
              print("Return From forward");
              _refreshIndicatorKey.currentState.show();
            },
            viewAdvert: (child) async {
              await Navigator.of(context)
                  .pushNamed("addChild", arguments: child);
              print("Return From forward");
              _refreshIndicatorKey.currentState.show();
            }),
        separatorBuilder: (context, index) => Divider(
          color: Colors.black54,
          height: 0.5,
        ),
      ),
    );
  }
}

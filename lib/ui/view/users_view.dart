import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/viewmodel/user_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:Live_Connected_Admin/ui/widget/image_widget.dart';
import 'package:Live_Connected_Admin/ui/widget/user_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class UsersView extends StatefulWidget {
  @override
  _UsersViewState createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ClientUserDto user = Provider.of<ClientUserDto>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseView<UserModel>(onModelReady: (model) {
        model.getUsers();
        model.user = user;
      }, builder: (BuildContext context, UserModel model, Widget child) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: !UIHelper.isLargeScreen(screenWidth)
              ? Drawer(
                  child: CustomDrawer(
                  selected: "User",
                ))
              : null,
          backgroundColor: widgetBgColor,
          body: Column(
            children: [
              Container(
                color: primaryColor,
                width: double.infinity,
                height: 75,
                child: Stack(
                  children: <Widget>[
                    // Max Size
                    UIHelper.isLargeScreen(screenWidth)
                        ? Container()
                        : Container(
                            alignment: Alignment.centerLeft,
                            //padding: EdgeInsets.all(16),
                            child: IconButton(
                              color: widgetBgColor,
                              icon: Icon(Icons.menu),
                              tooltip: 'Menu',
                              onPressed: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                            ),
                          ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageWidget(
                            marginTop: 0,
                            height: 50,
                            imageColor: widgetBgColor,
                            path: 'assets/images/profile.png',
                          ),
                          UIHelper.horizontalSpaceMedium(),
                          Text(
                            "User List",
                            style: titleStyleWhiteLight,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    UIHelper.isLargeScreen(screenWidth)
                        ? Expanded(
                            flex: 2,
                            child: CustomDrawer(
                              selected: "User",
                            ),
                          )
                        : Container(),
                    Expanded(
                      flex: 8,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.userList.length,
                        itemBuilder: (context, index) {
                          return UserContent(
                            user: model.userList[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

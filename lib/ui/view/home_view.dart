import 'package:Live_Connected_Admin/core/viewmodel/home_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:Live_Connected_Admin/ui/widget/home_content.dart';
import 'package:Live_Connected_Admin/ui/widget/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ClientUserDto globalUser;

  HomeView({Key key, this.globalUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClientUserDto user = Provider.of<ClientUserDto>(context);
    if (user.id == " " && globalUser != null) {
      user = globalUser;
    }
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseView<HomeModel>(onModelReady: (model) {
        //model.getMyStores();
      }, builder: (BuildContext context, HomeModel model, Widget child) {
        return Scaffold(
            key: _scaffoldKey,
            drawer: !UIHelper.isLargeScreen(screenWidth)
                ? Drawer(
                    child: CustomDrawer(
                    selected: "Home",
                  ))
                : null,
            backgroundColor: textColorBlack,
            body: Column(children: [
              Container(
                color: textColorGrey,
                width: double.infinity,
                height: 75,
                child: Stack(
                  children: <Widget>[
                    // Max Size
                    UIHelper.isLargeScreen(screenWidth)
                        ? Container()
                        : Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(16),
                            child: IconButton(
                              color: Colors.black,
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
                            path: 'assets/images/live_connected_logo.png',
                          ),
                          UIHelper.horizontalSpaceMedium(),
                          Text(
                            "Live Connect Admin",
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
                      child: Container(
                        alignment: Alignment.center,
                        child: HomeContent(),
                      ),
                    )
                  ],
                ),
              )
            ]));
      }),
    );
  }
}

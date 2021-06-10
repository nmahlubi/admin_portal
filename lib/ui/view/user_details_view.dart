import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/viewmodel/user_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:Live_Connected_Admin/ui/widget/image_widget.dart';
import 'package:Live_Connected_Admin/ui/widget/user_details_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';
import 'home_view.dart';

class UsersDetailsView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final String userId;
  final ClientUserDto clientUserDto;

  UsersDetailsView({Key key, this.clientUserDto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClientUserDto user = Provider.of<ClientUserDto>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseView<UserModel>(
          onModelReady: (model) {
        model.getUserDetails(clientUserDto.id);
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
                              onPressed: () {},
                            ),
                          ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          UIHelper.horizontalSpaceSmall(),
                          BackButton(
                              color: widgetBgColor,
                              ),
                          UIHelper.horizontalSpaceSmall(),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageWidget(
                                  marginTop: 0,
                                  height: 50,
                                  imageColor: widgetBgColor,
                                  path: 'assets/images/live_connected_logo.png',
                                ),
                                UIHelper.horizontalSpaceSmall(),
                                Text(
                                  "User Details",
                                  style: titleStyleWhiteLight,
                                ),
                                SizedBox(height: 30.0),
                              ],
                            ),
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
                      child: Column(
                        children: [
                          UIHelper.verticalSpaceMedium(),
                          model.errorMessage != null
                              ? Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    model.errorMessage,
                                    style: errorStyleRed,
                                  ),
                                )
                              : Container(),
                          UIHelper.verticalSpaceSmall(),
                          UIHelper.verticalSpaceSmall(),
                          model.state == ViewState.Busy
                              ? Center(child: CircularProgressIndicator())
                              : Container(
                                  child: Center(
                                      child: UserDetailsContent(
                                    userDto: model.userDto,
                                    currentUser: clientUserDto,
                                  )),
                                ),
                        ],
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

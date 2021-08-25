import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/viewmodel/advert_model.dart';
import 'package:Live_Connected_Admin/core/viewmodel/user_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:Live_Connected_Admin/ui/widget/image_widget.dart';
import 'package:Live_Connected_Admin/ui/widget/search_filter.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class AddAdvertView extends StatelessWidget {
  final String userId;
  final Advert advert;
  AddAdvertView({Key key, this.advert, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClientUserDto user = Provider.of<ClientUserDto>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    var numberRows = 3;
    double rowHeight = 50;
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseView<AdvertModel>(onModelReady: (model) {
        model.postAdvert();
      }, builder: (BuildContext context, AdvertModel model, Widget child) {
        return Scaffold(
          // key: _scaffoldKey,
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
                                // _scaffoldKey.currentState.openDrawer();
                              },
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
                                  "Children",
                                  style: titleStyleWhiteLight,
                                ),
                                SizedBox(height: 30.0),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              alignment: Alignment.center,
                              color: primaryColor,
                              child: Text(
                                "Reload",
                                style: titleStyleWhiteLight,
                              ),
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
                              selected: "Children",
                            ),
                          )
                        : Container(),
                    Expanded(
                      flex: 8,
                      child: model.state == ViewState.Busy
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UIHelper.verticalSpaceXSmall(),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text('Add the advert screen'),
                                )
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

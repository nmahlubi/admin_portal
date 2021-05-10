import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/user_community_count_dto.dart';
import 'package:Live_Connected_Admin/core/viewmodel/home_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:Live_Connected_Admin/ui/widget/home_content.dart';
import 'package:Live_Connected_Admin/ui/widget/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
//      GlobalKey<RefreshIndicatorState>();


  HomeView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClientUserDto user = Provider.of<ClientUserDto>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseView<HomeModel>(onModelReady: (model) {
        model.getAllCountForAdmin();
      }, builder: (BuildContext context, HomeModel model, Widget child) {
        return Scaffold(
            key: _scaffoldKey,
            drawer: !UIHelper.isLargeScreen(screenWidth)
                ? Drawer(
                    child: CustomDrawer(
                    selected: "Home",
                  ))
                : null,
            backgroundColor: lightShadowColor,
            body: Column(children: [
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
                              selected: "Home",
                            ),
                          )
                        : Container(),
                    Expanded(
                        flex: 8,
                        child: Stack(
                          children: [
                            model.userCommunityCountDto != null
                                ? Container(
                              alignment: Alignment.center,
                              child: HomeContent(
                                userCommunityCountDto: model?.userCommunityCountDto,
                              ),
                            ) : Container(),
                            model.errorMessage != null
                                ? Container(
                              alignment: Alignment.center,
                              child: Text(model.errorMessage, style: errorStyleRed,),
                            ): Container(),

                            model.state == ViewState.Busy
                                ? Center(child: CircularProgressIndicator())
                                : Container()
                          ],
                        ))
                  ],
                ),
              )
            ]));
      }),
    );
  }
//  Widget getUserCommunityUi(
//      List<UserCommunityCountDto> userCommunity, BuildContext context,HomeModel model) {
//
//    return RefreshIndicator(
//      key: _refreshIndicatorKey,
//      onRefresh: () {
//        return model.getAllCountForAdmin();
//      },
//      child: ListView.builder(
//          itemCount: userCommunity.length,
//          itemBuilder: (context, index) => ),
//    );
//  }
}

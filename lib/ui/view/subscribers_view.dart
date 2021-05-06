import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/viewmodel/user_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:Live_Connected_Admin/ui/widget/image_widget.dart';
import 'package:Live_Connected_Admin/ui/widget/search_filter.dart';
import 'package:Live_Connected_Admin/ui/widget/user_content.dart';
import 'package:Live_Connected_Admin/ui/widget/user_content_last_name.dart';
import 'package:Live_Connected_Admin/ui/widget/user_email_content.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Live_Connected_Admin/core/enums/viewstate.dart';

import 'base_view.dart';

class SubscribersView extends StatefulWidget {
  @override
  _SubscribersViewState createState() => _SubscribersViewState();
}

class _SubscribersViewState extends State<SubscribersView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ClientUserDto user = Provider.of<ClientUserDto>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    var numberRows = 3;
    double rowHeight = 50;
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseView<UserModel>(onModelReady: (model) {
        model.getUsers(initController: () {
          _controller.addListener(() {
            if (_controller.position.pixels ==
                _controller.position.maxScrollExtent) {
              model.getUsers();
            }
          });
        });

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
                          UIHelper.horizontalSpaceSmall(),
                          Text(
                            "Subscribers",
                            style: titleStyleWhiteLight,
                          ),
                          FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                /*...*/
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Flat",
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.center),
                              ))
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
                      child: model.state == ViewState.Busy
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UIHelper.verticalSpaceXSmall(),
                                SearchFilter(
                                  onTextChange: (searchTerm) {
                                    model.search(searchTerm);
                                  },
                                  closeSearch: model.showCloseSearch,
                                  pressClose: () {
                                    model.setShowCloseSearch(false);
                                    model.getUsers();
                                  },
                                ),
                                UIHelper.verticalSpaceXSmall(),
                                model.errorMessage != null
                                    ? Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          model.errorMessage,
                                          style: errorStyleRed,
                                        ),
                                      )
                                    : Container(),
                                UIHelper.verticalSpaceXSmall(),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.all(10.0),
                                  padding: EdgeInsets.all(10.0),
                                  color: textColorLightBlue,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'First Name',
                                        style: textStyleWhite,
                                      ),
                                      Text(
                                        'Last Name',
                                        style: textStyleWhite,
                                      ),
                                      Text(
                                        'Expire Date',
                                        style: textStyleWhite,
                                      ),
                                      Text(
                                        'Monthly',
                                        style: textStyleWhite,
                                      ),
                                      Text(
                                        'Yearly',
                                        style: textStyleWhite,
                                      ),
                                    ],
                                  ),
                                ),
                                UIHelper.verticalSpaceXSmall(),
                                Expanded(
                                  child: DraggableScrollbar.arrows(
                                    controller: _controller,
                                    alwaysVisibleScrollThumb: true,
                                    backgroundColor: primaryColor,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                        color: Colors.black26,
                                      ),
                                      shrinkWrap: true,
                                      controller: _controller,
                                      // physics:
                                      //     const AlwaysScrollableScrollPhysics(),
                                      itemCount: model.usersFilter.length +
                                          (model.usersFilter.length >
                                                  model.pageSize
                                              ? 1
                                              : 0),
                                      itemBuilder: (context, index) {
                                        if (index == model.usersFilter.length &&
                                            model.usersFilter.length >
                                                model.pageSize) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new Center(
                                              child: new Opacity(
                                                opacity:
                                                    model.isLoading ? 1.0 : 00,
                                                child:
                                                    new CircularProgressIndicator(),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, "subscribersView",
                                                  arguments:
                                                      model.usersFilter[index]);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10.0),
                                              padding: EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      height: rowHeight,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${model.usersFilter[index].firstName}",
                                                        style: textStyle,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      height: rowHeight,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${model.usersFilter[index].lastName}",
                                                        style: textStyle,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      height: rowHeight,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${model.usersFilter[index].modified.toIso8601String() ?? "-"}",
                                                        style: textStyle,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      height: rowHeight,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      color: textColorGreen,
                                                      child: Center(
                                                        child: Text(
                                                          "${model.usersFilter[index].activeSubscription ?? "-"}",
                                                          style: textStyleWhite,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      height: rowHeight,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      color: textColorGreen,
                                                      child: Center(
                                                        child: Text(
                                                          "${model.usersFilter[index].activeSubscription ?? "-"}",
                                                          style: textStyleWhite,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
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
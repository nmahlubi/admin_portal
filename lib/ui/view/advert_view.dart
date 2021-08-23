import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/viewmodel/advert_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_error_message.dart';
import 'package:Live_Connected_Admin/ui/widget/image_widget.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'advert_details_view.dart';
import 'base_view.dart';

class AdvertView extends StatefulWidget {
  const AdvertView({Key key}) : super(key: key);

  @override
  _AdvertViewState createState() => _AdvertViewState();
}

class _AdvertViewState extends State<AdvertView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    ClientUserDto user = Provider.of<ClientUserDto>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    var numberRows = 3;
    double rowHeight = 50;
    return WillPopScope(
        onWillPop: () async => true,
        child: BaseView<AdvertModel>(onModelReady: (model) {
          model.currentUserId = user.id;
          model.getAdvertList();
        }, builder: (BuildContext context, AdvertModel model, Widget child) {
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
                          children: [
                            UIHelper.horizontalSpaceSmall(),
                            BackButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
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
                                    path:
                                        'assets/images/live_connected_logo.png',
                                  ),
                                  UIHelper.horizontalSpaceSmall(),
                                  Text(
                                    "Advert List",
                                    style: titleStyleWhiteLight,
                                  ),
                                  SizedBox(height: 30.0),
                                ],
                              ),
                            ),
                            GestureDetector(
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
                                selected: "Advert",
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
                                          'Title',
                                          style: textStyleWhite,
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(left: 20.0),
                                            child: Text(
                                              'Email Address',
                                              style: textStyleWhite,
                                            )),
                                        Text(
                                          'Contact Number',
                                          style: textStyleWhite,
                                        ),
                                        Text(
                                          'Registered Date',
                                          style: textStyleWhite,
                                        ),
                                      ],
                                    ),
                                  ),
                                  UIHelper.verticalSpaceXSmall(),
                                  UIHelper.verticalSpaceSmall(),
                                  Expanded(
                                    child: DraggableScrollbar.arrows(
                                      controller: _controller,
                                      alwaysVisibleScrollThumb: true,
                                      backgroundColor: primaryColor,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        controller: _controller,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        itemCount: model.advertList.length +
                                            (model.advertList.length >
                                                    model.pageSize
                                                ? 1
                                                : 0),
                                        itemBuilder: (context, index) {
                                          if (index ==
                                                  model.advertList.length &&
                                              model.advertList.length >
                                                  model.pageSize) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Center(
                                                child: new Opacity(
                                                  opacity: model.isLoading
                                                      ? 1.0
                                                      : 00,
                                                  child:
                                                      new CircularProgressIndicator(),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return GestureDetector(
                                              onTap: () async {
                                                await Navigator.pushNamed(
                                                    context,
                                                    "AdvertDetailsView",
                                                    arguments: model
                                                        .advertList[index].id);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(20.0),
                                                color: index % 2 == 0
                                                    ? widgetBgColor
                                                    : widgetLighterGreyColor,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        height: rowHeight,
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "${model.advertList[index].title}",
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
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        margin: EdgeInsets.only(
                                                            left: 10.0),
                                                        child: Text(
                                                          "${model.advertList[index].emailAddress}",
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
                                                            Alignment.center,
                                                        margin: EdgeInsets.only(
                                                            right: 25.0),
                                                        child: Text(
                                                          "${model.advertList[index].cellNumber}",
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
                                                        alignment: Alignment
                                                            .centerRight,
                                                        margin: EdgeInsets.only(
                                                            right: 25.0),
                                                        child: Text(
                                                          "${DateFormat.yMMMd().format(model.advertList[index].created ?? DateTime.now())}",
                                                          style: textStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                    UIHelper
                                                        .horizontalSpaceXSmall(),
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
        }));
  }
}

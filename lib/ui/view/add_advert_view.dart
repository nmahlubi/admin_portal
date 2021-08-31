import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/viewmodel/advert_model.dart';
import 'package:Live_Connected_Admin/core/viewmodel/user_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_error_message.dart';
import 'package:Live_Connected_Admin/ui/widget/edit_advert_details.dart';
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

  get isEditMode => advert != null;

  @override
  Widget build(BuildContext context) {
    ClientUserDto user = Provider.of<ClientUserDto>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    var numberRows = 3;
    double rowHeight = 50;
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseView<AdvertModel>(onModelReady: (model) {
        ClientUserDto user = Provider.of<ClientUserDto>(context, listen: false);
        model.currentUserId = user.id;
        model.addAdvert();
        model.init(advert: advert);
      }, builder: (BuildContext context, AdvertModel model, Widget child) {
        var constraint;
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
                                  'Add new advert',
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
                              selected: "Advert",
                            ),
                          )
                        : Container(),
                    Expanded(
                      flex: 8,
                      child: model.state == ViewState.Busy
                          ? Center(child: CircularProgressIndicator())
                          : SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  UIHelper.verticalSpaceSmall(),
                                  EditAdvertDetails(
                                    titleController: model.titleController,
                                    subtitleController:
                                        model.subtitleController,
                                    cellNumberController:
                                        model.cellNumberController,
                                    descriptionController:
                                        model.descriptionController,
                                    emailAddressController:
                                        model.emailAddressController,
                                    categoryController:
                                        model.categoryController,
                                    backgroundController:
                                        model.backgroundController,
                                    facebookLinkController:
                                        model.facebookLinkController,
                                    buttonTextController:
                                        model.buttonTextController,
                                    idController: model.idController,
                                    websiteController: model.websiteController,
                                    subCategoryController:
                                        model.subCategoryController,
                                    twitterLinkController:
                                        model.twitterLinkController,
                                    iconUrlController: model.iconUrlController,
                                    mainImageUrlController:
                                        model.mainImageUrlController,
                                    createdController: model.createdController,
                                    likesController: model.likesController,
                                    modifiedController:
                                        model.modifiedController,
                                    activeController: model.activeController,
                                    ownerController: model.ownerController,
                                    addToCarouselController:
                                        model.addToCarouselController,
                                  ),
                                  UIHelper.verticalSpaceSmall(),
                                  // Container(
                                  //   alignment: Alignment.bottomRight,
                                  //   width: 400,
                                  //   height: 100,
                                  //   margin: EdgeInsets.all(40),
                                  //   child: FlatButton(
                                  //     child: Text('Add Advert'),
                                  //     color: textColorLightBlue,
                                  //     textColor: Colors.white,
                                  //     onPressed: () {},
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //         width: 400,
                                  //         height: 50,
                                  //         child: Padding(
                                  //           padding: EdgeInsets.symmetric(
                                  //               horizontal: 30.0),
                                  //           child: FloatingActionButton(
                                  //               backgroundColor: primaryColor,
                                  //               shape: RoundedRectangleBorder(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           24)),
                                  //               child: Text(
                                  //                 isEditMode
                                  //                     ? "Update"
                                  //                     : "Save",
                                  //                 style: TextStyle(
                                  //                     color: textColorWhite,
                                  //                     fontSize: 20),
                                  //               ),
                                  //               onPressed: () {
                                  //                 isEditMode
                                  //                     ? model
                                  //                         .updateAdvertDetails(
                                  //                             advert)
                                  //                     : model.addAdvert();
                                  //               }),
                                  //         ),
                                  //       ),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

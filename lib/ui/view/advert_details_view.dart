import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/viewmodel/advert_model.dart';
import 'package:Live_Connected_Admin/core/viewmodel/user_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/advert_card.dart';
import 'package:Live_Connected_Admin/ui/widget/advert_card_details.dart';
import 'package:Live_Connected_Admin/ui/widget/advert_item.dart';
import 'package:Live_Connected_Admin/ui/widget/card_widget.dart';
import 'package:Live_Connected_Admin/ui/widget/cards.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_error_message.dart';
import 'package:Live_Connected_Admin/ui/widget/detailed_advert_item.dart';
import 'package:Live_Connected_Admin/ui/widget/image_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class AdvertDetailsView extends StatefulWidget {
  final String advertId;
  final Advert advert;
  final Image image;

  AdvertDetailsView({Key key, this.advertId, this.advert, this.image})
      : super(key: key);

  @override
  _AdvertDetailsViewState createState() => _AdvertDetailsViewState();
}

class _AdvertDetailsViewState extends State<AdvertDetailsView> {
  @override
  Widget build(BuildContext context) {
    ClientUserDto user = Provider.of<ClientUserDto>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => true,
      child: BaseView<AdvertModel>(onModelReady: (model) {
        model.getAdvertById(widget.advertId);
        model.getAdvertList();
      }, builder: (BuildContext context, AdvertModel model, Widget child) {
        return Scaffold(
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
                                  "Advert Details",
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
                              selected: "advert",
                            ),
                          )
                        : Container(),
                    Expanded(
                      flex: 8,
                      child: ListView(
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
                          model.state == ViewState.Busy
                              ? Center(child: CircularProgressIndicator())
                              : model.advertList != null &&
                                      model.advertList.isNotEmpty
                                  ? Container(
                                      height: 500,
                                      width: double.infinity,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        height: 300.0,
                                        width: 600.0,
                                        imageUrl: model.advert.mainImageUrl
                                                        .path !=
                                                    null &&
                                                model.advert.mainImageUrl.path
                                                    .isNotEmpty
                                            ? model.advert.mainImageUrl.path
                                            : 'asset/images/image_placeholder.png',
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    )
                                  : Container(),
                          UIHelper.verticalSpaceSmall(),
                          model.errorMessage != null
                              ? Center(
                                  child: CustomErrorMessage(
                                    model.errorMessage,
                                  ),
                                )
                              : Container(),
                          model.state == ViewState.Busy
                              ? Center(child: CircularProgressIndicator())
                              : Container(),
                          AdvertCard(
                            ImageWidget: CachedNetworkImage(
                              imageUrl: model.advert.iconUrl.path != null &&
                                      model.advert.iconUrl.path.isNotEmpty
                                  ? model.advert.iconUrl.path
                                  : 'asset/images/image_placeholder.png',
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            title: Text(
                              "${model.advert.title}",
                              style: headerStylesBlack,
                            ),
                            subTitle: Text("${model.advert.subtitle}"),
                            description: Text("${model.advert.description}",
                                style: textStyle),
                          ),
                          UIHelper.verticalSpaceSmall(),
                          UIHelper.verticalSpaceSmall(),
                          model.state == ViewState.Busy
                              ? Center(child: CircularProgressIndicator())
                              : Container(),
                          Expanded(
                            child: AdvertCardDetails(
                              advert: model.advert,
                            ),
                          ),
                          UIHelper.verticalSpaceSmall(),
                        ],
                      ),
                    )
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

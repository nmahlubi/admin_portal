import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/viewmodel/advert_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/view/advert_view.dart';
import 'package:Live_Connected_Admin/ui/view/base_view.dart';
import 'package:Live_Connected_Admin/ui/widget/search_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavMarketPlaceHome extends StatelessWidget {
  const NavMarketPlaceHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AdvertModel>(onModelReady: (model) {
      ClientUserDto user = Provider.of<ClientUserDto>(context, listen: false);
      model.getAdvertList();
    }, builder: (BuildContext context, AdvertModel model, Widget child) {
      return Scaffold(
        backgroundColor: textColorWhite,
        body: NestedScrollView(
          controller: ScrollController(),
          physics: ScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate([
                UIHelper.verticalSpaceMedium(),
                Container(
                    alignment: Alignment.center,
                    child: SearchFilter(
                      // buttonColor: primary,
                      onTextChange: (query) {},
                    )),
              ])),
            ];
          },
          body: Column(children: [
            UIHelper.verticalSpaceSmall(),
            model.errorMessage != null
                ? Center(
                    // child: CustomErrorMessage(
                    //   model.errorMessage,
                    // ),
                    )
                : Container(),
            UIHelper.verticalSpaceSmall(),
            model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : model.advertList != null && model.advertList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: model.advertList.length,
                            itemBuilder: (context, index) {
                              return AdvertView(
                                onClickExplore: () {
                                  Navigator.pushNamed(context, "advertDetails",
                                      arguments: model.advertList[index]);
                                },
                                advert: model.advertList[index],
                              );
                            }),
                      )
                    : Container()
          ]),
        ),
      );
    });
  }
}

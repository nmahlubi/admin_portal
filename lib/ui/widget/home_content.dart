import 'package:Live_Connected_Admin/core/viewmodel/home_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/view/base_view.dart';
import 'package:Live_Connected_Admin/ui/view/home_view.dart';
import 'package:Live_Connected_Admin/ui/view/subscribers_view.dart';
import 'package:Live_Connected_Admin/ui/view/users_view.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:Live_Connected_Admin/ui/widget/image_widget.dart';
import 'package:Live_Connected_Admin/ui/widget/user_content.dart';
import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ClientUserDto globalUser;

  HomeContent({Key key, this.globalUser}) : super(key: key);

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
            body: Container(
          margin: EdgeInsets.only(bottom: 300.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/");
                    },
                    child: Container(
                      height: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.red,
                        elevation: 10,
                        child: Column(
                          children: [
                            UIHelper.verticalSpaceSmall(),
                            Text('Updates', style: textStyleWhiteLargeBold),
                          ],
                        ),
                      ),
                    )),
              ),
              UIHelper.horizontalSpaceSmall(),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "usersView");
                  },
                  child: Container(
                    height: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.blue,
                      elevation: 10,
                      child: Column(
                        children: [
                          UIHelper.verticalSpaceSmall(),
                          Text('Users', style: textStyleWhiteLargeBold),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Expanded(
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "subscribersView");
                    },
                    child: Container(
                      height: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.teal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            UIHelper.verticalSpaceSmall(),
                            Center(
                              child: Text(
                                'Subscriptions',
                                style: textStyleWhiteLargeBold,
                              ),
                            ),
                            UIHelper.verticalSpaceSmall(),
                          ],
                        ),
                      ),
                    )),
              )
            ],
          ),
        ));
      }),
    );
  }
}

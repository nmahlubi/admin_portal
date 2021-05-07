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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            margin: EdgeInsets.only(bottom: 250.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/");
                      },
                      child: Container(
                        height: 250,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  '36',
                                  style: textStylePrimaryColorDarkLargeBold,
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  'assets/icons/boy.png',
                                  height: 100,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ListTile(
                                title: Text('Children',
                                    style: textStyleBlueGreySmaller),
                              ),
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
                      height: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                '55',
                                style: textStylePrimaryColorDarkLargeBold,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                'assets/icons/group.png',
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ListTile(
                              title: Text('Users',
                                  style: textStyleBlueGreySmaller),
                            ),
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
                    height: 250,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              '43',
                              style: textStylePrimaryColorDarkLargeBold,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              'assets/images/renew.png',
                              height: 80,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ListTile(
                            title: Text('Subscription',
                                style: textStyleBlueGreySmaller),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
                UIHelper.horizontalSpaceSmall(),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "EventView");
                  },
                  child: Container(
                    height: 250,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              '7',
                              style: textStylePrimaryColorDarkLargeBold,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              'assets/icons/calendar.png',
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ListTile(
                            title:
                                Text('Events', style: textStyleBlueGreySmaller),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        );
      }),
    );
  }
}

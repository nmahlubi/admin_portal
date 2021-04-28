import 'package:Live_Connected_Admin/core/viewmodel/home_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/view/base_view.dart';
import 'package:Live_Connected_Admin/ui/view/users_view.dart';
import 'package:Live_Connected_Admin/ui/widget/custom_drawer.dart';
import 'package:Live_Connected_Admin/ui/widget/image_widget.dart';
import 'package:Live_Connected_Admin/ui/widget/user_content.dart';
import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:provider/provider.dart';

class SubscribersContent extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ClientUserDto globalUser;

  SubscribersContent({Key key, this.globalUser}) : super(key: key);

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
            key: _scaffoldKey, body: Text('Subscribers page here...'));
      }),
    );
  }
}

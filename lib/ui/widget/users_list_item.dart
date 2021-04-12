import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class UsersListItem extends StatelessWidget {
  final ClientUserDto item;

  const UsersListItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          height: 60,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: widgetLightGreyColor, width: 0.5)),
            elevation: 2,
            child: Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              child: Text(
                "${item.firstName}",
                style: appSubHeaderStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/user_dto.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserDetails extends StatelessWidget {
  final ClientUserDto clientUserDto;

  UserDetails({Key key, this.clientUserDto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.drive_file_rename_outline, color: textColorGrey),
              UIHelper.horizontalSpaceMedium(),
              Text(clientUserDto?.firstName.toString() ?? 'firstName',
                  style: textStyle)
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.insert_drive_file, color: textColorGrey),
              UIHelper.horizontalSpaceMedium(),
              Text(clientUserDto?.lastName.toString() ?? 'firstName',
                  style: textStyle)
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.email, color: textColorGrey),
              UIHelper.horizontalSpaceMedium(),
              Text(clientUserDto?.emailAddress.toString() ?? 'emailAddress',
                  style: textStyle)
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.phone, color: textColorGrey),
              UIHelper.horizontalSpaceMedium(),
              Text(clientUserDto?.cellNumber.toString() ?? 'cellNumber',
                  style: textStyle)
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.date_range, color: textColorGrey),
              UIHelper.horizontalSpaceMedium(),
              //  Text("${DateFormat.yMd().format(userDto.)}", style: textStyle)
            ],
          ),
        ],
      ),
    );
  }
}

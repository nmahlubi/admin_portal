import 'package:Live_Connected_Admin/core/model/user_dto.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserDetails extends StatelessWidget {
  final UserDto userDto;

  UserDetails({Key key, this.userDto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      child: Column(
        children: [],
      ),
    );
  }
}

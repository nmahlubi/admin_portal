import 'package:Live_Connected_Admin/core/model/user_dto.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class UserDetailsContent extends StatelessWidget {
  final UserDto userDto;

  const UserDetailsContent({Key key, this.userDto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(userDto?.familyMembers ?? "No Details to display",
              style: textStyle),
        ],
      ),
    );
  }
}

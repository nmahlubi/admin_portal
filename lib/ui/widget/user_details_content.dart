import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/user_dto.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class UserDetailsContent extends StatelessWidget {
  final UserDto userDto;
  final ClientUserDto currentUser;

  const UserDetailsContent({Key key, this.userDto, this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(currentUser?.firstName ?? "No Details to display",
              style: textStyle),

          //Add a text label for family memebrs / community members
          userDto?.familyMembers != null && userDto.familyMembers.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: userDto.familyMembers.length,
                    itemBuilder: (context, index) {
                      return Text("${userDto.familyMembers[index].firstName}");
                    },
                  ),
                )
              : Container(),
          Text(userDto?.familyMembers ?? "No Details to display",
              style: textStyle),
        ],
      ),
    );
  }
}

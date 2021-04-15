import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/user_dto.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/round_image_widget.dart';
import 'package:flutter/material.dart';

class UserDetailsContent extends StatelessWidget {
  final UserDto userDto;
  final ClientUserDto currentUser;

  const UserDetailsContent({Key key, this.userDto, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: new Container(
              width: 100.0,
              height: 100.0,
              child: RoundImageWidget(
                placeHolder: 'assets/images/user_avatar.png',
               // path: url,
                height: 100,
                imageRadius: 50,
                marginTop: 0,
                network: true,
                plusButton: false,
                placeHolderColor: primaryColor,
                backgroundColor: primaryColorDark,
              ),
            ),
          ),
          Text( "${currentUser.firstName}  ${currentUser.lastName}",
              style: headerStylesBlack),
          UIHelper.verticalSpaceSmall(),
          Text( "Email : ${currentUser.emailAddress}",
              style: textStyle),
          UIHelper.verticalSpaceSmall(),
          Text( "Contact Number : ${currentUser.cellNumber}",
              style: textStyle),
          UIHelper.verticalSpaceSmall(),
          Text("List of Family Member",style: headerStylesBlack,),
          UIHelper.verticalSpaceSmall(),
          userDto?.familyMembers != null && userDto.familyMembers.isNotEmpty ?
              Expanded(
                child: ListView.builder(shrinkWrap: true,
                  physics:
                  const AlwaysScrollableScrollPhysics(),
                  itemCount:userDto.familyMembers.length,
                  itemBuilder: (context, index) {
                    return Text("${userDto.familyMembers[index].firstName}");
                  },
                ),
              ) : Container(),
          UIHelper.verticalSpaceSmall(),
          Text("List of Activities",style: headerStylesBlack,),
          UIHelper.verticalSpaceSmall(),
          userDto?.activities != null && userDto.activities.isNotEmpty ?
          Expanded(
            child: ListView.builder(shrinkWrap: true,
              physics:
              const AlwaysScrollableScrollPhysics(),
              itemCount:userDto.activities.length,
              itemBuilder: (context, index) {
                return Text("${userDto.activities[index].children}");
              },
            ),
          ) : Container(),
          UIHelper.verticalSpaceSmall(),
          Text("List of Children",style: headerStylesBlack,),
          UIHelper.verticalSpaceSmall(),
          userDto?.children != null && userDto.children.isNotEmpty ?
          Expanded(
            child: ListView.builder(shrinkWrap: true,
              physics:
              const AlwaysScrollableScrollPhysics(),
              itemCount:userDto.children.length,
              itemBuilder: (context, index) {
                return Text("${userDto.children[index].firstName}");
              },
            ),
          ) : Container(),
        ],
      ),
    );
  }
}

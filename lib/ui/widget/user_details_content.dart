import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/model/user_dto.dart';
import 'package:Live_Connected_Admin/core/shared/date_formats.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/widget/round_image_widget.dart';
import 'package:flutter/material.dart';

import 'image_widget.dart';

class UserDetailsContent extends StatelessWidget {
  final String errorMessage;
  final UserDto userDto;
  final ClientUserDto currentUser;

  const UserDetailsContent(
      {Key key, this.userDto, this.currentUser, this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("${currentUser.firstName}  ${currentUser.lastName}",
                style: headerStylesBlack),
            UIHelper.verticalSpaceSmall(),
            Text("Email : ${currentUser.emailAddress}", style: textStyle),
            UIHelper.verticalSpaceSmall(),
            Text("Contact Number : ${currentUser.cellNumber}", style: textStyle),
            UIHelper.verticalSpaceSmall(),
            Text("Active User : ${currentUser.activeOnApp}", style: textStyle),
            UIHelper.verticalSpaceSmall(),
            Text("Subscription Status : ${currentUser.activeSubscription}",
                style: textStyle),
            UIHelper.verticalSpaceSmall(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      userDto?.activities != null && userDto.activities.isNotEmpty
                          ? Container(
                        height: 350,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          color: primaryColorLight,
                          elevation: 10,
                          child: Column(
                            children: [
                              UIHelper.verticalSpaceSmall(),
                              Text(
                                "List of Children Added",
                                style: headerStylesBlack,
                              ),
                              UIHelper.verticalSpaceSmall(),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: userDto.children.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 10.0,top: 20),
                                    child: Text(
                                      "${userDto.children[index].firstName} ${userDto.children[index].lastName}",style: textStyle,),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                          : Container(),
                    ],
                  ),
                ),
                UIHelper.horizontalSpaceSmall(),
                Expanded(
                  child: Column(
                    children: [
                      userDto?.activities != null && userDto.activities.isNotEmpty
                          ? Container(
                              height: 350,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                color: primaryColorLight,
                                elevation: 10,
                                child: Column(
                                  children: [
                                    UIHelper.verticalSpaceSmall(),
                                    Text(
                                      "List of Schedules",
                                      style: headerStylesBlack,
                                    ),
                                    UIHelper.verticalSpaceSmall(),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const AlwaysScrollableScrollPhysics(),
                                      itemCount: userDto.activities.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                                          child: Text(
                                              "${userDto.activities[index].title}"
                                                  "\n${activityDateFormat.format(userDto.activities[index].startDateTime)} - ${activityDateFormat.format(userDto.activities[index].endDateTime)}",style: textStyle,),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                UIHelper.horizontalSpaceSmall(),
                Expanded(
                  child: Column(
                    children: [
                      userDto?.familyMembers != null &&
                              userDto.familyMembers.isNotEmpty
                          ? Container(
                              height: 350,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                color: primaryColorLight,
                                elevation: 10,
                                child: Column(
                                  children: [
                                    UIHelper.verticalSpaceSmall(),
                                    Text(
                                      "List of Family Members",
                                      style: headerStylesBlack,
                                    ),
                                    UIHelper.verticalSpaceSmall(),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const AlwaysScrollableScrollPhysics(),
                                      itemCount: userDto.familyMembers.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(left: 10.0,top: 20),
                                          child: Text(
                                            "${userDto.familyMembers[index].firstName} ${userDto.familyMembers[index].lastName}",style: textStyle,),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

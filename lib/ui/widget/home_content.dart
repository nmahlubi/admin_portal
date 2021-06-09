import 'package:Live_Connected_Admin/core/model/user_community_count_dto.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomeContent extends StatelessWidget {
  final UserCommunityCountDto userCommunityCountDto;

  const HomeContent({Key key, this.userCommunityCountDto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // margin: EdgeInsets.only(bottom: 250.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "EventView");
                  },
                  child: Container(
                      margin: EdgeInsets.all(12),
                      child: Card(
                        elevation: 5,
                        child: ClipPath(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${userCommunityCountDto.totalEvents}',
                                    style: textStylePrimaryColorDarkLargeBold,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 90,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: primaryColorLight,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                    ),
                                    child: Image.asset(
                                      'assets/icons/calendar.png',
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                      color: textColorLightBlue,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('Events',
                                      style: textStyleBlueGreySmaller),
                                ),
                              ],
                            ),
                            height: 250,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: primaryColorDark, width: 5))),
                          ),
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      decoration: new BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: primaryColorLight,
                          blurRadius: 20.0,
                        )
                      ])),
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "usersView");
                  },
                  child: Container(
                      margin: EdgeInsets.all(12),
                      child: Card(
                        elevation: 5,
                        child: ClipPath(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${userCommunityCountDto.totalUsers}',
                                    style: textStylePrimaryColorDarkLargeBold,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 90,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: primaryColorLight,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                    ),
                                    child: Image.asset(
                                      'assets/icons/group.png',
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                      color: textColorLightBlue,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('Users',
                                      style: textStyleBlueGreySmaller),
                                ),
                              ],
                            ),
                            height: 250,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: primaryColorDark, width: 5))),
                          ),
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      decoration: new BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: primaryColorLight,
                          blurRadius: 20.0,
                        )
                      ])),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "subscribersView");
                  },
                  child: Container(
                      margin: EdgeInsets.all(12),
                      child: Card(
                        elevation: 5,
                        child: ClipPath(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${userCommunityCountDto.totalSubscribers}',
                                    style: textStylePrimaryColorDarkLargeBold,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 90,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: primaryColorLight,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                    ),
                                    child: Image.asset(
                                      'assets/images/renew.png',
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                      color: textColorLightBlue,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('Subscriptions',
                                      style: textStyleBlueGreySmaller),
                                ),
                              ],
                            ),
                            height: 250,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: primaryColorDark, width: 5))),
                          ),
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      decoration: new BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: primaryColorLight,
                          blurRadius: 20.0,
                        )
                      ])),
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "EventView");
                  },
                  child: Container(
                      margin: EdgeInsets.all(12),
                      child: Card(
                        elevation: 5,
                        child: ClipPath(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${userCommunityCountDto.totalChildren}',
                                    style: textStylePrimaryColorDarkLargeBold,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 90,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: primaryColorLight,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                    ),
                                    child: Image.asset(
                                      'assets/icons/boy.png',
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                      color: textColorLightBlue,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('Children',
                                      style: textStyleBlueGreySmaller),
                                ),
                              ],
                            ),
                            height: 250,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: primaryColorDark, width: 5))),
                          ),
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      decoration: new BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: primaryColorLight,
                          blurRadius: 20.0,
                        )
                      ])),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

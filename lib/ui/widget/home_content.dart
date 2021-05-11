import 'package:Live_Connected_Admin/core/model/user_community_count_dto.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  final UserCommunityCountDto userCommunityCountDto;

  const HomeContent({Key key, this.userCommunityCountDto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 250.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "eventView");
                },
                child: Container(
                  height: 250,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            '${userCommunityCountDto.totalChildren}',
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
                            color: textColorGrey,
                          ),
                        ),
                        ListTile(
                          title: Text('Event', style: textStyleBlueGreySmaller),
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
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          '${userCommunityCountDto.totalUsers}',
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
                          color: textColorGrey,
                        ),
                      ),
                      ListTile(
                        title: Text('Users', style: textStyleBlueGreySmaller),
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
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        '${userCommunityCountDto.totalSubscribers}',
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
                        color: textColorGrey,
                      ),
                    ),
                    ListTile(
                      title:
                          Text('Subscription', style: textStyleBlueGreySmaller),
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
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        '${userCommunityCountDto.totalEvents}',
                        style: textStylePrimaryColorDarkLargeBold,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        'assets/icons/boy.png',
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                        color: textColorGrey,
                      ),
                    ),
                    ListTile(
                      title: Text('Children', style: textStyleBlueGreySmaller),
                    ),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

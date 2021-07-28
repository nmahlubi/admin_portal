import 'package:Live_Connected_Admin/core/model/user_community_count_dto.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'cards.dart';

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
                  child: Cards(
                    userCommunityCountDto: userCommunityCountDto,
                    image: Image.asset(
                      'assets/icons/calendar.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                      color: textColorLightBlue,
                    ),
                    count: Text(
                      '${userCommunityCountDto.totalEvents}',
                      style: textStylePrimaryColorDarkLargeBold,
                    ),
                    title: Text(
                      'Events',
                      style: textStyleBlueGreySmaller,
                    ),
                  ),
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "usersView");
                  },
                  child: Cards(
                    userCommunityCountDto: userCommunityCountDto,
                    image: Image.asset(
                      'assets/icons/group.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                      color: textColorLightBlue,
                    ),
                    count: Text(
                      '${userCommunityCountDto.totalUsers}',
                      style: textStylePrimaryColorDarkLargeBold,
                    ),
                    title: Text(
                      'Users',
                      style: textStyleBlueGreySmaller,
                    ),
                  ),
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
                  child: Cards(
                    userCommunityCountDto: userCommunityCountDto,
                    image: Image.asset(
                      'assets/images/renew.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                      color: textColorLightBlue,
                    ),
                    count: Text(
                      '${userCommunityCountDto.totalSubscribers}',
                      style: textStylePrimaryColorDarkLargeBold,
                    ),
                    title: Text(
                      'Subscriptions',
                      style: textStyleBlueGreySmaller,
                    ),
                  ),
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "EventView");
                  },
                  child: Cards(
                    userCommunityCountDto: userCommunityCountDto,
                    image: Image.asset(
                      'assets/icons/boy.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                      color: textColorLightBlue,
                    ),
                    count: Text(
                      '${userCommunityCountDto.totalChildren}',
                      style: textStylePrimaryColorDarkLargeBold,
                    ),
                    title: Text(
                      'Children',
                      style: textStyleBlueGreySmaller,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "AdvertView");
                  },
                  child: Cards(
                    image: Image.asset(
                      'assets/images/shopping-cart.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                      color: textColorLightBlue,
                    ),
                    title: Text(
                      'Advert',
                      style: textStyleBlueGreySmaller,
                    ),
                  ),
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
            ],
          ),
        ],
      ),
    );
  }
}

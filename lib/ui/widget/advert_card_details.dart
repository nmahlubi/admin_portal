import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdvertCardDetails extends StatelessWidget {
  final Advert advert;
  const AdvertCardDetails({Key key, this.advert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
            height: 300,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text("${advert.title}  ${advert.subtitle}",
                //     style: headerStylesBlack),
                UIHelper.verticalSpaceSmall(),
                Text("Email : ${advert.emailAddress}", style: textStyle),
                UIHelper.verticalSpaceSmall(),
                Text("Contact Number: ${advert.cellNumber}", style: textStyle),
                UIHelper.verticalSpaceSmall(),
                Text(
                    "Date Created: ${DateFormat.yMMMd().format(advert.created ?? DateTime.now())}",
                    style: textStyle),
                UIHelper.verticalSpaceSmall(),
              ],
            )),
      ),
    );
  }
}

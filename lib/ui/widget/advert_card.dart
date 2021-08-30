import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'advert_item.dart';

class AdvertCard extends StatelessWidget {
  var title;
  final Advert advert;
  final subTitle;
  final description;
  final imageUrl;
  final ImageWidget;
  final Function(String) deleteAdvert;
  final Function(Advert) updateAdvertDetails;

  AdvertCard(
      {Key key,
      this.title,
      this.advert,
      this.subTitle,
      this.description,
      this.imageUrl,
      this.ImageWidget,
      this.deleteAdvert,
      this.updateAdvertDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: ClipPath(
          child: Container(
            height: 250,
            width: 100,
            child: Column(
              children: <Widget>[
                UIHelper.verticalSpaceSmall(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: title,
                    ),
                    UIHelper.verticalSpaceMediumLarge(),
                    IconButton(
                      alignment: Alignment.centerRight,
                      color: primaryColor,
                      icon: ImageIcon(
                        AssetImage("assets/icons/edit.png"),
                        size: 30,
                      ),
                      tooltip: 'Edit',
                      onPressed: () {
                        updateAdvertDetails(advert);
                      },
                    ),
                    IconButton(
                      alignment: Alignment.centerRight,
                      color: primaryColor,
                      icon: ImageIcon(
                        AssetImage("assets/icons/delete.png"),
                        size: 30,
                      ),
                      tooltip: 'Delete',
                      onPressed: () {
                        deleteAdvert(advert.id);
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: ImageWidget,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // child: subTitle,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: description,
                ),
              ],
            ),
          ),
          clipper: ShapeBorderClipper(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: primaryColorLight,
          blurRadius: 20.0,
        )
      ]),
    );
  }
}

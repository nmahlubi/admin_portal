import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvertItem extends StatelessWidget {
  final Advert advert;
  final Function onClickExplore;
  final ImageWidget;
  final Function(String) deleteAdvert;
  final Function(Advert) updateAdvertDetails;
  final Function(Advert) viewAdvert;

  AdvertItem(
      {Key key,
      this.advert,
      this.onClickExplore,
      this.ImageWidget,
      this.deleteAdvert,
      this.updateAdvertDetails,
      this.viewAdvert})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 4,
      child: ListTile(
        leading: Row(
          children: <Widget>[
            IconButton(
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
      ),
    );
  }
}

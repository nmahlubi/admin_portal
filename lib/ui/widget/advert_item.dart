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

  AdvertItem({Key key, this.advert, this.onClickExplore, this.ImageWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 4,
        child: ListTile(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              "${advert?.title}",
              style: entryStyles,
            ),
          ),
          subtitle: Text("${advert?.category}"),
          trailing: CircleAvatar(
            radius: 50.0,
            child: CachedNetworkImage(
              imageUrl:
                  advert.iconUrl.path != null && advert.iconUrl.path.isNotEmpty
                      ? advert.iconUrl.path
                      : 'asset/images/image_placeholder.png',
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            //backgroundColor: Colors.orange,
          ),
        ));
  }
}

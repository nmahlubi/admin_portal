import 'package:Live_Connected_Admin/core/enums/viewstate.dart';
import 'package:Live_Connected_Admin/core/model/advert.dart';
import 'package:Live_Connected_Admin/core/model/client_user_dto.dart';
import 'package:Live_Connected_Admin/core/shared/core_helpers.dart';
import 'package:Live_Connected_Admin/core/viewmodel/advert_model.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:Live_Connected_Admin/ui/view/base_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card_widget.dart';
import 'custom_error_message.dart';

class DetailedAdvertItem extends StatelessWidget {
  final String advertId;
  final Advert advert;

  DetailedAdvertItem({Key key, this.advert, this.advertId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClientUserDto user = Provider.of<ClientUserDto>(context, listen: false);
    return Scaffold(
      backgroundColor: textColorWhite,
      body: BaseView<AdvertModel>(onModelReady: (model) {
        model.getAdvertList();
        model.getAdvertById(advertId);
      }, builder: (BuildContext context, AdvertModel model, Widget child) {
        return Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: CachedNetworkImage(
                height: 300,
                width: double.infinity,
                imageUrl: model.advert.mainImageUrl.path != null &&
                        model.advert.mainImageUrl.path.isNotEmpty
                    ? model.advert.mainImageUrl.path
                    : 'asset/images/image_placeholder.png',
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            UIHelper.verticalSpaceSmall(),
          ],
        );
      }),
    );
  }
}

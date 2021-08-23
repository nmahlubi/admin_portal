import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvertCard extends StatelessWidget {
  var title;
  final subTitle;
  final description;
  final imageUrl;
  final ImageWidget;

  AdvertCard({
    Key key,
    this.title,
    this.subTitle,
    this.description,
    this.imageUrl,
    this.ImageWidget,
  }) : super(key: key);

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
                Container(
                  alignment: Alignment.topCenter,
                  child: title,
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

import 'package:Live_Connected_Admin/core/model/user_community_count_dto.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final Image image;
  var count;
  var title;
  Cards(
      {Key key,
      @required this.userCommunityCountDto,
      this.count,
      this.image,
      this.title})
      : super(key: key);

  final UserCommunityCountDto userCommunityCountDto;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(12),
        child: Card(
          elevation: 5,
          child: ClipPath(
            child: Container(
              height: 250,
              width: 300,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: count,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 90,
                      width: 120,
                      decoration: BoxDecoration(
                        color: primaryColorLight,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: image,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: title,
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: primaryColorDark, width: 5))),
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
        ]));
  }
}

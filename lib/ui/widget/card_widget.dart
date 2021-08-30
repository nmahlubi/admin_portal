import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Image image;
  var number;
  var title;

  CardWidget({Key key, this.title, this.image, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(80),
            ),
          ),
          child: Image.asset(
            'assets/icons/telephone.png',
            height: 50,
            width: 50,
            color: Colors.white,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Call us",
            style: entryStyles2,
            textAlign: TextAlign.center,
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            '0676030283',
            style: mainHeaderStyleBlack,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

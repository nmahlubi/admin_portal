import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadImage extends StatelessWidget {
  final Function ImageButton;
  final text;
  final textColor;
  final path;
  final Color color;

  const UploadImage(
      {Key key,
      this.color,
      this.ImageButton,
      this.text,
      this.textColor,
      this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: FlatButton(
          color: color,
          child: text,
          onPressed: () {},
        ),
      ),
    );
  }
}

import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';

import 'package:flutter/material.dart';

import '../shared/app_colors.dart';
import '../shared/ui_helpers.dart';
import 'image_widget.dart';

class MenuItem extends StatefulWidget {
  final String title;
  final Function press;
  final double verticalPadding;
  final bool selected;
  final String imagePath;
  final Color color;

  const MenuItem({
    Key key,
    this.title,
    this.press,
    this.verticalPadding = 16,
    this.selected,
    this.imagePath,
    this.color,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuItemState();
}

class MenuItemState extends State<MenuItem> {
  Color textColor;
  Color defaultColor;

  @override
  void initState() {
    defaultColor = widget.selected ? primaryColor : textColorGrey;
    textColor = defaultColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.selected ? null : widget.press,
      onHover: (hovered) {
        setState(() {
          textColor = hovered ? primaryColorLight : defaultColor;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 8.0, vertical: widget.verticalPadding),
        child: Row(
          children: [
            ImageWidget(
              height: 40,
              imageRadius: 40,
              marginTop: 0,
              path: widget.imagePath,
              imageColor: widget.color,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  color: textColor,
                  fontWeight:
                      widget.selected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 15),
            ),
            Container(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

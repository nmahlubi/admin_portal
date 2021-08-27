import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_date_field.dart';

class TextFieldWidget extends StatelessWidget {
  final hintText;
  final filled;
  final filledColor;
  final controller;

  const TextFieldWidget({
    Key key,
    this.hintText,
    this.filled,
    this.filledColor,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Company Title',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

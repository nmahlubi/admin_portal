import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomah/ui/shared/app_colors.dart';

class CellTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final double horizontalPadding;
  final double verticalPadding;
  final double horizontalMargin;
  final double verticalMargin;
  final bool showPrefixIcon;
  final bool boarder;

  CellTextField({this.controller, this.hint = "Cell Number", this.horizontalPadding = 15,
    this.verticalPadding = 0, this.horizontalMargin = 15, this.verticalMargin = 0,
    this.showPrefixIcon = false, this.boarder = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin),
      width: 400,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: widgetBgColor,
          borderRadius: boarder ? BorderRadius.circular(30.0): null
      ),
      child: TextFormField(
        maxLines: 1,
        inputFormatters: [LengthLimitingTextInputFormatter(10)],
        keyboardType: TextInputType.phone,
        autofocus: false,
        decoration: InputDecoration(
            hintText: hint,
            labelText: hint,
            icon: showPrefixIcon ? Icon(
              Icons.call,
              color: secondaryColor,
            ) : null,
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          border: boarder ? InputBorder.none : UnderlineInputBorder(
            borderSide: BorderSide(),
          ),
          focusedBorder: boarder ? InputBorder.none : UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor)
          ),
        ),
        controller: controller,

      ),
    );
  }
}
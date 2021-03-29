import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final double horizontalPadding;
  final double horizontalContentPadding;
  final double verticalPadding;
  final double horizontalMargin;
  final double verticalMargin;
  final bool showPrefixIcon;
  final bool boarder;

  EmailTextField({this.controller, this.hint = "Email Address", this.horizontalPadding = 15,
    this.verticalPadding = 0, this.horizontalMargin = 15, this.verticalMargin = 0,
    this.showPrefixIcon = false, this.boarder = false, this.horizontalContentPadding = 0});

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
        inputFormatters: [LengthLimitingTextInputFormatter(60)],
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: hint,
            labelText: hint,
            icon: showPrefixIcon ? Icon(
              Icons.mail,
              color: secondaryColor,
            ) : null,
          contentPadding: EdgeInsets.symmetric(horizontal: horizontalContentPadding, vertical: 4),
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
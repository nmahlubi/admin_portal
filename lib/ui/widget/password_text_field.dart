import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomah/ui/shared/app_colors.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final double horizontalPadding;
  final double horizontalContentPadding;
  final double verticalPadding;
  final double horizontalMargin;
  final double verticalMargin;
  final bool showPrefixIcon;
  final bool showSuffixIcon;
  final bool boarder;
  PasswordTextField({@required this.controller, this.hint = "Enter Password", this.horizontalPadding = 15,
    this.verticalPadding = 0, this.horizontalMargin = 15, this.verticalMargin = 0,
    this.showPrefixIcon = false, this.showSuffixIcon = true, this.boarder = false, this.horizontalContentPadding = 0});

  @override
  State<StatefulWidget> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool passwordVisible = false;


  @override
  void initState() {
    passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
      margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin, vertical: widget.verticalMargin),
      decoration: BoxDecoration(
          color: widgetBgColor,
          borderRadius: widget.boarder ? BorderRadius.circular(30.0): null
      ),
      width: 400,
      alignment: Alignment.centerLeft,
      child: TextFormField(
        maxLines: 1,
        inputFormatters: [LengthLimitingTextInputFormatter(30)],
        obscureText: !passwordVisible,
        autofocus: false,
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.hint,
          fillColor: widgetBgColor,
          icon: widget.showPrefixIcon ? Icon(
            Icons.lock,
            color: secondaryColor,
          ) : null,
          suffixIcon: widget.showSuffixIcon ? IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              passwordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: secondaryColor,
            ),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ) : null,
            contentPadding: EdgeInsets.symmetric(horizontal: widget.horizontalContentPadding, vertical: 4),
          border: widget.boarder ? InputBorder.none : UnderlineInputBorder(
            borderSide: BorderSide(),
          ),
          focusedBorder: widget.boarder ? InputBorder.none : UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor)
          ),
        ),
        controller: widget.controller,

      ),
    );
  }
}
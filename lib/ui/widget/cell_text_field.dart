import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CellTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final double horizontalPadding;
  final double verticalPadding;
  final double horizontalContentPadding;
  final double horizontalMargin;
  final double verticalMargin;
  final bool showPrefixIcon;
  final bool boarder;
  final bool capitalizeWords;
  final double width;
  final Color color;
  final bool borderRadiusPresent;
  final BorderRadius borderRadius;
  final bool customHint;
  final Function(String) onTextChange;

  CellTextField(
      {this.controller,
      this.hint = "Cell Number",
      this.horizontalPadding = 15,
      this.verticalPadding = 0,
      this.horizontalMargin = 0,
      this.verticalMargin = 0,
      this.showPrefixIcon = false,
      this.boarder = false,
      this.capitalizeWords = true,
      this.onTextChange,
      this.width = 400,
      this.color = widgetBgColor,
      this.borderRadiusPresent = true,
      this.borderRadius = UIHelper.textFieldBorderRadiusAllCircular,
      this.customHint = false,
      this.horizontalContentPadding = 0});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: IntrinsicHeight(
        child: Row(
          children: [
            customHint
                ? Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              UIHelper.isLargeScreen(screenWidth) ? 16 : 8),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: borderRadiusPresent
                            ? BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8))
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          hint,
                          style: textStyleWhiteLight,
                        ),
                      ),
                    ),
                  )
                : Container(),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                margin: EdgeInsets.symmetric(
                    horizontal: horizontalMargin, vertical: verticalMargin),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: borderRadiusPresent ? borderRadius : null,
                ),
                child: TextFormField(
                  maxLines: 1,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  keyboardType: TextInputType.phone,
                  textCapitalization: capitalizeWords
                      ? TextCapitalization.words
                      : TextCapitalization.sentences,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: !customHint ? hint : null,
                    labelText: !customHint ? hint : null,
                    icon: showPrefixIcon
                        ? Icon(
                            Icons.call,
                            color: primaryColor,
                          )
                        : null,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: horizontalContentPadding, vertical: 4),
                    border: !boarder
                        ? InputBorder.none
                        : OutlineInputBorder(
                            borderSide:
                                BorderSide(color: widgetGreyColor, width: 3),
                            borderRadius:
                                borderRadiusPresent ? borderRadius : null),
                    focusedBorder: !boarder
                        ? InputBorder.none
                        : OutlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 3),
                            borderRadius:
                                borderRadiusPresent ? borderRadius : null),
                  ),
                  controller: controller,
                  onChanged: onTextChange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

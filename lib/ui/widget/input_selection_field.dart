import 'package:Live_Connected_Admin/ui/shared/app_colors.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:Live_Connected_Admin/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class InputSelectionField extends StatelessWidget {
  final String hint;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Color color;
  final double horizontalPadding;
  final double verticalPadding;
  final double horizontalMargin;
  final double verticalMargin;
  final double horizontalContentPadding;
  final double width;
  final double height;
  final bool borderRadiusPresent;
  final bool customHint;
  final BorderRadius borderRadius;
  final bool boarder;
  final bool splitByComma;

  const InputSelectionField(
      {Key key,
      this.hint,
      this.valueText,
      this.valueStyle,
      this.onPressed,
      this.color = widgetBgColor,
      this.horizontalPadding = 15,
      this.verticalPadding = 0,
      this.horizontalContentPadding = 0,
      this.horizontalMargin = 0,
      this.verticalMargin = 0,
      this.width = 400,
      this.borderRadiusPresent = true,
      this.customHint = false,
      this.borderRadius = UIHelper.textFieldBorderRadiusAllCircular,
      this.boarder = false,
      this.height = 50,
      this.splitByComma = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
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
                          textAlign: TextAlign.center,
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
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: borderRadiusPresent ? borderRadius : null,
                ),
                child: new InkWell(
                  onTap: onPressed,
                  child: new InputDecorator(
                    decoration: new InputDecoration(
                      hintText: !customHint ? hint : null,
                      labelText: !customHint ? hint : null,
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
                    baseStyle: valueStyle,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                            child: Text(
                                splitByComma
                                    ? valueText.replaceAll(",", "\n")
                                    : valueText,
                                style: valueStyle)),
                        Icon(Icons.arrow_drop_down,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.grey.shade700
                                    : Colors.white70),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

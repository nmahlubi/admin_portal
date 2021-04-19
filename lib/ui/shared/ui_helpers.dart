import 'package:flutter/material.dart';
import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';

import 'app_colors.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceXSmall = 1.0;
  static const double _VerticalSpaceSmall = 5.0;
  static const double _VerticalSpaceMedium = 20.0;
  static const double _VerticalSpaceMediumLarge = 40.0;
  static const double _VerticalSpaceLarge = 60.0;
  static const double _VerticalSpaceXLarge = 120.0;
  static const BorderRadius textFieldBorderRadiusAllCircular =
      const BorderRadius.all(Radius.circular(8));

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceXSmall = 5.0;
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 20.0;
  static const double _HorizontalSpaceMediumLarge = 20.0;
  static const double _HorizontalSpaceLarge = 60.0;
  static const double _HorizontalSpaceXLarge = 120.0;

  /// Returns a vertical space with height set to [_VerticalSpaceXSmall]
  static Widget verticalSpaceXSmall() {
    return verticalSpace(_VerticalSpaceXSmall);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(_VerticalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(_VerticalSpaceMedium);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMediumLarge]
  static Widget verticalSpaceMediumLarge() {
    return verticalSpace(_VerticalSpaceMediumLarge);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return verticalSpace(_VerticalSpaceLarge);
  }

  static Widget verticalSpaceXLarge() {
    return verticalSpace(_VerticalSpaceXLarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceXSmall]
  static Widget horizontalSpaceXSmall() {
    return horizontalSpace(_HorizontalSpaceXSmall);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_HorizontalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_HorizontalSpaceMedium);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceMediumLarge]
  static Widget horizontalSpaceMediumLarge() {
    return horizontalSpace(_HorizontalSpaceMediumLarge);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(_HorizontalSpaceLarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }

  static void showDialogNoActions(
      BuildContext context, String title, Widget content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
                decoration: new BoxDecoration(
                  color: primaryColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0)),
                ),
                padding: EdgeInsets.only(left: 24, top: 8, right: 8, bottom: 4),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: titleStyleWhite,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 30,
                            color: Colors.white,
                          ),
                          tooltip: 'Close',
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    )
                  ],
                )),
            titlePadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            content: content,
            //actionsPadding: EdgeInsets.zero,
          );
        });
  }

  static void showDialogOneAction(BuildContext context, String title,
      Widget content, Function onClickButton, String buttonText) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
                decoration: new BoxDecoration(
                  color: primaryColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0)),
                ),
                padding: EdgeInsets.only(left: 24, top: 8, right: 8, bottom: 4),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: titleStyleWhite,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 30,
                            color: Colors.white,
                          ),
                          tooltip: 'Close',
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    )
                  ],
                )),
            titlePadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            content: content,
            actions: <Widget>[
              FlatButton(
                child: Text(buttonText),
                onPressed: () {
                  Navigator.of(context).pop();
                  onClickButton();
                },
              )
            ],
          );
        });
  }

  static void showDialogTwoActions(
      BuildContext context,
      String title,
      Widget content,
      Function onClickButtonOne,
      String buttonOneText,
      Function onClickButtonTwo,
      String buttonTwoText) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
                decoration: new BoxDecoration(
                  color: primaryColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0)),
                ),
                padding: EdgeInsets.only(left: 24, top: 8, right: 8, bottom: 4),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: titleStyleWhite,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 30,
                            color: Colors.white,
                          ),
                          tooltip: 'Close',
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    )
                  ],
                )),
            titlePadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            content: content,
            actions: <Widget>[
              FlatButton(
                child: Text(buttonOneText),
                onPressed: () {
                  Navigator.of(context).pop();
                  onClickButtonOne();
                },
              ),
              FlatButton(
                child: Text(buttonTwoText),
                onPressed: () {
                  Navigator.of(context).pop();
                  onClickButtonTwo();
                },
              ),
            ],
          );
        });
  }

  static void showDialogNoActionsNoTitle(BuildContext context, Widget content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
                decoration: new BoxDecoration(
                  color: widgetBgColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0)),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 30,
                      color: secondaryColor,
                    ),
                    tooltip: 'Close',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )),
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            content: content,
            //actionsPadding: EdgeInsets.zero,
          );
        });
  }

  static bool isLargeScreen(double screenWidth) {
    return screenWidth > 900;
  }
}

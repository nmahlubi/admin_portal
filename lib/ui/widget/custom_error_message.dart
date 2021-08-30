import 'package:Live_Connected_Admin/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  final String errorMessage;
  final TextAlign textAlign;

  const CustomErrorMessage(this.errorMessage,
      {this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: textStyleSecondaryNormal,
      textAlign: textAlign,
    );
  }
}

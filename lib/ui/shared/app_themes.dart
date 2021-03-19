import 'package:flutter/material.dart';

import 'app_colors.dart';

//Widget themes
whiteSectionTheme(context) => Theme.of(context).copyWith(
    primaryColor: primaryColor, primaryTextTheme: whiteTextTheme(context));

dateSectionTheme(context) => Theme.of(context).copyWith(
      primaryColor: primaryColor,
      canvasColor: secondaryColor,
      accentColor: secondaryColor,
      colorScheme: ColorScheme.light(primary: primaryColor),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
    );

//Text Themes
whiteTextTheme(context) => Theme.of(context).textTheme.apply(
      bodyColor: Colors.black26,
      displayColor: Colors.black26,
    );

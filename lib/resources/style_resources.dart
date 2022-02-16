import 'package:flutter/material.dart';

import 'color_resources.dart';

final BorderRadius radius = BorderRadius.circular(6.0);

final ThemeData appTheme = ThemeData(
  fontFamily: 'Roboto',

  ///appBar theme
  appBarTheme: const AppBarTheme(
    color: kBlueColor,
    elevation: 0.0,
  ),

  ///text theme
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      fontFamily: 'Roboto',
    ),
    bodyText1: TextStyle(
      fontFamily: 'Roboto',
    ),
    bodyText2: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
  ),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
import 'package:flutter/material.dart';

Color kPrimaryColor = Colors.grey[800];
Color kTextColor = Colors.grey[800];
Color kTextLightColor = Colors.blue[700];

ThemeData appThemeData = ThemeData(
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 1,
    iconTheme: IconThemeData(color: Colors.grey.shade800),
    actionsIconTheme: IconThemeData(color: Colors.grey.shade800),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

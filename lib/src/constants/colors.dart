import 'package:flutter/material.dart';

const Color primaryColor = Colors.red;
const Color secondayColor = Colors.black;
const Color backgroundColor = Colors.white;

const Color darkPrimaryColor = Colors.blueGrey;
const Color darkSecondayColor = Colors.white;
const Color darkBackgroundColor = Colors.black;

class MeaningAppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor, brightness: Brightness.light),
    useMaterial3: true,
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
        seedColor: darkPrimaryColor, brightness: Brightness.dark),
    useMaterial3: true,
  );
}

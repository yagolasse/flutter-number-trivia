import 'package:flutter/material.dart';

enum AppTheme {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
}

final appThemeData = {
  AppTheme.GreenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green.shade800,
    accentColor: Colors.green.shade600,
  ),
  AppTheme.GreenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green.shade700,
    accentColor: Colors.green.shade500,
  ),
  AppTheme.BlueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue.shade800,
    accentColor: Colors.blue.shade600,
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue.shade700,
    accentColor: Colors.blue.shade500,
  ),
};

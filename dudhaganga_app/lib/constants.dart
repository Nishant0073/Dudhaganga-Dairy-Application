import 'package:flutter/material.dart';

const splashScreenTitle = TextStyle(
  color: Colors.white,
  fontFamily: "Poppins",
  fontWeight: FontWeight.bold,
  fontSize: 50,
);

Color app_base_color = Color.fromARGB(255, 5, 201, 80);

bool useLightMode = false;
ThemeData themeData = ThemeData(
  colorSchemeSeed: app_base_color,
  useMaterial3: true,
  brightness: useLightMode ? Brightness.light : Brightness.dark,
);
const double narrowScreenWidthThreshold = 450;

const appName = "Dudhaganga Dairy";

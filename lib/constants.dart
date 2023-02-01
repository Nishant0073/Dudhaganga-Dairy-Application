import 'package:flutter/material.dart';
import 'package:get/get.dart';

const splashScreenTitle = TextStyle(
  color: Colors.white,
  fontFamily: "Poppins",
  fontWeight: FontWeight.bold,
  fontSize: 50,
);

Color lightGray = const Color(0xFF95A1AC);
Color blackColor = const Color(0xFF000000);

Color appBaseColor = const Color.fromARGB(255, 5, 201, 80);

bool useLightMode = true;
ThemeData themeData = ThemeData(
  colorSchemeSeed: appBaseColor,
  useMaterial3: true,
  brightness: useLightMode ? Brightness.light : Brightness.dark,
);
const double narrowScreenWidthThreshold = 450;

String appName = "constants_app_name".tr;

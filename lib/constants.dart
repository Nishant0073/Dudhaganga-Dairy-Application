import 'package:flutter/material.dart';
import 'package:get/get.dart';

const splashScreenTitle = TextStyle(
  color: Colors.white,
  fontFamily: "Poppins",
  fontWeight: FontWeight.bold,
  fontSize: 50,
);

Color light_gray = const Color(0xFF95A1AC);
Color black_color = const Color(0xFF000000);

Color app_base_color = const Color.fromARGB(255, 5, 201, 80);

bool useLightMode = true;
ThemeData themeData = ThemeData(
  colorSchemeSeed: app_base_color,
  useMaterial3: true,
  brightness: useLightMode ? Brightness.light : Brightness.dark,
);
const double narrowScreenWidthThreshold = 450;

String appName = "constants_app_name".tr;

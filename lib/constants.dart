import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'main.dart';

final snackbarService = locator<SnackbarService>();

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
double sswidth = 0;
double ssheight = 0;
String appFontFamilly = "Poppins";
double H(context) {
  return MediaQuery.of(context).size.height;
}

double W(context) {
  return MediaQuery.of(context).size.width;
}

PreferredSizeWidget createAppBar() {
  return AppBar(
    title: Text('select_farmer'.tr),
    actions: [
      IconButton(
        icon: useLightMode
            ? const Icon(Icons.wb_sunny_outlined)
            : const Icon(Icons.wb_sunny),
        onPressed: handleThemeChange,
        tooltip: "Toggle brightness",
      ),
    ],
  );
}

//handles the theme of the app
void handleThemeChange() {
  //changing app theme using stream controller,
  useLightMode = !useLightMode;
  isLightTheme.add(useLightMode);
  themeData = ThemeData(
      colorSchemeSeed: appBaseColor,
      useMaterial3: true,
      brightness: useLightMode ? Brightness.light : Brightness.dark);
}

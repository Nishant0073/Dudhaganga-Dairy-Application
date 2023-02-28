import 'package:dudhaganga_app/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

Color appBaseColor = const Color.fromARGB(255, 19, 202, 59);

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
double thesnf = 7.2;

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

Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut().whenComplete(() async {
    final mainPrefs = await SharedPreferences.getInstance();
    mainPrefs.clear();
    snackbarService.showSnackbar(message: "Successfully Logout!");
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const SplashScreen()),
          (route) => false);
    }
  }).onError((error, stackTrace) {
    print("signOut: $error");
    snackbarService.showSnackbar(message: "Unable tp logout!");
  });
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

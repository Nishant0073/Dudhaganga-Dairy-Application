import 'dart:async';
import 'package:dudhaganga_app/milk_buyerpages/Get_Bill.dart';
import 'package:dudhaganga_app/milk_buyerpages/Splash_screen_buyer.dart';
import 'package:dudhaganga_app/collectorPages/user_home_page.dart';
import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/milk_buyerpages/home_buyer.dart';
import 'package:dudhaganga_app/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dudhaganga_app/languagepage.dart';

//Created to handle theme of app from stream controller.
StreamController<bool> isLightTheme = StreamController();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: true,
      stream: isLightTheme.stream,
      builder: (context, snapshot) {
        return GetMaterialApp(
            translations: LanguagePage(),
            locale: const Locale('en', 'US'),
            debugShowCheckedModeBanner: false,
            title: 'Dudhaganga Dairy',
            themeMode: snapshot.data! ? ThemeMode.light : ThemeMode.dark,
            theme: themeData,
            home: SplashScreenb());
      },
    );
  }
}

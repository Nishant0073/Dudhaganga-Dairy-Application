import 'dart:async';
import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/services/razorpay.dart';
import 'package:dudhaganga_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dudhaganga_app/languagepage.dart';
import 'app/app.locator.dart';

//Created to handle theme of app from stream controller.
StreamController<bool> isLightTheme = StreamController();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  razerInit();
  setupLocator();
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
          home: const SplashScreen(),
        );
      },
    );
  }
}

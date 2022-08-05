import 'dart:async';

import 'package:dudhaganga_app/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => WelcomeScreen())));
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 19, 202, 59),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
                child: Text(
              "Dudhaganga Dairy",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:dudhaganga_app/select_user/select_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final mainPrefs = await SharedPreferences.getInstance();
      final String? id = mainPrefs.getString('user_id');
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      ssheight = height;
      sswidth = width;
      print("user id: $id");
      // const SelectUserScreen();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectUserScreen(),
        ),
      );
      // if (id == null || id == "") {
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => const MyLogin()),
      //   );
      // } else {
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => MyLogin()));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 19, 202, 59),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              appName,
              textAlign: TextAlign.center,
              style: splashScreenTitle,
            ))
          ],
        ),
      ),
    );
  }
}

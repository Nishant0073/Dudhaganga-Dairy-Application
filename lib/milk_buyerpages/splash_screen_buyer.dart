import 'package:dudhaganga_app/milk_buyerpages/login_buyer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class SplashScreenb extends StatefulWidget {
  const SplashScreenb({Key? key}) : super(key: key);

  @override
  State<SplashScreenb> createState() => _SplashScreenbState();
}

class _SplashScreenbState extends State<SplashScreenb> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final mainPrefs = await SharedPreferences.getInstance();
      final String? id = mainPrefs.getString('user_id');
      ssheight = 0;
      sswidth = 0;
      if (mounted) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        ssheight = height;
        sswidth = width;
      }

      print("user id: $id");
      if (mounted) {
        if (id == null || id == "") {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MyLogin()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyLogin()));
        }
      }
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

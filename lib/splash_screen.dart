// ignore_for_file: use_build_context_synchronously

import 'package:dudhaganga_app/select_user/select_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'collectorPages/home_page.dart';
import 'constants.dart';
import 'farmerPages/farmer_home_page.dart';
import 'milk_buyerpages/home_buyer.dart';

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
      final String? id = mainPrefs.getString(userCn);
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      ssheight = height;
      sswidth = width;
      print("user id: $id");
      print("user cn is: $id");
      // const SelectUserScreen();
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const SelectUserScreen(),
      //   ),
      // );
      if (id == null || id == "") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SelectUserScreen()),
        );
      } else {
        String? userType = mainPrefs.getString(userTypeCn);
        if (context.mounted) {
          if (userType == "Milk Collector") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomePage(userId: id)));
          } else if (userType == "Milk Buyer") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BuyerHomePage()));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => FarmerHomePage()));
          }
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

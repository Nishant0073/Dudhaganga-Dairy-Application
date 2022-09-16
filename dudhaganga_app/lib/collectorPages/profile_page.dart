import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CircleAvatar(
                    //  backgroundColor: Colors.greenAccent[400],
                    radius: 70,
                    backgroundImage:
                        AssetImage('assets/images/profile_pic.jpg'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Ram More",
                    style: themeData.textTheme.labelLarge!.copyWith(
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeData.focusColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "+91 8329060000",
                        style: themeData.textTheme.displayMedium,
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "ram1234@gmail.com",
                        style: themeData.textTheme.displayMedium,
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

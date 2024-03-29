import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('profile_page_profile'.tr),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.edit_note),
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
                  const CircleAvatar(
                    //  backgroundColor: Colors.greenAccent[400],
                    radius: 70,
                    backgroundImage:
                        AssetImage('assets/images/profile_pic.jpg'),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'profile_page_farmer_name'.tr,
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
                        "+91 1234567890",
                        style: themeData.textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "ram1234@gmail.com",
                        style: themeData.textTheme.displayMedium,
                      ),
                      const SizedBox(
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

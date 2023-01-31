import 'package:dudhaganga_app/collectorPages/side_bar.dart';
import 'package:dudhaganga_app/customWidgets/cCard.dart';
import 'package:dudhaganga_app/select_farmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('side_bar_home'.tr),
      ),
      drawer: SideNevigationBar(),
      body: Center(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                cCard(
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/sunset.jpg',
                      ),
                    ),
                    title: const Text('9 Sup 2022'),
                    subtitle: Text('user_home_page_morning'.tr),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 1,
                        child: cCard(
                          child: Column(
                            children: [
                              Text('user_home_page_collected_milk'.tr),
                              Text(
                                '34 L',
                                style: TextStyle(fontSize: 32.0),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: cCard(
                        child: Column(
                          children: [
                            Text('user_home_page_remaining_farmer'.tr),
                            Text(
                              '21',
                              style: TextStyle(fontSize: 32.0),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: cCard(
                        child: Column(
                          children: [
                            Text('user_home_page_sold_milk'.tr),
                            Text(
                              '8 L',
                              style: TextStyle(fontSize: 32.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: cCard(
                        child: Column(
                          children: [
                            Center(child: Text('user_home_page_customer'.tr)),
                            Text(
                              '14',
                              style: TextStyle(fontSize: 32.0),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                cCard(
                  child: GestureDetector(
                      child: ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Icon(
                              Icons.edit_note,
                              size: 45.0,
                            )),
                        title: Text('user_home_page_reading'.tr,
                            style: TextStyle(
                              fontSize: 20.0,
                            )),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectFarmer()));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

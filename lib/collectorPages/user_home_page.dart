import 'package:dudhaganga_app/collectorPages/screens/select_farmer/select_farmer_screen.dart';
import 'package:dudhaganga_app/collectorPages/screens/take_readings/take_readings_view.dart';
import 'package:dudhaganga_app/collectorPages/screens/view_history/view_history_screen.dart';
import 'package:dudhaganga_app/collectorPages/side_bar.dart';
import 'package:dudhaganga_app/customWidgets/c_card.dart';
import 'package:dudhaganga_app/models/farmer.dart';
import 'package:dudhaganga_app/models/milk_buyer.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/sell_milk/sell_milk_view.dart';
import 'screens/view_payments/view_payments_screen.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('side_bar_home'.tr),
      ),
      drawer: const SideNevigationBar(),
      body: Center(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HomeCard(
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/sunset.jpg',
                      ),
                    ),
                    title: Text(
                        "${dateTime.day} ${'${dateTime.month}'.tr} ${dateTime.year} "),
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
                        child: HomeCard(
                          child: Column(
                            children: [
                              Text('user_home_page_collected_milk'.tr),
                              const Text(
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
                      child: HomeCard(
                        child: Column(
                          children: [
                            Text('user_home_page_remaining_farmer'.tr),
                            const Text(
                              '21',
                              style: TextStyle(fontSize: 32.0),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: HomeCard(
                        child: Column(
                          children: [
                            Text('user_home_page_sold_milk'.tr),
                            const Text(
                              '8 L',
                              style: TextStyle(fontSize: 32.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: HomeCard(
                        child: Column(
                          children: [
                            Center(child: Text('user_home_page_customer'.tr)),
                            const Text(
                              '14',
                              style: TextStyle(fontSize: 32.0),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                HomeCard(
                  child: GestureDetector(
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.edit_note,
                            size: 45.0,
                          )),
                      title: Text('user_home_page_reading'.tr,
                          style: const TextStyle(
                            fontSize: 20.0,
                          )),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectFarmer(
                            onUserSelection: (Farmer farmer) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MilkReadingScreen(farmer),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                HomeCard(
                  child: GestureDetector(
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.history,
                            size: 45.0,
                          )),
                      title: Text('view_history'.tr,
                          style: const TextStyle(
                            fontSize: 20.0,
                          )),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialog(context),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                HomeCard(
                  child: GestureDetector(
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.payment,
                            size: 45.0,
                          )),
                      title: Text('view_payments'.tr,
                          style: const TextStyle(
                            fontSize: 20.0,
                          )),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectFarmer(
                            onUserSelection: (Farmer farmer) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ViewPaymentsScreen(
                                    farmer: farmer,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                HomeCard(
                  child: GestureDetector(
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.storefront,
                            size: 45.0,
                          )),
                      title: Text('sell_milk'.tr,
                          style: const TextStyle(
                            fontSize: 20.0,
                          )),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectFarmer(
                            isMilkBuyer: true,
                            onUserSelection: (MilkBuyer milkBuyer) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SellMilk(
                                    milkBuyer: milkBuyer,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: Text('select_user'.tr),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SelectFarmer(
                  onUserSelection: (Farmer farmer) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ViewHistoryScreen(
                          farmer: farmer,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
          child: Text('farmer'.tr),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SelectFarmer(
                  isMilkBuyer: true,
                  onUserSelection: (MilkBuyer milkBuyer) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ViewHistoryScreen(
                          milkBuyer: milkBuyer,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
          child: Text('milk_buyer'.tr),
        ),
      ],
    );
  }
}

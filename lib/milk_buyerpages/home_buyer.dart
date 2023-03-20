import 'package:dudhaganga_app/collectorPages/side_bar.dart';
import 'package:dudhaganga_app/customWidgets/c_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'history_pages/history_view.dart';

class BuyerHomePage extends StatefulWidget {
  const BuyerHomePage({super.key});

  @override
  State<BuyerHomePage> createState() => _BuyerHomePageState();
}

class _BuyerHomePageState extends State<BuyerHomePage> {
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
                              Text('Total Purchased Milk'.tr),
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
                            Text('Total Price of Milk'.tr),
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
                            Text('Pending Milk '.tr),
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
                            Center(child: Text('Total Pending Amount'.tr)),
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
                            Icons.history,
                            size: 45.0,
                          )),
                      title: Text('view_history'.tr,
                          style: const TextStyle(
                            fontSize: 20.0,
                          )),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewAllByerBillsScreen()));
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
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                // HomeCard(
                //   child: GestureDetector(
                //       child: ListTile(
                //         leading: ClipRRect(
                //             borderRadius: BorderRadius.circular(8.0),
                //             child: const Icon(
                //               Icons.edit_note,
                //               size: 45.0,
                //             )),
                //         title: Text('Get Total Bill'.tr,
                //             style: const TextStyle(
                //               fontSize: 20.0,
                //             )),
                //       ),
                //       onTap: () {
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => const BuyerMilkDetailPage()));
                //       }),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

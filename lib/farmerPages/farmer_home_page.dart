import 'package:dudhaganga_app/collectorPages/side_bar.dart';
import 'package:dudhaganga_app/farmerPages/view_history/view_history_screen.dart';
import 'package:dudhaganga_app/farmerPages/view_payments/view_payments_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../customWidgets/c_card.dart';

class FarmerHomePage extends StatefulWidget {
  const FarmerHomePage({super.key});

  @override
  State<FarmerHomePage> createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {
  TextEditingController? dateFormController;
  TextEditingController? dateToController;
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    dateFormController = TextEditingController(
        text: DateFormat('EEE,MMM,d, ' 'yy').format(selectedDate));
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text('side_bar_home'.tr),
      ),
      drawer: SideNevigationBar(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                        builder: (context) => ViewHistoryFarmerScreen()));
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const ViewPaymentsScreenFarmer()));
                  },
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const SizedBox(
                height: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tableData() {
    return Table(
      children: const [
        TableRow(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 185, 181, 181)),
            children: [
              TableCell(
                  child: Center(
                      child: Text(
                "Cattle",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))),
              TableCell(
                  child: Center(
                      child: Text("Litre",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
              TableCell(
                  child: Center(
                      child: Text("Fat",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
              TableCell(
                  child: Center(
                      child: Text("Rate",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
              TableCell(
                  child: Center(
                      child: Text("Total",
                          style: TextStyle(fontWeight: FontWeight.bold))))
            ]),
        TableRow(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 245, 244, 244)),
            children: [
              TableCell(child: Center(child: Text("Cow"))),
              TableCell(child: Center(child: Text("2L"))),
              TableCell(child: Center(child: Text("6.5"))),
              TableCell(child: Center(child: Text("20"))),
              TableCell(child: Center(child: Text("100"))),
            ])
      ],
    );
  }
}

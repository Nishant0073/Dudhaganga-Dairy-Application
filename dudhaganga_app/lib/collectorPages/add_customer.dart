import 'package:dudhaganga_app/collectorPages/add_farmer.dart';
import 'package:dudhaganga_app/collectorPages/add_milk_buyer.dart';
import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customWidgets/cCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AddCustomers extends StatelessWidget {
  const AddCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_customer'.tr),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddFarmer(),
                    ),
                  ),
                  child: cCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          'assets/images/farmer_with_milk.png',
                          height: 64.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'add_customer_farmer'.tr,
                              style: themeData.textTheme.headline3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddMilkBuyer(),
                    ),
                  ),
                  child: cCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          'assets/images/milk_buyer.png',
                          height: 64.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'add_customer_milk_buyer'.tr,
                              style: themeData.textTheme.headline3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

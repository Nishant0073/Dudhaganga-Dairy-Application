//view bills.
//view records.

import 'package:dudhaganga_app/customWidgets/c_card.dart';
import 'package:dudhaganga_app/customWidgets/ddd_loading.dart';
import 'package:dudhaganga_app/farmerPages/view_history/view_all_bills_screen.dart';
import 'package:dudhaganga_app/farmerPages/view_history/view_all_records_screen.dart';
import 'package:dudhaganga_app/farmerPages/view_history/view_history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stacked/stacked.dart';

class ViewHistoryFarmerScreen extends StatefulWidget {
  const ViewHistoryFarmerScreen({super.key});

  @override
  State<ViewHistoryFarmerScreen> createState() => _ViewHistoryFarmerScreen();
}

class _ViewHistoryFarmerScreen extends State<ViewHistoryFarmerScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewHistoryModelFarmer>.reactive(
        viewModelBuilder: () => ViewHistoryModelFarmer(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => _body(context, model));
  }

  _body(BuildContext context, ViewHistoryModelFarmer model) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            viewAllRecordsScreen(context, model),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: HomeCard(
                      child: SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'view_All_recrods'.tr,
                            style: TextStyle(fontSize: 40.0),
                          ),
                        ),
                      ),
                    ),
                  )),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => viewAllBillsScreen(context, model),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: HomeCard(
                    child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'view_All_bills'.tr,
                          style: TextStyle(fontSize: 40.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          DDLoader(
            loading: model.isBusy,
          )
        ],
      ),
    );
  }
}

//view bills.
//view records.

import 'package:dudhaganga_app/collectorPages/screens/view_history/view_history_model.dart';
import 'package:dudhaganga_app/customWidgets/ddd_loading.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class ViewHistoryScreen extends StatefulWidget {
  final String? phoneNumber;
  const ViewHistoryScreen({this.phoneNumber, super.key});

  @override
  State<ViewHistoryScreen> createState() => _ViewHistoryScreenState();
}

class _ViewHistoryScreenState extends State<ViewHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewHistoryModel>.reactive(
        viewModelBuilder: () => ViewHistoryModel(),
        onViewModelReady: (model) => model.init(widget.phoneNumber),
        builder: (context, model, child) => _body(context, model));
  }

  _body(BuildContext context, ViewHistoryModel model) {
    return Scaffold(
      body: Stack(
        children: [
          Text("History"),
          DDLoader(
            loading: model.isBusy,
          ),
        ],
      ),
    );
  }
}

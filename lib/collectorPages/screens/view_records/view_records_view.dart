import 'package:dudhaganga_app/collectorPages/screens/view_records/view_records_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/farmer.dart';

class ViewRecordsView extends StatelessWidget {
  final Farmer? farmer;
  const ViewRecordsView({this.farmer, super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewRecordsModel>.reactive(
        viewModelBuilder: () => ViewRecordsModel(),
        onViewModelReady: (model) => model.init(farmer),
        builder: (context, model, child) => _body(context, model));
  }

  Widget _body(context, model) {
    return const Scaffold(
      body: Text("View Reading"),
    );
  }
}

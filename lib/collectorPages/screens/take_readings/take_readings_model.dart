import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/db_sql.dart';
import '../../../constants.dart';
import '../../../models/farmer.dart';
import '../../../models/rate.dart';
import '../../../services/records.dart';
import '../take_rates/take_rates_view.dart';

class TakeReadingModel extends BaseViewModel {
  Farmer? farmer;
  TextEditingController textEditingControllerWeight = TextEditingController();
  TextEditingController textEditingControllerFat = TextEditingController();
  List<String> animals = [];
  String? selectedAnimal;
  bool isFileUploaded = false;
  init(farmer, BuildContext context) async {
    this.farmer = farmer;
    setBusy(true);
    List<Rate>? rates;
    try {
      rates = await DbManager().getModelList();
    } catch (e) {
      print("Fetching rates from DbManager: $e");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const TakeRatesView(),
        ),
      );
    }
    // ignore: use_build_context_synchronously
    checkRates(rates, context);
    setBusy(false);

    if (farmer?.cow == true) {
      animals.add("cow");
    }

    if (farmer?.buffalo == true) {
      animals.add("buffalo");
    }
  }

  void checkRates(List<Rate>? rates, BuildContext context) {
    if (rates == null || rates.isEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const TakeRatesView(),
        ),
      );
    }
  }

  void saveDetails() async {
    setBusy(true);
    bool res = await addMilkRecord(
        farmer,
        double.parse(textEditingControllerWeight.text),
        double.parse(textEditingControllerFat.text),
        selectedAnimal ?? "");
    if (res) {
      snackbarService.showSnackbar(message: "Record added successfully!");
    } else {
      snackbarService.showSnackbar(message: "Unable to add record!");
    }
    setBusy(false);
  }
}

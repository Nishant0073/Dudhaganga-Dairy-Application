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
  double? rate = 0;
  double? snf = 7.1;
  double? value = 0;
  double? fat = 0;
  double? weight = 0;
  List<Rate>? rates;
  init(farmer, BuildContext context) async {
    this.farmer = farmer;
    setBusy(true);

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

  void saveDetails(BuildContext context) async {
    print("$weight $fat");
    setBusy(true);
    try {
      weight = double.parse(textEditingControllerWeight.text);
      fat = double.parse(textEditingControllerFat.text);
      if (weight == null || fat == null || selectedAnimal == null) {
        snackbarService.showSnackbar(message: "Please fill all fields");
        setBusy(false);
        return;
      }

      if (getRateAndValue()) {
        bool res = await addMilkRecord(
          farmer,
          double.parse(textEditingControllerFat.text),
          double.parse(textEditingControllerWeight.text),
          selectedAnimal ?? "",
          thesnf,
          rate,
          value,
        );
        if (res) {
          snackbarService.showSnackbar(message: "Record added successfully!");
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        } else {
          snackbarService.showSnackbar(message: "Unable to add record!");
        }
      } else {
        snackbarService.showSnackbar(message: "Unable to fecth rate!");
      }
    } catch (e) {
      print("Unbale to add record $e");
      snackbarService.showSnackbar(message: "unbale to add reading!");
    }
    setBusy(false);
  }

  bool getRateAndValue() {
    if (rates == null) return false;
    for (var i in rates!) {
      if (i.fat == fat && i.snf == thesnf) {
        rate = i.value ?? 0.0;
        value = ((weight ?? 0) * (rate ?? 0));
      }
    }

    return (rate != 0 && value != 0);
  }
}

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stacked/stacked.dart';

import '../../../constants.dart';
import '../../../farmer.dart';
import '../../../services/records.dart';

class TakeReadingModel extends BaseViewModel {
  Farmer? farmer;
  TextEditingController textEditingControllerWeight = TextEditingController();
  TextEditingController textEditingControllerFat = TextEditingController();
  List<String> animals = [];
  String? selectedAnimal;
  bool isFileUploaded = false;
  init(farmer) async {
    this.farmer = farmer;
    if (farmer?.cow == true) {
      animals.add("cow");
    }


    if (farmer?.buffalo == true) {
      animals.add("buffalo");
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

import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/models/milk_buyer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';

import '../../../services/records.dart';
import '../../../services/sell_milk.dart';

class SellMilkModel extends BaseViewModel {
  double rate = 0;
  MilkBuyer? milkBuyer;

  TextEditingController textEditingControllerWeight = TextEditingController();
  TextEditingController textEditingControllerRate = TextEditingController();
  PageController pageController = PageController();
  GlobalKey globalKeyRate = GlobalKey<FormState>();

  init(MilkBuyer milkBuyerT) async {
    setBusy(true);
    milkBuyer = milkBuyerT;
    rate = await getMilkRate(milkBuyer?.phoneNumber ?? "8329060009");
    print(rate);
    setBusy(false);
  }

  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void prevPage(bool? submit, BuildContext context) async {
    setBusy(true);
    if (submit ?? false) {
      bool isUpdated = await updateMilkRate(textEditingControllerRate.text);
      if (isUpdated) {
        Fluttertoast.showToast(msg: "Rate Updated!");
        if (context.mounted) {
          Navigator.pop(context);
        }
      } else {
        Fluttertoast.showToast(msg: "Unable to update Rate!");
      }
    } else {
      pageController.previousPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    }
    setBusy(false);
  }

  void sellMilk(BuildContext context) async {
    print("HETE");
    setBusy(true);
    bool result = await sellMilkToBuyer(
        amount: getDoubleReDecimaled(
                double.parse(textEditingControllerWeight.text) * rate)
            .toString(),
        phoneNumber: milkBuyer?.phoneNumber ?? "8329060009",
        time: DateTime.now().hour < 15 ? "m" : "e",
        rate: rate.toString(),
        weight: textEditingControllerWeight.text);
    if (result) {
      updateSellMilkAmount(
          getDoubleReDecimaled(
              double.parse(textEditingControllerWeight.text) * rate),
          milkBuyer?.phoneNumber ?? "8329060009");
      Fluttertoast.showToast(msg: "Record Saved!");
    } else {
      Fluttertoast.showToast(msg: "Unable to Save Record!");
    }
    setBusy(false);
    if (context.mounted) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }
}

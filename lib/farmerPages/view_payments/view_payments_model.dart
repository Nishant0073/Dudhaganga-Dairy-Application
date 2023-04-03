import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dudhaganga_app/models/farmer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import '../../../models/transaction.dart';
import '../../../services/firebase_payment.dart';
import '../../constants.dart';
import '../../services/sell_milk.dart';

class ViewPaymenetsModelFarmer extends BaseViewModel {
  Farmer? farmer;
  bool isShowRez = false;
  double? pendingAmount = 0;
  List<AmountTransaction> transactions = [];

  Razorpay? _razorpay;

  TextEditingController amountController = TextEditingController();
  init() async {
    setBusy(true);
    final mainPrefs = await SharedPreferences.getInstance();
    String? phoneNumber = mainPrefs.getString(userCn);
    farmer = await getFarmer(phoneNumber ?? "");
    pendingAmount = await getFarmerPendingAmount(farmer?.phoneNumber ?? "0000");
    await getTransactionHistory(farmer?.phoneNumber ?? "0000");
    notifyListeners();
    setBusy(false);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay?.clear();
  }

  getTransactionHistory(String phoneNumber) async {
    String path = "/Dairy/Dudhaganga/Farmers/$phoneNumber/transactions/";
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(path);
    QuerySnapshot querySnapshot = await collectionReference.get();

    var allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var i in allData) {
      print(i);
      transactions.add(AmountTransaction.fromJson(i as Map<String, dynamic>));
    }
    transactions.sort(((a, b) => DateFormat("yyyy-MM-dd H:m")
        .parse(a.date ?? "12/12/12 12:22")
        .compareTo(
            DateFormat("yyyy-MM-dd H:m").parse(b.date ?? "12/12/12 12:22"))));
    transactions = List.from(transactions.reversed);
    notifyListeners();
  }

  String getfiveDigitString(String string) {
    if (string.length >= 6) return string.substring(0, 6);
    return string;
  }
}
